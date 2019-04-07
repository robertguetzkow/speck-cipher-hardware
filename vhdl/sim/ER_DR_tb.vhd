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
-- Create Date: 23.01.2019 18:43:46
-- Module Name: ER_DR_tb - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Testbench for encryption and decryption round function.
-- 
-- Dependencies: Speck_pkg.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library work;
use work.Speck_pkg.encryption_round;
use work.Speck_pkg.decryption_round;

entity ER_DR_tb is
end entity ER_DR_tb;

architecture Behavioral of ER_DR_tb is
    signal clk : std_logic := '0';
    constant CLK_HALF_PERIOD: TIME := 5 ns;
begin

clock: process
    begin
        wait for CLK_HALF_PERIOD;
        clk <= not clk; 
    end process;

tb_er_32_64: process
            constant BLOCK_SIZE: INTEGER := 32;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);
    begin
            x := 16x"c53e";
            y := 16x"d755";
            k := 16x"14ba";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=16x"4065") report "16-Bit Encryption Round Test 0 Failed! x_out_16 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=16x"1d32") report "16-Bit Encryption Round Test 0 Failed! y_out_16 has wrong value." severity error;

            x := 16x"4065";
            y := 16x"1d32";
            k := 16x"8490";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=16x"6322") report "16-Bit Encryption Round Test 1 Failed! x_out_16 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=16x"17ea") report "16-Bit Encryption Round Test 1 Failed! y_out_16 has wrong value." severity error;

            x := 16x"6322";
            y := 16x"17ea";
            k := 16x"f8cb";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=16x"a47b") report "16-Bit Encryption Round Test 2 Failed! x_out_16 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=16x"fbd3") report "16-Bit Encryption Round Test 2 Failed! y_out_16 has wrong value." severity error;

            report "16-Bit Encryption Round Test Done." severity note;
        end process;

tb_dr_32_64: process
            constant BLOCK_SIZE: INTEGER := 32;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);
        begin
            x := 16x"a47b";
            y := 16x"fbd3";
            k := 16x"f8cb";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=16x"6322") report "16-Bit Decryption Round Test 0 Failed! x_out_16 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=16x"17ea") report "16-Bit Decryption Round Test 0 Failed! y_out_16 has wrong value." severity error;

            x := 16x"6322";
            y := 16x"17ea";
            k := 16x"8490";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=16x"4065") report "16-Bit Decryption Round Test 1 Failed! x_out_16 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=16x"1d32") report "16-Bit Decryption Round Test 1 Failed! y_out_16 has wrong value." severity error;

            x := 16x"4065";
            y := 16x"1d32";
            k := 16x"14ba";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=16x"c53e") report "16-Bit Decryption Round Test 2 Failed! x_out_16 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=16x"d755") report "16-Bit Decryption Round Test 2 Failed! y_out_16 has wrong value." severity error;

            report "16-Bit Decryption Round Test Done." severity note;
        end process;

tb_er_64_96: process
            constant BLOCK_SIZE: INTEGER := 64;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);
        begin
            x := 32x"7a024204";
            y := 32x"e87a1613";
            k := 32x"81332876";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=32x"6dc73023") report "32-Bit Encryption Round Test 0 Failed! x_out_32 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=32x"2e1780bc") report "32-Bit Encryption Round Test 0 Failed! y_out_32 has wrong value." severity error;

            x := 32x"6dc73023";
            y := 32x"2e1780bc";
            k := 32x"48268673";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=32x"19a3c19f") report "32-Bit Encryption Round Test 1 Failed! x_out_32 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=32x"691fc47e") report "32-Bit Encryption Round Test 1 Failed! y_out_32 has wrong value." severity error;

            x := 32x"19a3c19f";
            y := 32x"691fc47e";
            k := 32x"c17c6279";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=32x"c9450a46") report "32-Bit Encryption Round Test 2 Failed! x_out_32 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=32x"81bb29b5") report "32-Bit Encryption Round Test 2 Failed! y_out_32 has wrong value." severity error;

            report "32-Bit Encryption Round Test Done." severity note;
        end process;

