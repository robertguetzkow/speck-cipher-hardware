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
-- Create Date: 06.02.2019 11:59:31
-- Module Name: EncryptionRound - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Entity that implements one round of the Speck cipher.
-- 
-- Dependencies: Speck_pkg.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.Speck_pkg.num_rounds;
use work.Speck_pkg.encryption_round;
use work.Speck_pkg.key_schedule_round;


entity EncryptionRound is
    generic (
        BLOCK_SIZE: INTEGER := 64;
        KEY_SIZE: INTEGER := 96
    );
    port
    (
        word_0, word_1: in UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
        subkey_0, subkey_1, subkey_2, subkey_3: in UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
        index: in UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
        clk: in std_logic;
        word_0_out, word_1_out: out UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
        subkey_0_out, subkey_1_out, subkey_2_out, subkey_3_out: out UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0)
    );
end EncryptionRound;

architecture Behavioral of EncryptionRound is
begin

ENC: process(word_0, word_1, subkey_0, subkey_1, subkey_2, subkey_3, index, clk)
        constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
        type SUBKEY_ARRAY is array (3 downto 0) of UNSIGNED(WORD_SIZE - 1 downto 0);
        variable encryption_round_outputs: UNSIGNED(WORD_SIZE * 2 - 1 downto 0);
        variable subkeys_out: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);   
    begin
        if rising_edge(clk) then
            encryption_round_outputs := encryption_round(word_1, word_0, subkey_0, WORD_SIZE);        
    
            subkeys_out := key_schedule_round(subkey_0, 
                                              subkey_1, 
                                              subkey_2,
                                              subkey_3,
                                              index,
                                              KEY_SIZE,
                                              WORD_SIZE);
        
            word_1_out <= encryption_round_outputs(WORD_SIZE - 1 downto 0);
            word_0_out <= encryption_round_outputs(WORD_SIZE * 2 - 1 downto WORD_SIZE);
            
            subkey_0_out <= subkeys_out(WORD_SIZE - 1 downto 0);
            subkey_1_out <= subkeys_out(WORD_SIZE * 2 - 1 downto WORD_SIZE);
            subkey_2_out <= subkeys_out(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2);
            subkey_3_out <= subkeys_out(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3); 
        end if;  
    end process;

end Behavioral;
