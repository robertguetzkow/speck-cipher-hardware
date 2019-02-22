----------------------------------------------------------------------------------
-- MIT License

-- Copyright (c) 2019 Robert Guetzkow, Lennart Vogelsang

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
----------------------------------------------------------------------------------
-- Engineers: Robert Guetzkow, Lennart Vogelsang
-- 
-- Create Date: 29.01.2019 16:09:23
-- Module Name: CTRMode - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Entity that implements a CTR mode for the pipelined Speck cipher.
-- 
-- Dependencies: Encrypt.vhd, Speck_pkg.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.Encrypt;
use work.Speck_pkg.num_rounds;


entity CTRSpeck is
    generic (
        BLOCK_SIZE: INTEGER := 64;
        KEY_SIZE: INTEGER := 96
    );
    port (   
        data_in: in UNSIGNED(BLOCK_SIZE - 1 downto 0);
        key: in UNSIGNED(KEY_SIZE - 1 downto 0);
        nonce: in UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
        valid: in std_logic; -- Indicates new values for data_in, key and nonce are ready to be processed. Inputs are ignored otherwise.
        clk: in std_logic;
        reset: in std_logic;
        data_out: out UNSIGNED(BLOCK_SIZE - 1 downto 0);
        ready: out std_logic; -- Set to '1' when new output is ready
        ctr_wrap: out std_logic -- Set to '1' when counter wraps. When this happens change the nonce!
    );
end CTRSpeck;

architecture Behavioral of CTRSpeck is
    signal plaintext_valid, ciphertext: UNSIGNED(BLOCK_SIZE - 1 downto 0);
    signal key_valid: UNSIGNED(KEY_SIZE - 1 downto 0);
begin

ENC: entity work.Encrypt
     generic map (BLOCK_SIZE, KEY_SIZE)
     port map (
        plaintext => plaintext_valid,
        key => key_valid,
        clk => clk,
        ciphertext => ciphertext
     );

CTR: process(data_in, key, nonce, valid, clk, reset)
    constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
    constant num_rounds: INTEGER := num_rounds(BLOCK_SIZE, KEY_SIZE);
    variable counter: UNSIGNED(WORD_SIZE downto 0); -- Note that it's one bit larger to detect overflow
    
    -- Shift register storing the 'data_in' value. This is necessary because with CTR mode the ('nonce' concat 'counter') gets 
    -- encrypted which is then xor'ed with the plaintext input to form the final ciphertext. Because the encryption pipeline has
    -- a latency of 'num_rounds' clock cycles, the data_in may have changed in the meantime. In order to ensure the original
    -- data_in remains available, it is stored. The shift register stores 'num_rounds' + 1 elements, due to the additional clock 
    -- cycle used for handling signal validity.
    variable shift_reg_data: UNSIGNED(BLOCK_SIZE * (num_rounds + 1) - 1 downto 0);
    
    -- Shift register storing the 'valid' value. This allows to track the progress of values passing through the encryption pipeline.
    -- The valid bit reaches the end of the shift register in the same clock cycles as the corresponding encrypted value is at the 
    -- output of the encryption pipeline. The 'ready' signal can then be enabled to indicate that a new encrypted output is available.
    variable shift_reg_valid: UNSIGNED(num_rounds downto 0);
    
    -- Temporary variables for storing output from the shift register.
    variable data_temp: UNSIGNED(BLOCK_SIZE - 1 downto 0);
    variable valid_temp: std_logic;
    
    -- Temporary variables for storing input signals, once 'valid' is enabled. This allows to put only valid input signals into the
    -- encryption pipeline and therefore output signals from the pipeline are valid as well. Since interfaces such as AXI4-Lite are
    -- not able to write/update all input signals to CTRSpeck within one clock cycle, incomplete updates would be read if there 
    -- wasn't a validity check. In order to avoid the read-write conflict, similar to race conditions in software, updated are only
    -- performed once 'valid' is enabled. Note that after a reset, data may still by in the encryption pipeline, resulting in
    -- output without 'ready' enabled.
    variable data_valid_temp: UNSIGNED(BLOCK_SIZE - 1 downto 0);
    variable key_valid_temp: UNSIGNED(KEY_SIZE - 1 downto 0);

    begin   
        if reset = '1' then
            counter := to_unsigned(0, counter'length);
            shift_reg_valid := to_unsigned(0, shift_reg_valid'length);
            ready <= '0';
            ctr_wrap <= '0';
        else      
            if counter(WORD_SIZE) = '1' then
                -- Once the highest bit is set, the counter is wrapping. This is a security issue and the nonce should be changed to
                -- avoid chosen plaintext attacks.
                ctr_wrap <= '1';
                counter(WORD_SIZE) := '0'; -- Wrap counter for well defined behavior
            else
                ctr_wrap <= '0';
            end if;
            
            if rising_edge(clk) then
                if valid = '1' then
                    data_valid_temp := nonce & counter(WORD_SIZE - 1 downto 0);
                    key_valid_temp := key;
                    counter := counter + 1;
                end if;
            
                -- Get the data_in corresponding to the latest output of the pipeline
                data_temp := shift_reg_data(BLOCK_SIZE * (num_rounds + 1) - 1 downto BLOCK_SIZE * num_rounds);
                
                shift_reg_data := shift_left(shift_reg_data, BLOCK_SIZE);
                
                -- Store the current data_in for when the pipeline is done and results can be xor'ed
                shift_reg_data(BLOCK_SIZE - 1 downto 0) := data_in;
                
                -- Get the valid value corresponding to the latest output of the pipeline
                valid_temp :=  shift_reg_valid(num_rounds);
                
                shift_reg_valid := shift_left(shift_reg_valid, 1);
                 
                -- Store value of valid to check when a new output is ready
                shift_reg_valid(0) := valid;
                
                data_out <= data_temp xor ciphertext;
                
                -- Set ready to valid_temp, which will be '1' when a new value has passed through the pipeline
                ready <= valid_temp;
            end if;
        end if;
        
        -- Set input signals for the encryption pipeline
        plaintext_valid <= data_valid_temp;
        key_valid <= key_valid_temp;
    end process;

end Behavioral;
