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
        clk: in std_logic;
        reset: in std_logic;
        data_out: out UNSIGNED(BLOCK_SIZE - 1 downto 0); 
        ready: out std_logic;
        ctr_wrap: out std_logic
    );
end CTRSpeck;

architecture Behavioral of CTRSpeck is
    signal plaintext, ciphertext: UNSIGNED(BLOCK_SIZE - 1 downto 0);
begin

ENC: entity work.Encrypt
     generic map (BLOCK_SIZE, KEY_SIZE)
     port map (
        plaintext => plaintext,
        key => key,
        clk => clk,
        ciphertext => ciphertext
     );

CTR: process(data_in, nonce, clk, reset)
    constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
    constant num_rounds: INTEGER := num_rounds(BLOCK_SIZE, KEY_SIZE);
    constant shift: INTEGER := BLOCK_SIZE;
    variable counter: UNSIGNED(WORD_SIZE downto 0); -- Note that it's one bit larger to detect overflow
    variable shift_reg: UNSIGNED(BLOCK_SIZE * num_rounds - 1 downto 0);
    variable data_in_temp: UNSIGNED(BLOCK_SIZE - 1 downto 0);

    begin
        if reset = '1' then
            counter := to_unsigned(0, counter'length);
            plaintext <= (others => '0');
            ctr_wrap <= '0';
            ready <= '0';
            data_out <= (others => '0');
        else
            plaintext <= nonce & counter(WORD_SIZE - 1 downto 0);
            
            if counter(WORD_SIZE) = '1' then
                ctr_wrap <= '1';
                counter(WORD_SIZE) := '0'; -- Wrap counter for well defined behavior
            else
                ctr_wrap <= '0';
            end if;

            if rising_edge(clk) then
                -- Get the data_in corresponding to the latest output of pipeline
                data_in_temp := shift_reg(BLOCK_SIZE * num_rounds - 1 downto BLOCK_SIZE * (num_rounds - 1)); 

                shift_reg := shift_left(shift_reg, shift);
                
                -- Store the current data_in for when the pipeline is done and results can be xor'ed
                shift_reg(BLOCK_SIZE - 1 downto 0) := data_in;

                if counter >= num_rounds then
                    ready <= '1';
                    data_out <= data_in_temp xor ciphertext;
                else
                    ready <= '0';
                    data_out <= (others => '0');
                end if;

                counter := counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