tb_dr_64_96: process
            constant BLOCK_SIZE: INTEGER := 64;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);
        begin
            x := 32x"c9450a46";
            y := 32x"81bb29b5";
            k := 32x"c17c6279";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=32x"19a3c19f") report "32-Bit Decryption Round Test 0 Failed! x_out_32 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=32x"691fc47e") report "32-Bit Decryption Round Test 0 Failed! y_out_32 has wrong value." severity error;

            x := 32x"19a3c19f";
            y := 32x"691fc47e";
            k := 32x"48268673";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=32x"6dc73023") report "32-Bit Decryption Round Test 1 Failed! x_out_32 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=32x"2e1780bc") report "32-Bit Decryption Round Test 1 Failed! y_out_32 has wrong value." severity error;

            x := 32x"6dc73023";
            y := 32x"2e1780bc";
            k := 32x"81332876";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=32x"7a024204") report "32-Bit Decryption Round Test 2 Failed! x_out_32 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=32x"e87a1613") report "32-Bit Decryption Round Test 2 Failed! y_out_32 has wrong value." severity error;

            report "32-Bit Decryption Round Test Done." severity note;
        end process;

tb_er_128_128: process
            constant BLOCK_SIZE: INTEGER := 128;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);
        begin
            x := 64x"cca5a5a19e4d6e3c";
            y := 64x"e6f4590b9a164106";
            k := 64x"5487ce1eaf19922a";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=64x"774730af94ad1c5e") report "64-Bit Encryption Round Test 0 Failed! x_out_64 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=64x"40e5f8f3441f1469") report "64-Bit Encryption Round Test 0 Failed! y_out_64 has wrong value." severity error;

            x := 64x"774730af94ad1c5e";
            y := 64x"40e5f8f3441f1469";
            k := 64x"19c78df48f4ff31e";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=64x"869acdd77cfc329b") report "64-Bit Encryption Round Test 1 Failed! x_out_64 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=64x"81b50a4d5c0491d1") report "64-Bit Encryption Round Test 1 Failed! y_out_64 has wrong value." severity error;

            x := 64x"869acdd77cfc329b";
            y := 64x"81b50a4d5c0491d1";
            k := 64x"e9bb17bca3f2c9bf";
            output := encryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=64x"f480b2a7907347bc") report "64-Bit Encryption Round Test 2 Failed! x_out_64 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=64x"f928e0cd7057c930") report "64-Bit Encryption Round Test 2 Failed! y_out_64 has wrong value." severity error;

            report "64-Bit Encryption Round Test Done." severity note;
        end process;

tb_dr_128_128: process
            constant BLOCK_SIZE: INTEGER := 128;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);
        begin
            x := 64x"f480b2a7907347bc";
            y := 64x"f928e0cd7057c930";
            k := 64x"e9bb17bca3f2c9bf";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=64x"869acdd77cfc329b") report "64-Bit Decryption Round Test 0 Failed! x_out_64 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=64x"81b50a4d5c0491d1") report "64-Bit Decryption Round Test 0 Failed! y_out_64 has wrong value." severity error;

            x := 64x"869acdd77cfc329b";
            y := 64x"81b50a4d5c0491d1";
            k := 64x"19c78df48f4ff31e";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=64x"774730af94ad1c5e") report "64-Bit Decryption Round Test 1 Failed! x_out_64 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=64x"40e5f8f3441f1469") report "64-Bit Decryption Round Test 1 Failed! y_out_64 has wrong value." severity error;

            x := 64x"774730af94ad1c5e";
            y := 64x"40e5f8f3441f1469";
            k := 64x"5487ce1eaf19922a";
            output := decryption_round(x, y, k, WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE - 1 downto 0)=64x"cca5a5a19e4d6e3c") report "64-Bit Decryption Round Test 2 Failed! x_out_64 has wrong value." severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)=64x"e6f4590b9a164106") report "64-Bit Decryption Round Test 2 Failed! y_out_64 has wrong value." severity error;

            report "64-Bit Decryption Round Test Done." severity note;
        end process;

end Behavioral;