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
-- Create Date: 16.01.2019 11:16:31
-- Module Name: Encrypt - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Entity that implements a pipelined Speck cipher.
-- 
-- Dependencies: EncryptionRound.vhd, Speck_pkg.vhd, IEEE.STD_LOGIC_1164,
-- IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.EncryptionRound;
use work.Speck_pkg.num_rounds;


entity Encrypt is
    generic (
        BLOCK_SIZE: INTEGER := 64;
        KEY_SIZE: INTEGER := 96;
        WORD_SIZE: INTEGER := BLOCK_SIZE / 2
    );
    port
    (
        plaintext: in UNSIGNED(BLOCK_SIZE - 1 downto 0);
        key: in UNSIGNED(KEY_SIZE - 1 downto 0);
        clk: in std_logic;
        ciphertext: out UNSIGNED(BLOCK_SIZE - 1 downto 0)
    );
end Encrypt;

architecture Behavioral of Encrypt is
    constant num_rounds: INTEGER := num_rounds(BLOCK_SIZE, KEY_SIZE);
    constant num_keys: INTEGER := KEY_SIZE / WORD_SIZE;
    type TMP_VEC is array (num_rounds downto 0) of UNSIGNED(WORD_SIZE - 1 downto 0);
    
    signal subkey_0, subkey_1, subkey_2, subkey_3: UNSIGNED(WORD_SIZE - 1 downto 0);
    signal round: UNSIGNED(WORD_SIZE - 1 downto 0);
    signal subkey_0_out, subkey_1_out, subkey_2_out, subkey_3_out: UNSIGNED(WORD_SIZE - 1 downto 0); 
    
    signal word_0_arr: TMP_VEC;
    signal word_1_arr: TMP_VEC; 
    signal subkey_0_arr: TMP_VEC;
    signal subkey_1_arr: TMP_VEC;
    signal subkey_2_arr: TMP_VEC;
    signal subkey_3_arr: TMP_VEC;

begin
    G_1: for i in 0 to num_rounds - 1 generate
        ER: entity work.EncryptionRound generic map (BLOCK_SIZE, KEY_SIZE)
            port map (word_0 => word_0_arr(i), 
                      word_1 => word_1_arr(i), 
                      subkey_0 => subkey_0_arr(i),
                      subkey_1 => subkey_1_arr(i),
                      subkey_2 => subkey_2_arr(i),
                      subkey_3 => subkey_3_arr(i),
                      index => to_unsigned(i, WORD_SIZE),
                      clk => clk,
                      word_0_out => word_0_arr(i+1), 
                      word_1_out => word_1_arr(i+1), 
                      subkey_0_out => subkey_0_arr(i+1),
                      subkey_1_out => subkey_1_arr(i+1),
                      subkey_2_out => subkey_2_arr(i+1),
                      subkey_3_out => subkey_3_arr(i+1));
    end generate;

ENC: process(plaintext, key, clk, word_0_arr, word_1_arr)
        type SUBKEYS is array (3 downto 0) of UNSIGNED(WORD_SIZE - 1 downto 0);
        variable subkeys_in: SUBKEYS;
    begin
        word_0_arr(0) <= plaintext(WORD_SIZE - 1 downto 0);
        word_1_arr(0) <= plaintext(WORD_SIZE * 2 - 1 downto WORD_SIZE);

        for i in 0 to num_keys - 1 loop
            subkeys_in(i) := key((i+1) * WORD_SIZE - 1 downto i * WORD_SIZE); 
        end loop;
        
        subkey_0_arr(0) <= subkeys_in(0);
        subkey_1_arr(0) <= subkeys_in(1);
        subkey_2_arr(0) <= subkeys_in(2);
        subkey_3_arr(0) <= subkeys_in(3);   
        
        ciphertext <= word_1_arr(num_rounds) & word_0_arr(num_rounds);
    end process;
    
end Behavioral;
