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
-- Create Date: 23.01.2019 11:16:31
-- Module Name: KeyScheduleRound_tb - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Testbench for the key schedule round function.
-- 
-- Dependencies: Speck_pkg.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
library work;
use work.Speck_pkg.key_schedule_round;

entity KeyScheduleRound_tb is
end KeyScheduleRound_tb;

architecture Behavioral of KeyScheduleRound_tb is    
    signal clk : std_logic := '0';
    constant CLK_HALF_PERIOD: TIME := 5 ns;    
begin

clock: process
    begin
       wait for CLK_HALF_PERIOD;
       clk <= not clk;
    end process;

tb_key_schedule_32_64: process
            constant BLOCK_SIZE: INTEGER := 32;
            constant KEY_SIZE: INTEGER := 64;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 16x"682";
            subkey_1 := 16x"e3e7";
            subkey_2 := 16x"9455";
            subkey_3 := 16x"6baa";
            round := 16x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"cc41") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"d649") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"9455") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"6baa") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 0, Index 3 Failed!" severity error;

            subkey_0 := 16x"cc41";
            subkey_1 := 16x"d649";
            subkey_2 := 16x"9455";
            subkey_3 := 16x"6baa";
            round := 16x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"466f") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"d649") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"7768") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"6baa") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 1, Index 3 Failed!" severity error;

            subkey_0 := 16x"466f";
            subkey_1 := 16x"d649";
            subkey_2 := 16x"7768";
            subkey_3 := 16x"6baa";
            round := 16x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"82f9") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"d649") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"7768") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9b44") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 2, Index 3 Failed!" severity error;

            subkey_0 := 16x"82f9";
            subkey_1 := 16x"d649";
            subkey_2 := 16x"7768";
            subkey_3 := 16x"9b44";
            round := 16x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"1d40") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"16a6") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"7768") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9b44") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 3, Index 3 Failed!" severity error;

            subkey_0 := 16x"1d40";
            subkey_1 := 16x"16a6";
            subkey_2 := 16x"7768";
            subkey_3 := 16x"9b44";
            round := 16x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"9b2a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"16a6") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"ee2a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9b44") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 4, Index 3 Failed!" severity error;

            subkey_0 := 16x"9b2a";
            subkey_1 := 16x"16a6";
            subkey_2 := 16x"ee2a";
            subkey_3 := 16x"9b44";
            round := 16x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"48cf") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"16a6") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"ee2a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"2465") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 5, Index 3 Failed!" severity error;

            subkey_0 := 16x"48cf";
            subkey_1 := 16x"16a6";
            subkey_2 := 16x"ee2a";
            subkey_3 := 16x"2465";
            round := 16x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"b7c7") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"94fa") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"ee2a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"2465") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 6, Index 3 Failed!" severity error;

            subkey_0 := 16x"b7c7";
            subkey_1 := 16x"94fa";
            subkey_2 := 16x"ee2a";
            subkey_3 := 16x"2465";
            round := 16x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"d2ba") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"94fa") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"da4") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"2465") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 7, Index 3 Failed!" severity error;

            subkey_0 := 16x"d2ba";
            subkey_1 := 16x"94fa";
            subkey_2 := 16x"da4";
            subkey_3 := 16x"2465";
            round := 16x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"d7e1") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"94fa") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"da4") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9d0a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 8, Index 3 Failed!" severity error;

            subkey_0 := 16x"d7e1";
            subkey_1 := 16x"94fa";
            subkey_2 := 16x"da4";
            subkey_3 := 16x"9d0a";
            round := 16x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"9284") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"cd03") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"da4") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9d0a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 9, Index 3 Failed!" severity error;

            subkey_0 := 16x"9284";
            subkey_1 := 16x"cd03";
            subkey_2 := 16x"da4";
            subkey_3 := 16x"9d0a";
            round := 16x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"9087") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"cd03") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"da95") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9d0a") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 10, Index 3 Failed!" severity error;

            subkey_0 := 16x"9087";
            subkey_1 := 16x"cd03";
            subkey_2 := 16x"da95";
            subkey_3 := 16x"9d0a";
            round := 16x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"e7d4") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"cd03") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"da95") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"a5ca") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 11, Index 3 Failed!" severity error;

            subkey_0 := 16x"e7d4";
            subkey_1 := 16x"cd03";
            subkey_2 := 16x"da95";
            subkey_3 := 16x"a5ca";
            round := 16x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"7031") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"ef62") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"da95") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"a5ca") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 12, Index 3 Failed!" severity error;

            subkey_0 := 16x"7031";
            subkey_1 := 16x"ef62";
            subkey_2 := 16x"da95";
            subkey_3 := 16x"a5ca";
            round := 16x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"5b2e") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"ef62") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"9beb") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"a5ca") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 13, Index 3 Failed!" severity error;

            subkey_0 := 16x"5b2e";
            subkey_1 := 16x"ef62";
            subkey_2 := 16x"9beb";
            subkey_3 := 16x"a5ca";
            round := 16x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"9cce") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"ef62") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"9beb") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"f077") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 14, Index 3 Failed!" severity error;

            subkey_0 := 16x"9cce";
            subkey_1 := 16x"ef62";
            subkey_2 := 16x"9beb";
            subkey_3 := 16x"f077";
            round := 16x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"1199") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"62a3") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"9beb") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"f077") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 15, Index 3 Failed!" severity error;

            subkey_0 := 16x"1199";
            subkey_1 := 16x"62a3";
            subkey_2 := 16x"9beb";
            subkey_3 := 16x"f077";
            round := 16x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"aea4") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"62a3") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"e8c0") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"f077") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 16, Index 3 Failed!" severity error;

            subkey_0 := 16x"aea4";
            subkey_1 := 16x"62a3";
            subkey_2 := 16x"e8c0";
            subkey_3 := 16x"f077";
            round := 16x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"2407") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"62a3") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"e8c0") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9e95") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 17, Index 3 Failed!" severity error;

            subkey_0 := 16x"2407";
            subkey_1 := 16x"62a3";
            subkey_2 := 16x"e8c0";
            subkey_3 := 16x"9e95";
            round := 16x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"fac2") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"6ade") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"e8c0") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9e95") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 18, Index 3 Failed!" severity error;

            subkey_0 := 16x"fac2";
            subkey_1 := 16x"6ade";
            subkey_2 := 16x"e8c0";
            subkey_3 := 16x"9e95";
            round := 16x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"978b") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"6ade") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"7c80") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"9e95") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 19, Index 3 Failed!" severity error;

            subkey_0 := 16x"978b";
            subkey_1 := 16x"6ade";
            subkey_2 := 16x"7c80";
            subkey_3 := 16x"9e95";
            round := 16x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"9cf2") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"6ade") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"7c80") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"c2dc") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 20, Index 3 Failed!" severity error;

            subkey_0 := 16x"9cf2";
            subkey_1 := 16x"6ade";
            subkey_2 := 16x"7c80";
            subkey_3 := 16x"c2dc";
            round := 16x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=16x"2a18") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=16x"59d2") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=16x"7c80") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=16x"c2dc") report "32-Bit Block, 64-Bit Key, Key Schedule Round Test 21, Index 3 Failed!" severity error;

            report "32-Bit Block, 64-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_48_72: process
            constant BLOCK_SIZE: INTEGER := 48;
            constant KEY_SIZE: INTEGER := 72;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 24x"a70639";
            subkey_1 := 24x"3d60c8";
            subkey_2 := 24x"9bd471";
            round := 24x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"577254") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"6f4399") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"9bd471") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;

            subkey_0 := 24x"577254";
            subkey_1 := 24x"6f4399";
            subkey_2 := 24x"9bd471";
            round := 24x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"729c8b") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"6f4399") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"c90e29") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;

            subkey_0 := 24x"729c8b";
            subkey_1 := 24x"6f4399";
            subkey_2 := 24x"c90e29";
            round := 24x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"98ef97") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"c0bcc") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"c90e29") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;

            subkey_0 := 24x"98ef97";
            subkey_1 := 24x"c0bcc";
            subkey_2 := 24x"c90e29";
            round := 24x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"5c41a") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"c0bcc") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"c2b8a6") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;

            subkey_0 := 24x"5c41a";
            subkey_1 := 24x"c0bcc";
            subkey_2 := 24x"c2b8a6";
            round := 24x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"fff0f1") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"d1d021") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"c2b8a6") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;

            subkey_0 := 24x"fff0f1";
            subkey_1 := 24x"d1d021";
            subkey_2 := 24x"c2b8a6";
            round := 24x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"593423") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"d1d021") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"a6b3ac") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;

            subkey_0 := 24x"593423";
            subkey_1 := 24x"d1d021";
            subkey_2 := 24x"a6b3ac";
            round := 24x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"b2a4ef") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"7b05f5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"a6b3ac") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;

            subkey_0 := 24x"b2a4ef";
            subkey_1 := 24x"7b05f5";
            subkey_2 := 24x"a6b3ac";
            round := 24x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"ca6cd8") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"7b05f5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"5f4ba5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;

            subkey_0 := 24x"ca6cd8";
            subkey_1 := 24x"7b05f5";
            subkey_2 := 24x"5f4ba5";
            round := 24x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"ec8113") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"bfe7d5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"5f4ba5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;

            subkey_0 := 24x"ec8113";
            subkey_1 := 24x"bfe7d5";
            subkey_2 := 24x"5f4ba5";
            round := 24x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"f5e8c8") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"bfe7d5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"91e057") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;

            subkey_0 := 24x"f5e8c8";
            subkey_1 := 24x"bfe7d5";
            subkey_2 := 24x"91e057";
            round := 24x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"64eee2") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"cba8a5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"91e057") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;

            subkey_0 := 24x"64eee2";
            subkey_1 := 24x"cba8a5";
            subkey_2 := 24x"91e057";
            round := 24x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"9bf7da") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"cba8a5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"bc80c9") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;

            subkey_0 := 24x"9bf7da";
            subkey_1 := 24x"cba8a5";
            subkey_2 := 24x"bc80c9";
            round := 24x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"9e7d5a") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"41c38e") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"bc80c9") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;

            subkey_0 := 24x"9e7d5a";
            subkey_1 := 24x"41c38e";
            subkey_2 := 24x"bc80c9";
            round := 24x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"9bd303") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"41c38e") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"6839d7") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;

            subkey_0 := 24x"9bd303";
            subkey_1 := 24x"41c38e";
            subkey_2 := 24x"6839d7";
            round := 24x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"f48cd4") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"2a14c8") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"6839d7") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;

            subkey_0 := 24x"f48cd4";
            subkey_1 := 24x"2a14c8";
            subkey_2 := 24x"6839d7";
            round := 24x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"6f93a5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"2a14c8") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"cbf502") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;

            subkey_0 := 24x"6f93a5";
            subkey_1 := 24x"2a14c8";
            subkey_2 := 24x"cbf502";
            round := 24x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"4b2082") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"37bda9") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"cbf502") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;

            subkey_0 := 24x"4b2082";
            subkey_1 := 24x"37bda9";
            subkey_2 := 24x"cbf502";
            round := 24x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"14e874") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"37bda9") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4dec66") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;

            subkey_0 := 24x"14e874";
            subkey_1 := 24x"37bda9";
            subkey_2 := 24x"4dec66";
            round := 24x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"196383") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"be2023") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4dec66") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;

            subkey_0 := 24x"196383";
            subkey_1 := 24x"be2023";
            subkey_2 := 24x"4dec66";
            round := 24x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"b4ad64") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"be2023") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"7fb17c") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;

            subkey_0 := 24x"b4ad64";
            subkey_1 := 24x"be2023";
            subkey_2 := 24x"7fb17c";
            round := 24x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"7d00b5") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"d86b90") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"7fb17c") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;

            subkey_0 := 24x"7d00b5";
            subkey_1 := 24x"d86b90";
            subkey_2 := 24x"7fb17c";
            round := 24x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"1185d8") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"d86b90") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f98073") report "48-Bit Block, 72-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;

            report "48-Bit Block, 72-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_48_96: process
            constant BLOCK_SIZE: INTEGER := 48;
            constant KEY_SIZE: INTEGER := 96;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 24x"46d424";
            subkey_1 := 24x"6e3c18";
            subkey_2 := 24x"a19e4d";
            subkey_3 := 24x"cca5a5";
            round := 24x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"69e342") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"5f4260") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"a19e4d") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"cca5a5") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 3 Failed!" severity error;

            subkey_0 := 24x"69e342";
            subkey_1 := 24x"5f4260";
            subkey_2 := 24x"a19e4d";
            subkey_3 := 24x"cca5a5";
            round := 24x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"f89ef2") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"5f4260") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"b784e1") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"cca5a5") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 3 Failed!" severity error;

            subkey_0 := 24x"f89ef2";
            subkey_1 := 24x"5f4260";
            subkey_2 := 24x"b784e1";
            subkey_3 := 24x"cca5a5";
            round := 24x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"5a9c02") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"5f4260") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"b784e1") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"9e6b95") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 3 Failed!" severity error;

            subkey_0 := 24x"5a9c02";
            subkey_1 := 24x"5f4260";
            subkey_2 := 24x"b784e1";
            subkey_3 := 24x"9e6b95";
            round := 24x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"6e1b55") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"bafb47") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"b784e1") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"9e6b95") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 3 Failed!" severity error;

            subkey_0 := 24x"6e1b55";
            subkey_1 := 24x"bafb47";
            subkey_2 := 24x"b784e1";
            subkey_3 := 24x"9e6b95";
            round := 24x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"3f0876") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"bafb47") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4fd2dd") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"9e6b95") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 3 Failed!" severity error;

            subkey_0 := 24x"3f0876";
            subkey_1 := 24x"bafb47";
            subkey_2 := 24x"4fd2dd";
            subkey_3 := 24x"9e6b95";
            round := 24x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"2ce555") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"bafb47") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4fd2dd") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"d4a6e4") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 3 Failed!" severity error;

            subkey_0 := 24x"2ce555";
            subkey_1 := 24x"bafb47";
            subkey_2 := 24x"4fd2dd";
            subkey_3 := 24x"d4a6e4";
            round := 24x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"138aff") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"74a056") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4fd2dd") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"d4a6e4") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 3 Failed!" severity error;

            subkey_0 := 24x"138aff";
            subkey_1 := 24x"74a056";
            subkey_2 := 24x"4fd2dd";
            subkey_3 := 24x"d4a6e4";
            round := 24x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"6c8d2e") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"74a056") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f0dad6") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"d4a6e4") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 3 Failed!" severity error;

            subkey_0 := 24x"6c8d2e";
            subkey_1 := 24x"74a056";
            subkey_2 := 24x"f0dad6";
            subkey_3 := 24x"d4a6e4";
            round := 24x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"3508af") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"74a056") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f0dad6") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"5161dc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 3 Failed!" severity error;

            subkey_0 := 24x"3508af";
            subkey_1 := 24x"74a056";
            subkey_2 := 24x"f0dad6";
            subkey_3 := 24x"5161dc";
            round := 24x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"23383f") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"8b7d46") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f0dad6") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"5161dc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 3 Failed!" severity error;

            subkey_0 := 24x"23383f";
            subkey_1 := 24x"8b7d46";
            subkey_2 := 24x"f0dad6";
            subkey_3 := 24x"5161dc";
            round := 24x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"e3e8ea") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"8b7d46") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"fa2913") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"5161dc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 3 Failed!" severity error;

            subkey_0 := 24x"e3e8ea";
            subkey_1 := 24x"8b7d46";
            subkey_2 := 24x"fa2913";
            subkey_3 := 24x"5161dc";
            round := 24x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"df7d17") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"8b7d46") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"fa2913") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"c03a40") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 3 Failed!" severity error;

            subkey_0 := 24x"df7d17";
            subkey_1 := 24x"8b7d46";
            subkey_2 := 24x"fa2913";
            subkey_3 := 24x"c03a40";
            round := 24x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"dde026") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"260898") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"fa2913") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"c03a40") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 3 Failed!" severity error;

            subkey_0 := 24x"dde026";
            subkey_1 := 24x"260898";
            subkey_2 := 24x"fa2913";
            subkey_3 := 24x"c03a40";
            round := 24x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"1edb74") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"260898") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f1da42") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"c03a40") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 3 Failed!" severity error;

            subkey_0 := 24x"1edb74";
            subkey_1 := 24x"260898";
            subkey_2 := 24x"f1da42";
            subkey_3 := 24x"c03a40";
            round := 24x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"a94000") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"260898") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f1da42") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"5f9ba0") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 3 Failed!" severity error;

            subkey_0 := 24x"a94000";
            subkey_1 := 24x"260898";
            subkey_2 := 24x"f1da42";
            subkey_3 := 24x"5f9ba0";
            round := 24x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"b6602") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"416607") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"f1da42") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"5f9ba0") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 3 Failed!" severity error;

            subkey_0 := 24x"b6602";
            subkey_1 := 24x"416607";
            subkey_2 := 24x"f1da42";
            subkey_3 := 24x"5f9ba0";
            round := 24x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"1567dc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"416607") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4e57cc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"5f9ba0") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 3 Failed!" severity error;

            subkey_0 := 24x"1567dc";
            subkey_1 := 24x"416607";
            subkey_2 := 24x"4e57cc";
            subkey_3 := 24x"5f9ba0";
            round := 24x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"1ef986") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"416607") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4e57cc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"b5c766") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 3 Failed!" severity error;

            subkey_0 := 24x"1ef986";
            subkey_1 := 24x"416607";
            subkey_2 := 24x"4e57cc";
            subkey_3 := 24x"b5c766";
            round := 24x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"d1f6ce") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"263afe") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"4e57cc") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"b5c766") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 3 Failed!" severity error;

            subkey_0 := 24x"d1f6ce";
            subkey_1 := 24x"263afe";
            subkey_2 := 24x"4e57cc";
            subkey_3 := 24x"b5c766";
            round := 24x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"11f340") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"263afe") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"9e4536") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"b5c766") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 3 Failed!" severity error;

            subkey_0 := 24x"11f340";
            subkey_1 := 24x"263afe";
            subkey_2 := 24x"9e4536";
            subkey_3 := 24x"b5c766";
            round := 24x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"f73313") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"263afe") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"9e4536") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"78a913") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 3 Failed!" severity error;

            subkey_0 := 24x"f73313";
            subkey_1 := 24x"263afe";
            subkey_2 := 24x"9e4536";
            subkey_3 := 24x"78a913";
            round := 24x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"4cc1c7") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"f55958") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"9e4536") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"78a913") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 3 Failed!" severity error;

            subkey_0 := 24x"4cc1c7";
            subkey_1 := 24x"f55958";
            subkey_2 := 24x"9e4536";
            subkey_3 := 24x"78a913";
            round := 24x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=24x"e56e20") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=24x"f55958") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=24x"83601a") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=24x"78a913") report "48-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 3 Failed!" severity error;

            report "48-Bit Block, 96-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_64_96: process
            constant BLOCK_SIZE: INTEGER := 64;
            constant KEY_SIZE: INTEGER := 96;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 32x"5487ce1e";
            subkey_1 := 32x"78de5857";
            subkey_2 := 32x"8f4ff31e";
            round := 32x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"83edc84") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"ac00ac76") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"8f4ff31e") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;

            subkey_0 := 32x"83edc84";
            subkey_1 := 32x"ac00ac76";
            subkey_2 := 32x"8f4ff31e";
            round := 32x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"6738c856") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"ac00ac76") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"26ce2c76") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;

            subkey_0 := 32x"6738c856";
            subkey_1 := 32x"ac00ac76";
            subkey_2 := 32x"26ce2c76";
            round := 32x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"e4228bb3") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"dde4c900") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"26ce2c76") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;

            subkey_0 := 32x"e4228bb3";
            subkey_1 := 32x"dde4c900";
            subkey_2 := 32x"26ce2c76";
            round := 32x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"7b5d0443") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"dde4c900") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"5a4959dc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;

            subkey_0 := 32x"7b5d0443";
            subkey_1 := 32x"dde4c900";
            subkey_2 := 32x"5a4959dc";
            round := 32x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"a6d2cb13") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"7c3ae908") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"5a4959dc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;

            subkey_0 := 32x"a6d2cb13";
            subkey_1 := 32x"7c3ae908";
            subkey_2 := 32x"5a4959dc";
            round := 32x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"b5bb4cf4") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"7c3ae908") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"832d1469") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;

            subkey_0 := 32x"b5bb4cf4";
            subkey_1 := 32x"7c3ae908";
            subkey_2 := 32x"832d1469";
            round := 32x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"13ede07e") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"be3787db") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"832d1469") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;

            subkey_0 := 32x"13ede07e";
            subkey_1 := 32x"be3787db";
            subkey_2 := 32x"832d1469";
            round := 32x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"e21e0e65") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"be3787db") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"7d710d95") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;

            subkey_0 := 32x"e21e0e65";
            subkey_1 := 32x"be3787db";
            subkey_2 := 32x"7d710d95";
            round := 32x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"ad2c36cb") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"bddc45e4") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"7d710d95") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;

            subkey_0 := 32x"ad2c36cb";
            subkey_1 := 32x"bddc45e4";
            subkey_2 := 32x"7d710d95";
            round := 32x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"2bc8118c") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"bddc45e4") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"42a9a7d1") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;

            subkey_0 := 32x"2bc8118c";
            subkey_1 := 32x"bddc45e4";
            subkey_2 := 32x"42a9a7d1";
            round := 32x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"4ec561ba") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"1085eddb") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"42a9a7d1") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;

            subkey_0 := 32x"4ec561ba";
            subkey_1 := 32x"1085eddb";
            subkey_2 := 32x"42a9a7d1";
            round := 32x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"562306b8") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"1085eddb") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"20080b6a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;

            subkey_0 := 32x"562306b8";
            subkey_1 := 32x"1085eddb";
            subkey_2 := 32x"20080b6a";
            round := 32x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"802bb96b") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"31338ca9") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"20080b6a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;

            subkey_0 := 32x"802bb96b";
            subkey_1 := 32x"31338ca9";
            subkey_2 := 32x"20080b6a";
            round := 32x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"eb160a27") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"31338ca9") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"ea4bc17b") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;

            subkey_0 := 32x"eb160a27";
            subkey_1 := 32x"31338ca9";
            subkey_2 := 32x"ea4bc17b";
            round := 32x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"ccf76c82") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"94473dbd") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"ea4bc17b") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;

            subkey_0 := 32x"ccf76c82";
            subkey_1 := 32x"94473dbd";
            subkey_2 := 32x"ea4bc17b";
            round := 32x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"2f5adc5a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"94473dbd") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"48e1b84c") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;

            subkey_0 := 32x"2f5adc5a";
            subkey_1 := 32x"94473dbd";
            subkey_2 := 32x"48e1b84c";
            round := 32x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"9639c156") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"ecef2387") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"48e1b84c") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;

            subkey_0 := 32x"9639c156";
            subkey_1 := 32x"ecef2387";
            subkey_2 := 32x"48e1b84c";
            round := 32x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"534ca9ab") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"ecef2387") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"e282a31f") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;

            subkey_0 := 32x"534ca9ab";
            subkey_1 := 32x"ecef2387";
            subkey_2 := 32x"e282a31f";
            round := 32x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"415cd586") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"db3998dc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"e282a31f") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;

            subkey_0 := 32x"415cd586";
            subkey_1 := 32x"db3998dc";
            subkey_2 := 32x"e282a31f";
            round := 32x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"6bd9f408") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"db3998dc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"613f583a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;

            subkey_0 := 32x"6bd9f408";
            subkey_1 := 32x"db3998dc";
            subkey_2 := 32x"613f583a";
            round := 32x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"167a8df7") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"48b52db4") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"613f583a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;

            subkey_0 := 32x"167a8df7";
            subkey_1 := 32x"48b52db4";
            subkey_2 := 32x"613f583a";
            round := 32x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"e30fa2e2") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"48b52db4") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"50dbcd5a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;

            subkey_0 := 32x"e30fa2e2";
            subkey_1 := 32x"48b52db4";
            subkey_2 := 32x"50dbcd5a";
            round := 32x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"8f254f0e") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"97585819") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"50dbcd5a") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 2 Failed!" severity error;

            subkey_0 := 32x"8f254f0e";
            subkey_1 := 32x"97585819";
            subkey_2 := 32x"50dbcd5a";
            round := 32x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"905c52b8") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"97585819") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"e9762acc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 23, Index 2 Failed!" severity error;

            subkey_0 := 32x"905c52b8";
            subkey_1 := 32x"97585819";
            subkey_2 := 32x"e9762acc";
            round := 32x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"2b113ecc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"a9f3ab08") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"e9762acc") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 24, Index 2 Failed!" severity error;

            subkey_0 := 32x"2b113ecc";
            subkey_1 := 32x"a9f3ab08";
            subkey_2 := 32x"e9762acc";
            round := 32x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"af73428e") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"a9f3ab08") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"f7fab4ef") report "64-Bit Block, 96-Bit Key, Key Schedule Round Test 25, Index 2 Failed!" severity error;

            report "64-Bit Block, 96-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_64_128: process
            constant BLOCK_SIZE: INTEGER := 64;
            constant KEY_SIZE: INTEGER := 128;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 32x"e9bb17bc";
            subkey_1 := 32x"3458a748";
            subkey_2 := 32x"f77383c1";
            subkey_3 := 32x"8d723104";
            round := 32x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"7c37cd84") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"31ef7063") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"f77383c1") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"8d723104") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 0, Index 3 Failed!" severity error;

            subkey_0 := 32x"7c37cd84";
            subkey_1 := 32x"31ef7063";
            subkey_2 := 32x"f77383c1";
            subkey_3 := 32x"8d723104";
            round := 32x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"df912d25") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"31ef7063") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"3e2f4106") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"8d723104") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 1, Index 3 Failed!" severity error;

            subkey_0 := 32x"df912d25";
            subkey_1 := 32x"31ef7063";
            subkey_2 := 32x"3e2f4106";
            subkey_3 := 32x"8d723104";
            round := 32x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"1897f67a") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"31ef7063") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"3e2f4106") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"e41e9f54") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 2, Index 3 Failed!" severity error;

            subkey_0 := 32x"1897f67a";
            subkey_1 := 32x"31ef7063";
            subkey_2 := 32x"3e2f4106";
            subkey_3 := 32x"e41e9f54";
            round := 32x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"bf765639") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"7bc9e5e9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"3e2f4106") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"e41e9f54") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 3, Index 3 Failed!" severity error;

            subkey_0 := 32x"bf765639";
            subkey_1 := 32x"7bc9e5e9";
            subkey_2 := 32x"3e2f4106";
            subkey_3 := 32x"e41e9f54";
            round := 32x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"3e0634b3") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"7bc9e5e9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"c5b4857e") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"e41e9f54") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 4, Index 3 Failed!" severity error;

            subkey_0 := 32x"3e0634b3";
            subkey_1 := 32x"7bc9e5e9";
            subkey_2 := 32x"c5b4857e";
            subkey_3 := 32x"e41e9f54";
            round := 32x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"62dbf6ce") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"7bc9e5e9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"c5b4857e") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"92ea5357") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 5, Index 3 Failed!" severity error;

            subkey_0 := 32x"62dbf6ce";
            subkey_1 := 32x"7bc9e5e9";
            subkey_2 := 32x"c5b4857e";
            subkey_3 := 32x"92ea5357";
            round := 32x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"5a8876c6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"4c57c0b5") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"c5b4857e") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"92ea5357") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 6, Index 3 Failed!" severity error;

            subkey_0 := 32x"5a8876c6";
            subkey_1 := 32x"4c57c0b5";
            subkey_2 := 32x"c5b4857e";
            subkey_3 := 32x"92ea5357";
            round := 32x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"d0d9d7e") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"4c57c0b5") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"d94e2b4c") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"92ea5357") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 7, Index 3 Failed!" severity error;

            subkey_0 := 32x"d0d9d7e";
            subkey_1 := 32x"4c57c0b5";
            subkey_2 := 32x"d94e2b4c";
            subkey_3 := 32x"92ea5357";
            round := 32x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"ccc6c29") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"4c57c0b5") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"d94e2b4c") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"64a087d9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 8, Index 3 Failed!" severity error;

            subkey_0 := 32x"ccc6c29";
            subkey_1 := 32x"4c57c0b5";
            subkey_2 := 32x"d94e2b4c";
            subkey_3 := 32x"64a087d9";
            round := 32x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"a47ba2a8") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"c218c3e0") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"d94e2b4c") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"64a087d9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 9, Index 3 Failed!" severity error;

            subkey_0 := 32x"a47ba2a8";
            subkey_1 := 32x"c218c3e0";
            subkey_2 := 32x"d94e2b4c";
            subkey_3 := 32x"64a087d9";
            round := 32x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"d289e59c") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"c218c3e0") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"f154f0d9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"64a087d9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 10, Index 3 Failed!" severity error;

            subkey_0 := 32x"d289e59c";
            subkey_1 := 32x"c218c3e0";
            subkey_2 := 32x"f154f0d9";
            subkey_3 := 32x"64a087d9";
            round := 32x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"3fa1aace") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"c218c3e0") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"f154f0d9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"abee8628") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 11, Index 3 Failed!" severity error;

            subkey_0 := 32x"3fa1aace";
            subkey_1 := 32x"c218c3e0";
            subkey_2 := 32x"f154f0d9";
            subkey_3 := 32x"abee8628";
            round := 32x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"dd6e95ec") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"2063c39d") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"f154f0d9") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"abee8628") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 12, Index 3 Failed!" severity error;

            subkey_0 := 32x"dd6e95ec";
            subkey_1 := 32x"2063c39d";
            subkey_2 := 32x"f154f0d9";
            subkey_3 := 32x"abee8628";
            round := 32x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"5c2b45b7") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"2063c39d") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"b75fead1") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"abee8628") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 13, Index 3 Failed!" severity error;

            subkey_0 := 32x"5c2b45b7";
            subkey_1 := 32x"2063c39d";
            subkey_2 := 32x"b75fead1";
            subkey_3 := 32x"abee8628";
            round := 32x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"658d1989") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"2063c39d") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"b75fead1") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"84d73433") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 14, Index 3 Failed!" severity error;

            subkey_0 := 32x"658d1989";
            subkey_1 := 32x"2063c39d";
            subkey_2 := 32x"b75fead1";
            subkey_3 := 32x"84d73433";
            round := 32x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"2ec5b108") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"2ad7d43") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"b75fead1") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"84d73433") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 15, Index 3 Failed!" severity error;

            subkey_0 := 32x"2ec5b108";
            subkey_1 := 32x"2ad7d43";
            subkey_2 := 32x"b75fead1";
            subkey_3 := 32x"84d73433";
            round := 32x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"765098a3") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"2ad7d43") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"7d10e2") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"84d73433") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 16, Index 3 Failed!" severity error;

            subkey_0 := 32x"765098a3";
            subkey_1 := 32x"2ad7d43";
            subkey_2 := 32x"7d10e2";
            subkey_3 := 32x"84d73433";
            round := 32x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"1b51aadd") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"2ad7d43") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"7d10e2") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"a9d56fc6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 17, Index 3 Failed!" severity error;

            subkey_0 := 32x"1b51aadd";
            subkey_1 := 32x"2ad7d43";
            subkey_2 := 32x"7d10e2";
            subkey_3 := 32x"a9d56fc6";
            round := 32x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"84d90ea0") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"5e545848") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"7d10e2") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"a9d56fc6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 18, Index 3 Failed!" severity error;

            subkey_0 := 32x"84d90ea0";
            subkey_1 := 32x"5e545848";
            subkey_2 := 32x"7d10e2";
            subkey_3 := 32x"a9d56fc6";
            round := 32x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"4011fea7") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"5e545848") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"66d98ba3") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"a9d56fc6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 19, Index 3 Failed!" severity error;

            subkey_0 := 32x"4011fea7";
            subkey_1 := 32x"5e545848";
            subkey_2 := 32x"66d98ba3";
            subkey_3 := 32x"a9d56fc6";
            round := 32x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"6342138") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"5e545848") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"66d98ba3") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"6bbd402") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 20, Index 3 Failed!" severity error;

            subkey_0 := 32x"6342138";
            subkey_1 := 32x"5e545848";
            subkey_2 := 32x"66d98ba3";
            subkey_3 := 32x"6bbd402";
            round := 32x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"7f337c45") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"4e927585") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"66d98ba3") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"6bbd402") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 21, Index 3 Failed!" severity error;

            subkey_0 := 32x"7f337c45";
            subkey_1 := 32x"4e927585";
            subkey_2 := 32x"66d98ba3";
            subkey_3 := 32x"6bbd402";
            round := 32x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"db01b7ed") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"4e927585") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"229a55c6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 22, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"6bbd402") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 22, Index 3 Failed!" severity error;

            subkey_0 := 32x"db01b7ed";
            subkey_1 := 32x"4e927585";
            subkey_2 := 32x"229a55c6";
            subkey_3 := 32x"6bbd402";
            round := 32x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"505ccb8") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"4e927585") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"229a55c6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 23, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"dd0873d6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 23, Index 3 Failed!" severity error;

            subkey_0 := 32x"505ccb8";
            subkey_1 := 32x"4e927585";
            subkey_2 := 32x"229a55c6";
            subkey_3 := 32x"dd0873d6";
            round := 32x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"a27a3af5") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"8a545f35") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"229a55c6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 24, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"dd0873d6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 24, Index 3 Failed!" severity error;

            subkey_0 := 32x"a27a3af5";
            subkey_1 := 32x"8a545f35";
            subkey_2 := 32x"229a55c6";
            subkey_3 := 32x"dd0873d6";
            round := 32x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"7b4d02fe") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"8a545f35") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"689cd553") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 25, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"dd0873d6") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 25, Index 3 Failed!" severity error;

            subkey_0 := 32x"7b4d02fe";
            subkey_1 := 32x"8a545f35";
            subkey_2 := 32x"689cd553";
            subkey_3 := 32x"dd0873d6";
            round := 32x"1a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=32x"88421c98") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 26, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=32x"8a545f35") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 26, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=32x"689cd553") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 26, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=32x"522a0b6b") report "64-Bit Block, 128-Bit Key, Key Schedule Round Test 26, Index 3 Failed!" severity error;

            report "64-Bit Block, 128-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_96_96: process
            constant BLOCK_SIZE: INTEGER := 96;
            constant KEY_SIZE: INTEGER := 96;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 48x"f39e71545a13";
            subkey_1 := 48x"85776e9add84";
            round := 48x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"e4d06260246f") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"7823e8c2f4f0") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;

            subkey_0 := 48x"e4d06260246f";
            subkey_1 := 48x"7823e8c2f4f0";
            round := 48x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"f3cb9549c41d") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"d5488648e762") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;

            subkey_0 := 48x"f3cb9549c41d";
            subkey_1 := 48x"d5488648e762";
            round := 48x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"c8fc779e2de9") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"56a0ddd00d06") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;

            subkey_0 := 48x"c8fc779e2de9";
            subkey_1 := 48x"56a0ddd00d06";
            round := 48x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"88b0a48a92bb") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"cf53187bfdf5") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;

            subkey_0 := 48x"88b0a48a92bb";
            subkey_1 := 48x"cf53187bfdf5";
            round := 48x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"3bfad3f79b60") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"7e7ff7a30ebc") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;

            subkey_0 := 48x"3bfad3f79b60";
            subkey_1 := 48x"7e7ff7a30ebc";
            round := 48x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"27afcc53e56a") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"f87953ef3e6b") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;

            subkey_0 := 48x"27afcc53e56a";
            subkey_1 := 48x"f87953ef3e6b";
            round := 48x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"aed62738ffff") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"93a845a7d4ae") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;

            subkey_0 := 48x"aed62738ffff";
            subkey_1 := 48x"93a845a7d4ae";
            round := 48x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"2bd8f6b95829") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"5d69cf7ea7d4") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;

            subkey_0 := 48x"2bd8f6b95829";
            subkey_1 := 48x"5d69cf7ea7d4";
            round := 48x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"5ef1d5421791") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"366088d6d8") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;

            subkey_0 := 48x"5ef1d5421791";
            subkey_1 := 48x"366088d6d8";
            round := 48x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"c17ca1b21ce4") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"36f20ba2a06e") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;

            subkey_0 := 48x"c17ca1b21ce4";
            subkey_1 := 48x"36f20ba2a06e";
            round := 48x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"24569e2d58a8") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"2fb393bdbf8e") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;

            subkey_0 := 48x"24569e2d58a8";
            subkey_1 := 48x"2fb393bdbf8e";
            round := 48x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"9032a0abd32d") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"b28651c1166c") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;

            subkey_0 := 48x"9032a0abd32d";
            subkey_1 := 48x"b28651c1166c";
            round := 48x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"7d7023a30d23") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"fce526fd944f") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;

            subkey_0 := 48x"7d7023a30d23";
            subkey_1 := 48x"fce526fd944f";
            round := 48x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"26ec15d263a1") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"cd6d08ca0aba") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;

            subkey_0 := 48x"26ec15d263a1";
            subkey_1 := 48x"cd6d08ca0aba";
            round := 48x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"d6d92c4830ac") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"e1b982db2da5") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;

            subkey_0 := 48x"d6d92c4830ac";
            subkey_1 := 48x"e1b982db2da5";
            round := 48x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"ca73878a8eb0") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"7cbae5cb0bd6") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;

            subkey_0 := 48x"ca73878a8eb0";
            subkey_1 := 48x"7cbae5cb0bd6";
            round := 48x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"f36c7e242c2d") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"a0f0427059ab") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;

            subkey_0 := 48x"f36c7e242c2d";
            subkey_1 := 48x"a0f0427059ab";
            round := 48x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"46e9f47fdf8") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"9f0d6e669c97") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;

            subkey_0 := 48x"46e9f47fdf8";
            subkey_1 := 48x"9f0d6e669c97";
            round := 48x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"bf7956898b46") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"9c0dacb66486") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;

            subkey_0 := 48x"bf7956898b46";
            subkey_1 := 48x"9c0dacb66486";
            round := 48x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"bddfd07a1b8c") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"4615643641b9") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;

            subkey_0 := 48x"bddfd07a1b8c";
            subkey_1 := 48x"4615643641b9";
            round := 48x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"99db660e8dbc") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"7725e5de51d9") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;

            subkey_0 := 48x"99db660e8dbc";
            subkey_1 := 48x"7725e5de51d9";
            round := 48x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"bd89bb8001fc") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"73528bf46c18") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;

            subkey_0 := 48x"bd89bb8001fc";
            subkey_1 := 48x"73528bf46c18";
            round := 48x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"39b0d20bf99b") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"d5fd0e0bf67e") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;

            subkey_0 := 48x"39b0d20bf99b";
            subkey_1 := 48x"d5fd0e0bf67e";
            round := 48x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"75005f45c95f") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"b886cf1a0586") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;

            subkey_0 := 48x"75005f45c95f";
            subkey_1 := 48x"b886cf1a0586";
            round := 48x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"53ba1c3aa987") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"fbb8e614e37c") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;

            subkey_0 := 48x"53ba1c3aa987";
            subkey_1 := 48x"fbb8e614e37c";
            round := 48x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"4d6534f5f249") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"d0b5d520be73") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;

            subkey_0 := 48x"4d6534f5f249";
            subkey_1 := 48x"d0b5d520be73";
            round := 48x"1a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"aa1c4d648157") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 26, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"c135eacb131d") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 26, Index 1 Failed!" severity error;

            subkey_0 := 48x"aa1c4d648157";
            subkey_1 := 48x"c135eacb131d";
            round := 48x"1b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"973fe86b46cc") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 27, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"c7dd834f4c71") report "96-Bit Block, 96-Bit Key, Key Schedule Round Test 27, Index 1 Failed!" severity error;

            report "96-Bit Block, 96-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_96_144: process
            constant BLOCK_SIZE: INTEGER := 96;
            constant KEY_SIZE: INTEGER := 144;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 48x"aa3c03983ca8";
            subkey_1 := 48x"b83e90ec17e0";
            subkey_2 := 48x"cc32d71037d1";
            round := 48x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"db145ee8cdfa") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"8af4422928bf") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"cc32d71037d1") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;

            subkey_0 := 48x"db145ee8cdfa";
            subkey_1 := 48x"8af4422928bf";
            subkey_2 := 48x"cc32d71037d1";
            round := 48x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"744266f9b1e6") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"8af4422928bf") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"ace091bfde30") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;

            subkey_0 := 48x"744266f9b1e6";
            subkey_1 := 48x"8af4422928bf";
            subkey_2 := 48x"ace091bfde30";
            round := 48x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"91de6cf6543f") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"33cd5b3bdb0c") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"ace091bfde30") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;

            subkey_0 := 48x"91de6cf6543f";
            subkey_1 := 48x"33cd5b3bdb0c";
            subkey_2 := 48x"ace091bfde30";
            round := 48x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"4c782a3ab5e2") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"33cd5b3bdb0c") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"c28b4d88141e") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;

            subkey_0 := 48x"4c782a3ab5e2";
            subkey_1 := 48x"33cd5b3bdb0c";
            subkey_2 := 48x"c28b4d88141e";
            round := 48x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"3b6aa6405eab") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"58abf795f1b9") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"c28b4d88141e") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;

            subkey_0 := 48x"3b6aa6405eab";
            subkey_1 := 48x"58abf795f1b9";
            subkey_2 := 48x"c28b4d88141e";
            round := 48x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"8178038f13e3") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"58abf795f1b9") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"5a2d318de6ba") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;

            subkey_0 := 48x"8178038f13e3";
            subkey_1 := 48x"58abf795f1b9";
            subkey_2 := 48x"5a2d318de6ba";
            round := 48x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"3110b3fe36ce") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"3ad0af86a9d2") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"5a2d318de6ba") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;

            subkey_0 := 48x"3110b3fe36ce";
            subkey_1 := 48x"3ad0af86a9d2";
            subkey_2 := 48x"5a2d318de6ba";
            round := 48x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"63ef7ede72c2") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"3ad0af86a9d2") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"eb6ae12fc4b3") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;

            subkey_0 := 48x"63ef7ede72c2";
            subkey_1 := 48x"3ad0af86a9d2";
            subkey_2 := 48x"eb6ae12fc4b3";
            round := 48x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"2951b97e6f70") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"362a4f8df963") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"eb6ae12fc4b3") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;

            subkey_0 := 48x"2951b97e6f70";
            subkey_1 := 48x"362a4f8df963";
            subkey_2 := 48x"eb6ae12fc4b3";
            round := 48x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"97b0eface4bc") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"362a4f8df963") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"dd3d245f9f3d") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;

            subkey_0 := 48x"97b0eface4bc";
            subkey_1 := 48x"362a4f8df963";
            subkey_2 := 48x"dd3d245f9f3d";
            round := 48x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"4760649b575b") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"fae719fc72bf") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"dd3d245f9f3d") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;

            subkey_0 := 48x"4760649b575b";
            subkey_1 := 48x"fae719fc72bf";
            subkey_2 := 48x"dd3d245f9f3d";
            round := 48x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"be3e85650c2b") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"fae719fc72bf") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"853da1bfb6f1") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;

            subkey_0 := 48x"be3e85650c2b";
            subkey_1 := 48x"fae719fc72bf";
            subkey_2 := 48x"853da1bfb6f1";
            round := 48x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"8fcd475769cc") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"7e396c7f0891") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"853da1bfb6f1") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;

            subkey_0 := 48x"8fcd475769cc";
            subkey_1 := 48x"7e396c7f0891";
            subkey_2 := 48x"853da1bfb6f1";
            round := 48x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"ff38be4267eb") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"7e396c7f0891") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"815284f9298f") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;

            subkey_0 := 48x"ff38be4267eb";
            subkey_1 := 48x"7e396c7f0891";
            subkey_2 := 48x"815284f9298f";
            round := 48x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"697305bdd9a2") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"90b6f7aee6fd") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"815284f9298f") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;

            subkey_0 := 48x"697305bdd9a2";
            subkey_1 := 48x"90b6f7aee6fd";
            subkey_2 := 48x"815284f9298f";
            round := 48x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"b36c75ac1fd7") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"90b6f7aee6fd") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"f8f45842d2c4") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;

            subkey_0 := 48x"b36c75ac1fd7";
            subkey_1 := 48x"90b6f7aee6fd";
            subkey_2 := 48x"f8f45842d2c4";
            round := 48x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"2b9e81c33010") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"b0fd2ca3cead") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"f8f45842d2c4") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;

            subkey_0 := 48x"2b9e81c33010";
            subkey_1 := 48x"b0fd2ca3cead";
            subkey_2 := 48x"f8f45842d2c4";
            round := 48x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"ac637802f272") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"b0fd2ca3cead") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"f097761b72f3") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;

            subkey_0 := 48x"ac637802f272";
            subkey_1 := 48x"b0fd2ca3cead";
            subkey_2 := 48x"f097761b72f3";
            round := 48x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"390fb53805c7") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"5a14752f9652") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"f097761b72f3") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;

            subkey_0 := 48x"390fb53805c7";
            subkey_1 := 48x"5a14752f9652";
            subkey_2 := 48x"f097761b72f3";
            round := 48x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"e57de56e0f13") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"5a14752f9652") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"2d004cae212a") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;

            subkey_0 := 48x"e57de56e0f13";
            subkey_1 := 48x"5a14752f9652";
            subkey_2 := 48x"2d004cae212a";
            round := 48x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"1c38d2934622") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"37d7f9e33ebd") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"2d004cae212a") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;

            subkey_0 := 48x"1c38d2934622";
            subkey_1 := 48x"37d7f9e33ebd";
            subkey_2 := 48x"2d004cae212a";
            round := 48x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"a7a34645c546") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"37d7f9e33ebd") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"4665d2dff456") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;

            subkey_0 := 48x"a7a34645c546";
            subkey_1 := 48x"37d7f9e33ebd";
            subkey_2 := 48x"4665d2dff456";
            round := 48x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"59c12c1182a7") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"64db1e3fa892") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"4665d2dff456") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 22, Index 2 Failed!" severity error;

            subkey_0 := 48x"59c12c1182a7";
            subkey_1 := 48x"64db1e3fa892";
            subkey_2 := 48x"4665d2dff456";
            round := 48x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"7e0ef16877b6") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"64db1e3fa892") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"b00791e4628c") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 23, Index 2 Failed!" severity error;

            subkey_0 := 48x"7e0ef16877b6";
            subkey_1 := 48x"64db1e3fa892";
            subkey_2 := 48x"b00791e4628c";
            round := 48x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"e00447c50af5") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"1073cc86b746") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"b00791e4628c") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 24, Index 2 Failed!" severity error;

            subkey_0 := 48x"e00447c50af5";
            subkey_1 := 48x"1073cc86b746";
            subkey_2 := 48x"b00791e4628c";
            round := 48x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"6c96717eb8e1") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"1073cc86b746") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"6cb44f56ef4e") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 25, Index 2 Failed!" severity error;

            subkey_0 := 48x"6c96717eb8e1";
            subkey_1 := 48x"1073cc86b746";
            subkey_2 := 48x"6cb44f56ef4e";
            round := 48x"1a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"d6156ebef889") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 26, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"b2a6e54b3f82") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 26, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"6cb44f56ef4e") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 26, Index 2 Failed!" severity error;

            subkey_0 := 48x"d6156ebef889";
            subkey_1 := 48x"b2a6e54b3f82";
            subkey_2 := 48x"6cb44f56ef4e";
            round := 48x"1b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"942956f98b2d") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 27, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"b2a6e54b3f82") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 27, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"2482230e4f63") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 27, Index 2 Failed!" severity error;

            subkey_0 := 48x"942956f98b2d";
            subkey_1 := 48x"b2a6e54b3f82";
            subkey_2 := 48x"2482230e4f63";
            round := 48x"1c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=48x"b7914a128f1c") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 28, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=48x"16dbfdded670") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 28, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=48x"2482230e4f63") report "96-Bit Block, 144-Bit Key, Key Schedule Round Test 28, Index 2 Failed!" severity error;

            report "96-Bit Block, 144-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_128_128: process
            constant BLOCK_SIZE: INTEGER := 128;
            constant KEY_SIZE: INTEGER := 128;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 64x"3d15eef738c1962e";
            subkey_1 := 64x"f7b0b7d2cda8056c";
            round := 64x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"42a2e816cd838f42") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"aa0d9faf0b8f3e33") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;

            subkey_0 := 64x"42a2e816cd838f42";
            subkey_1 := 64x"aa0d9faf0b8f3e33";
            round := 64x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"635bb50010936493") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"764cf5b67c8f1e81") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;

            subkey_0 := 64x"635bb50010936493";
            subkey_1 := 64x"764cf5b67c8f1e81";
            round := 64x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"fe0fa9f54394d728") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"e4d201f5c70ff3b3") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;

            subkey_0 := 64x"fe0fa9f54394d728";
            subkey_1 := 64x"e4d201f5c70ff3b3";
            round := 64x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"4189345d25fd5e5f") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"b1f47bf7395be718") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;

            subkey_0 := 64x"4189345d25fd5e5f";
            subkey_1 := 64x"b1f47bf7395be718";
            round := 64x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"56728a3032dc48b8") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5a3b28d91d36ba42") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;

            subkey_0 := 64x"56728a3032dc48b8";
            subkey_1 := 64x"5a3b28d91d36ba42";
            round := 64x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"2b5894d89d1b3ab5") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"98ccc5590bf97f77") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;

            subkey_0 := 64x"2b5894d89d1b3ab5";
            subkey_1 := 64x"98ccc5590bf97f77";
            round := 64x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"f835c7591efee19b") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a2f1619df6273432") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;

            subkey_0 := 64x"f835c7591efee19b";
            subkey_1 := 64x"a2f1619df6273432";
            round := 64x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"eb7682724b020417") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"2ad8b8babcf508c8") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;

            subkey_0 := 64x"eb7682724b020417";
            subkey_1 := 64x"2ad8b8babcf508c8";
            round := 64x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"e81548b95daed9a8") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"b3a15b2b05bef917") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;

            subkey_0 := 64x"e81548b95daed9a8";
            subkey_1 := 64x"b3a15b2b05bef917";
            round := 64x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"bf62afde65c255ef") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"ffc8ea1488b498a8") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;

            subkey_0 := 64x"bf62afde65c255ef";
            subkey_1 := 64x"ffc8ea1488b498a8";
            round := 64x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"9377063b5459a5f0") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"686278c87a4b0a8d") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;

            subkey_0 := 64x"9377063b5459a5f0";
            subkey_1 := 64x"686278c87a4b0a8d";
            round := 64x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"bb67596ebe1edf75") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"20df68b41cd3f0f1") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;

            subkey_0 := 64x"bb67596ebe1edf75";
            subkey_1 := 64x"20df68b41cd3f0f1";
            round := 64x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"77b2f3a282cd48c4") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"ac8838d7723bb369") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;

            subkey_0 := 64x"77b2f3a282cd48c4";
            subkey_1 := 64x"ac8838d7723bb369";
            round := 64x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"5cc8e6cf4c55c259") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"e15f7bdb5a3f847a") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;

            subkey_0 := 64x"5cc8e6cf4c55c259";
            subkey_1 := 64x"e15f7bdb5a3f847a";
            round := 64x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"31ed7031451e1319") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"d7aa464b27b001d3") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;

            subkey_0 := 64x"31ed7031451e1319";
            subkey_1 := 64x"d7aa464b27b001d3";
            round := 64x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"8aae9bfdb8b55bdc") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5c51a779045c315") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;

            subkey_0 := 64x"8aae9bfdb8b55bdc";
            subkey_1 := 64x"5c51a779045c315";
            round := 64x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"cac0bef5f5ef7f6b") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"9fb461183045a18f") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;

            subkey_0 := 64x"cac0bef5f5ef7f6b";
            subkey_1 := 64x"9fb461183045a18f";
            round := 64x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"c6584f8a1643e43") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5a6073570e1fc51d") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;

            subkey_0 := 64x"c6584f8a1643e43";
            subkey_1 := 64x"5a6073570e1fc51d";
            round := 64x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"4a93c2aef353ac02") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"29bfe56bf8725e1a") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;

            subkey_0 := 64x"4a93c2aef353ac02";
            subkey_1 := 64x"29bfe56bf8725e1a";
            round := 64x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"302397e3c5d17e61") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"64bd82945f4c1e73") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;

            subkey_0 := 64x"302397e3c5d17e61";
            subkey_1 := 64x"64bd82945f4c1e73";
            round := 64x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"2294ea7874bb3962") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a38855665a30ca6b") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;

            subkey_0 := 64x"2294ea7874bb3962";
            subkey_1 := 64x"a38855665a30ca6b";
            round := 64x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"9a9f210e7ecca128") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8e3872cddb156a39") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;

            subkey_0 := 64x"9a9f210e7ecca128";
            subkey_1 := 64x"8e3872cddb156a39";
            round := 64x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"d451f2bac2bfc0") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"d42d59814ca7b684") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;

            subkey_0 := 64x"d451f2bac2bfc0";
            subkey_1 := 64x"d42d59814ca7b684";
            round := 64x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"830af0d9ea1a9961") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"85a87f4c3c0f6761") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;

            subkey_0 := 64x"830af0d9ea1a9961";
            subkey_1 := 64x"85a87f4c3c0f6761";
            round := 64x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"fcc71f96668263dc") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"e49099593656a8d0") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;

            subkey_0 := 64x"fcc71f96668263dc";
            subkey_1 := 64x"e49099593656a8d0";
            round := 64x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"2b934c9c8baba47a") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"cdabb02fbfb8ba9d") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;

            subkey_0 := 64x"2b934c9c8baba47a";
            subkey_1 := 64x"cdabb02fbfb8ba9d";
            round := 64x"1a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"95fa9ca8e6367eff") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 26, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"c960f84cbb6b5d2e") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 26, Index 1 Failed!" severity error;

            subkey_0 := 64x"95fa9ca8e6367eff";
            subkey_1 := 64x"c960f84cbb6b5d2e";
            round := 64x"1b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"6b1718e603421dbb") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 27, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"c4c3fda132f1ea47") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 27, Index 1 Failed!" severity error;

            subkey_0 := 64x"6b1718e603421dbb";
            subkey_1 := 64x"c4c3fda132f1ea47";
            round := 64x"1c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"ea631bd3be65e262") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 28, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"b2dbdce3a4750fb9") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 28, Index 1 Failed!" severity error;

            subkey_0 := 64x"ea631bd3be65e262";
            subkey_1 := 64x"b2dbdce3a4750fb9";
            round := 64x"1d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"f70d292d5125447b") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 29, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a415f7b0a20a576c") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 29, Index 1 Failed!" severity error;

            subkey_0 := 64x"f70d292d5125447b";
            subkey_1 := 64x"a415f7b0a20a576c";
            round := 64x"1e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"dbd8764f88ed6d13") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 30, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"63b13f2501c74ecc") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 30, Index 1 Failed!" severity error;

            subkey_0 := 64x"dbd8764f88ed6d13";
            subkey_1 := 64x"63b13f2501c74ecc";
            round := 64x"1f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"76ff95f2ea845ce0") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 31, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a83c278eadef347e") report "128-Bit Block, 128-Bit Key, Key Schedule Round Test 31, Index 1 Failed!" severity error;

            report "128-Bit Block, 128-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_128_192: process
            constant BLOCK_SIZE: INTEGER := 128;
            constant KEY_SIZE: INTEGER := 192;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 64x"8b0163c1cd9d2b7d";
            subkey_1 := 64x"1759edc372ae2244";
            subkey_2 := 64x"fe43c49e149818d1";
            round := 64x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"9713a3a1fde68273") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"cf18bdaf910fd99f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"fe43c49e149818d1") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;

            subkey_0 := 64x"9713a3a1fde68273";
            subkey_1 := 64x"cf18bdaf910fd99f";
            subkey_2 := 64x"fe43c49e149818d1";
            round := 64x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"d18cfa6974cf0916") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"cf18bdaf910fd99f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"6911e7669bfb1a8a") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;

            subkey_0 := 64x"d18cfa6974cf0916";
            subkey_1 := 64x"cf18bdaf910fd99f";
            subkey_2 := 64x"6911e7669bfb1a8a";
            round := 64x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"fd3bc06c8218505b") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"715c1327246018ed") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"6911e7669bfb1a8a") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;

            subkey_0 := 64x"fd3bc06c8218505b";
            subkey_1 := 64x"715c1327246018ed";
            subkey_2 := 64x"6911e7669bfb1a8a";
            round := 64x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"6e7ad137f876c9a9") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"715c1327246018ed") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"87a4d253e8b44b76") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;

            subkey_0 := 64x"6e7ad137f876c9a9";
            subkey_1 := 64x"715c1327246018ed";
            subkey_2 := 64x"87a4d253e8b44b76";
            round := 64x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"283aa4f4dc2d648e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5bec2d4b1f9b29c5") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"87a4d253e8b44b76") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;

            subkey_0 := 64x"283aa4f4dc2d648e";
            subkey_1 := 64x"5bec2d4b1f9b29c5";
            subkey_2 := 64x"87a4d253e8b44b76";
            round := 64x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"df176e61d17d3cad") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5bec2d4b1f9b29c5") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"9ec249c7301618dc") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;

            subkey_0 := 64x"df176e61d17d3cad";
            subkey_1 := 64x"5bec2d4b1f9b29c5";
            subkey_2 := 64x"9ec249c7301618dc";
            round := 64x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"5cc82981977532be") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a4735a8f1c9cd7d0") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"9ec249c7301618dc") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;

            subkey_0 := 64x"5cc82981977532be";
            subkey_1 := 64x"a4735a8f1c9cd7d0";
            subkey_2 := 64x"9ec249c7301618dc";
            round := 64x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"df27a7c7e50cdd23") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a4735a8f1c9cd7d0") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"3966ebcb5ea548d1") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;

            subkey_0 := 64x"df27a7c7e50cdd23";
            subkey_1 := 64x"a4735a8f1c9cd7d0";
            subkey_2 := 64x"3966ebcb5ea548d1";
            round := 64x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"56f1251d5c4f90ec") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"afcc1b22742979f2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"3966ebcb5ea548d1") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;

            subkey_0 := 64x"56f1251d5c4f90ec";
            subkey_1 := 64x"afcc1b22742979f2";
            subkey_2 := 64x"3966ebcb5ea548d1";
            round := 64x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"9fa3a4e3c5d2b15f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"afcc1b22742979f2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"282a8c0927ae363d") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;

            subkey_0 := 64x"9fa3a4e3c5d2b15f";
            subkey_1 := 64x"afcc1b22742979f2";
            subkey_2 := 64x"282a8c0927ae363d";
            round := 64x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"6f4e57e0c6d3502e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"925370fee846dad2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"282a8c0927ae363d") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;

            subkey_0 := 64x"6f4e57e0c6d3502e";
            subkey_1 := 64x"925370fee846dad2";
            subkey_2 := 64x"282a8c0927ae363d";
            round := 64x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"d6043d6af9607f1c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"925370fee846dad2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"ac76826ccffafe6f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;

            subkey_0 := 64x"d6043d6af9607f1c";
            subkey_1 := 64x"925370fee846dad2";
            subkey_2 := 64x"ac76826ccffafe6f";
            round := 64x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"18b77b8c334b3d1c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a89690dbf848c5fa") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"ac76826ccffafe6f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;

            subkey_0 := 64x"18b77b8c334b3d1c";
            subkey_1 := 64x"a89690dbf848c5fa";
            subkey_2 := 64x"ac76826ccffafe6f";
            round := 64x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"4dd82e6f3a42d0f7") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"a89690dbf848c5fa") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"8863f20ea01b3817") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;

            subkey_0 := 64x"4dd82e6f3a42d0f7";
            subkey_1 := 64x"a89690dbf848c5fa";
            subkey_2 := 64x"8863f20ea01b3817";
            round := 64x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"2641b679c42d9e08") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"4880c500163b19b2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"8863f20ea01b3817") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;

            subkey_0 := 64x"2641b679c42d9e08";
            subkey_1 := 64x"4880c500163b19b2";
            subkey_2 := 64x"8863f20ea01b3817";
            round := 64x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"fc7a9a5f3a1490e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"4880c500163b19b2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"3dca1a6bd2cdb94f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;

            subkey_0 := 64x"fc7a9a5f3a1490e";
            subkey_1 := 64x"4880c500163b19b2";
            subkey_2 := 64x"3dca1a6bd2cdb94f";
            round := 64x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"bc2d67456ebdcc47") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"c2102a6af3b78437") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"3dca1a6bd2cdb94f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;

            subkey_0 := 64x"bc2d67456ebdcc47";
            subkey_1 := 64x"c2102a6af3b78437";
            subkey_2 := 64x"3dca1a6bd2cdb94f";
            round := 64x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"ea000b74af7ef82c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"c2102a6af3b78437") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"b6b315fda909a11") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;

            subkey_0 := 64x"ea000b74af7ef82c";
            subkey_1 := 64x"c2102a6af3b78437";
            subkey_2 := 64x"b6b315fda909a11";
            round := 64x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"71c2403a61856ec5") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"21c21b9f1a72afa2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"b6b315fda909a11") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;

            subkey_0 := 64x"71c2403a61856ec5";
            subkey_1 := 64x"21c21b9f1a72afa2";
            subkey_2 := 64x"b6b315fda909a11";
            round := 64x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"cdfaab8cd748967") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"21c21b9f1a72afa2") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"82cdab6bc15fff4c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;

            subkey_0 := 64x"cdfaab8cd748967";
            subkey_1 := 64x"21c21b9f1a72afa2";
            subkey_2 := 64x"82cdab6bc15fff4c";
            round := 64x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"c9fc3912072ab73a") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"af016cd46c8efc02") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"82cdab6bc15fff4c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;

            subkey_0 := 64x"c9fc3912072ab73a";
            subkey_1 := 64x"af016cd46c8efc02";
            subkey_2 := 64x"82cdab6bc15fff4c";
            round := 64x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"599ece2d4bb9aefa") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"af016cd46c8efc02") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"167f06bd72ec172c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;

            subkey_0 := 64x"599ece2d4bb9aefa";
            subkey_1 := 64x"af016cd46c8efc02";
            subkey_2 := 64x"167f06bd72ec172c";
            round := 64x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"90bbbef07deb4a32") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5c4dcf9a20263de0") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"167f06bd72ec172c") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 22, Index 2 Failed!" severity error;

            subkey_0 := 64x"90bbbef07deb4a32";
            subkey_1 := 64x"5c4dcf9a20263de0";
            subkey_2 := 64x"167f06bd72ec172c";
            round := 64x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"390fca74d40467ca") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"5c4dcf9a20263de0") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"bcd23df73b5e365e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 23, Index 2 Failed!" severity error;

            subkey_0 := 64x"390fca74d40467ca";
            subkey_1 := 64x"5c4dcf9a20263de0";
            subkey_2 := 64x"bcd23df73b5e365e";
            round := 64x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"d1124be2ce07b04e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"196c18446e248e1f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"bcd23df73b5e365e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 24, Index 2 Failed!" severity error;

            subkey_0 := 64x"d1124be2ce07b04e";
            subkey_1 := 64x"196c18446e248e1f";
            subkey_2 := 64x"bcd23df73b5e365e";
            round := 64x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"a75d4136b57e8ceb") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"196c18446e248e1f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"2fcf1e20c5430e9d") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 25, Index 2 Failed!" severity error;

            subkey_0 := 64x"a75d4136b57e8ceb";
            subkey_1 := 64x"196c18446e248e1f";
            subkey_2 := 64x"2fcf1e20c5430e9d";
            round := 64x"1a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"fc9ca4fb5218d63e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 26, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"c676ad4ef9ecb163") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 26, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"2fcf1e20c5430e9d") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 26, Index 2 Failed!" severity error;

            subkey_0 := 64x"fc9ca4fb5218d63e";
            subkey_1 := 64x"c676ad4ef9ecb163";
            subkey_2 := 64x"2fcf1e20c5430e9d";
            round := 64x"1b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"7d2953c3e218a8a0") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 27, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"c676ad4ef9ecb163") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 27, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"99cc741972de1957") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 27, Index 2 Failed!" severity error;

            subkey_0 := 64x"7d2953c3e218a8a0";
            subkey_1 := 64x"c676ad4ef9ecb163";
            subkey_2 := 64x"99cc741972de1957";
            round := 64x"1c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"9a5546e21d7d04e") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 28, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"e0efca713112954d") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 28, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"99cc741972de1957") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 28, Index 2 Failed!" severity error;

            subkey_0 := 64x"9a5546e21d7d04e";
            subkey_1 := 64x"e0efca713112954d";
            subkey_2 := 64x"99cc741972de1957";
            round := 64x"1d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"2c15839335f42c0a") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 29, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"e0efca713112954d") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 29, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"613f20e23b4aae7a") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 29, Index 2 Failed!" severity error;

            subkey_0 := 64x"2c15839335f42c0a";
            subkey_1 := 64x"e0efca713112954d";
            subkey_2 := 64x"613f20e23b4aae7a";
            round := 64x"1e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"195a6fc408845ed0") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 30, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"79f6735da7253e81") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 30, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"613f20e23b4aae7a") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 30, Index 2 Failed!" severity error;

            subkey_0 := 64x"195a6fc408845ed0";
            subkey_1 := 64x"79f6735da7253e81";
            subkey_2 := 64x"613f20e23b4aae7a";
            round := 64x"1f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"5968d0c4ae9d5fe1") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 31, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"79f6735da7253e81") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 31, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"93bbaee4eabfa961") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 31, Index 2 Failed!" severity error;

            subkey_0 := 64x"5968d0c4ae9d5fe1";
            subkey_1 := 64x"79f6735da7253e81";
            subkey_2 := 64x"93bbaee4eabfa961";
            round := 64x"20";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"11a4411d78ae7a35") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 32, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"dae2c7380c44853f") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 32, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"93bbaee4eabfa961") report "128-Bit Block, 192-Bit Key, Key Schedule Round Test 32, Index 2 Failed!" severity error;

            report "128-Bit Block, 192-Bit Key, Key Schedule Round Test Done." severity note;
        end process;

tb_key_schedule_128_256: process
            constant BLOCK_SIZE: INTEGER := 128;
            constant KEY_SIZE: INTEGER := 256;
            constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;
            variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);
            variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);
        begin
            subkey_0 := 64x"820865d6e005b860";
            subkey_1 := 64x"eece328bff7b118e";
            subkey_2 := 64x"1beb37117d41e602";
            subkey_3 := 64x"8d1fd9b74d2b9deb";
            round := 64x"0";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"b41abe6c28f075") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 0, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"10f734096c053371") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 0, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"1beb37117d41e602") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 0, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"8d1fd9b74d2b9deb") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 0, Index 3 Failed!" severity error;

            subkey_0 := 64x"b41abe6c28f075";
            subkey_1 := 64x"10f734096c053371";
            subkey_2 := 64x"1beb37117d41e602";
            subkey_3 := 64x"8d1fd9b74d2b9deb";
            round := 64x"1";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"770d0061ce1b1f2") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 1, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"10f734096c053371") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 1, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"2d005f57da6325a") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 1, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"8d1fd9b74d2b9deb") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 1, Index 3 Failed!" severity error;

            subkey_0 := 64x"770d0061ce1b1f2";
            subkey_1 := 64x"10f734096c053371";
            subkey_2 := 64x"2d005f57da6325a";
            subkey_3 := 64x"8d1fd9b74d2b9deb";
            round := 64x"2";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"c97b6fef3323521d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 2, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"10f734096c053371") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 2, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"2d005f57da6325a") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 2, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"f2fdefdfd42edd8d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 2, Index 3 Failed!" severity error;

            subkey_0 := 64x"c97b6fef3323521d";
            subkey_1 := 64x"10f734096c053371";
            subkey_2 := 64x"2d005f57da6325a";
            subkey_3 := 64x"f2fdefdfd42edd8d";
            round := 64x"3";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"7157185aa595c7bd") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 3, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"3a8c67233c8f5753") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 3, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"2d005f57da6325a") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 3, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"f2fdefdfd42edd8d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 3, Index 3 Failed!" severity error;

            subkey_0 := 64x"7157185aa595c7bd";
            subkey_1 := 64x"3a8c67233c8f5753";
            subkey_2 := 64x"2d005f57da6325a";
            subkey_3 := 64x"f2fdefdfd42edd8d";
            round := 64x"4";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"41e12ab5b7bd5000") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 4, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"3a8c67233c8f5753") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 4, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"cb59e8609b136deb") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 4, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"f2fdefdfd42edd8d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 4, Index 3 Failed!" severity error;

            subkey_0 := 64x"41e12ab5b7bd5000";
            subkey_1 := 64x"3a8c67233c8f5753";
            subkey_2 := 64x"cb59e8609b136deb";
            subkey_3 := 64x"f2fdefdfd42edd8d";
            round := 64x"5";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"c0dd7d082a7bfeda") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 5, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"3a8c67233c8f5753") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 5, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"cb59e8609b136deb") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 5, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"cfd428a597917ed8") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 5, Index 3 Failed!" severity error;

            subkey_0 := 64x"c0dd7d082a7bfeda";
            subkey_1 := 64x"3a8c67233c8f5753";
            subkey_2 := 64x"cb59e8609b136deb";
            subkey_3 := 64x"cfd428a597917ed8";
            round := 64x"6";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"12f3e12e1e6778e1") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 6, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"1418096f4db88e37") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 6, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"cb59e8609b136deb") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 6, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"cfd428a597917ed8") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 6, Index 3 Failed!" severity error;

            subkey_0 := 64x"12f3e12e1e6778e1";
            subkey_1 := 64x"1418096f4db88e37";
            subkey_2 := 64x"cb59e8609b136deb";
            subkey_3 := 64x"cfd428a597917ed8";
            round := 64x"7";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"692032668c394b41") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 7, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"1418096f4db88e37") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 7, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"febf3b167f028c49") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 7, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"cfd428a597917ed8") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 7, Index 3 Failed!" severity error;

            subkey_0 := 64x"692032668c394b41";
            subkey_1 := 64x"1418096f4db88e37";
            subkey_2 := 64x"febf3b167f028c49";
            subkey_3 := 64x"cfd428a597917ed8";
            round := 64x"8";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"8f195bb501a86bc") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 8, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"1418096f4db88e37") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 8, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"febf3b167f028c49") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 8, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"41f0068f31d0dcb7") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 8, Index 3 Failed!" severity error;

            subkey_0 := 64x"8f195bb501a86bc";
            subkey_1 := 64x"1418096f4db88e37";
            subkey_2 := 64x"febf3b167f028c49";
            subkey_3 := 64x"41f0068f31d0dcb7";
            round := 64x"9";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"789001e3fbc0aa3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 9, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"4005adc4bf683f43") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 9, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"febf3b167f028c49") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 9, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"41f0068f31d0dcb7") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 9, Index 3 Failed!" severity error;

            subkey_0 := 64x"789001e3fbc0aa3";
            subkey_1 := 64x"4005adc4bf683f43";
            subkey_2 := 64x"febf3b167f028c49";
            subkey_3 := 64x"41f0068f31d0dcb7";
            round := 64x"a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"6dcfbfa8abdb583d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 10, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"4005adc4bf683f43") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 10, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"5187bf59563b0d25") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 10, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"41f0068f31d0dcb7") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 10, Index 3 Failed!" severity error;

            subkey_0 := 64x"6dcfbfa8abdb583d";
            subkey_1 := 64x"4005adc4bf683f43";
            subkey_2 := 64x"5187bf59563b0d25";
            subkey_3 := 64x"41f0068f31d0dcb7";
            round := 64x"b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"4b6c52ea65d7e8f9") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 11, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"4005adc4bf683f43") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 11, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"5187bf59563b0d25") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 11, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"2511afaf3b0d2912") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 11, Index 3 Failed!" severity error;

            subkey_0 := 64x"4b6c52ea65d7e8f9";
            subkey_1 := 64x"4005adc4bf683f43";
            subkey_2 := 64x"5187bf59563b0d25";
            subkey_3 := 64x"2511afaf3b0d2912";
            round := 64x"c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"d5cecfcb042816fe") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 12, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8eac58982a975134") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 12, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"5187bf59563b0d25") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 12, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"2511afaf3b0d2912") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 12, Index 3 Failed!" severity error;

            subkey_0 := 64x"d5cecfcb042816fe";
            subkey_1 := 64x"8eac58982a975134";
            subkey_2 := 64x"5187bf59563b0d25";
            subkey_3 := 64x"2511afaf3b0d2912";
            round := 64x"d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"555629d27c3ee5f0") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 13, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8eac58982a975134") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 13, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"fb20578a5d7e5206") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 13, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"2511afaf3b0d2912") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 13, Index 3 Failed!" severity error;

            subkey_0 := 64x"555629d27c3ee5f0";
            subkey_1 := 64x"8eac58982a975134";
            subkey_2 := 64x"fb20578a5d7e5206";
            subkey_3 := 64x"2511afaf3b0d2912";
            round := 64x"e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"cdca7511ca8edc95") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 14, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8eac58982a975134") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 14, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"fb20578a5d7e5206") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 14, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"677b3b822b79f317") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 14, Index 3 Failed!" severity error;

            subkey_0 := 64x"cdca7511ca8edc95";
            subkey_1 := 64x"8eac58982a975134";
            subkey_2 := 64x"fb20578a5d7e5206";
            subkey_3 := 64x"677b3b822b79f317";
            round := 64x"f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"6c0a89e436cf9747") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 15, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"259216a62b973e9") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 15, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"fb20578a5d7e5206") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 15, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"677b3b822b79f317") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 15, Index 3 Failed!" severity error;

            subkey_0 := 64x"6c0a89e436cf9747";
            subkey_1 := 64x"259216a62b973e9";
            subkey_2 := 64x"fb20578a5d7e5206";
            subkey_3 := 64x"677b3b822b79f317";
            round := 64x"10";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"1351e51a7751afb2") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 16, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"259216a62b973e9") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 16, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"7305aa3bc12d1589") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 16, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"677b3b822b79f317") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 16, Index 3 Failed!" severity error;

            subkey_0 := 64x"1351e51a7751afb2";
            subkey_1 := 64x"259216a62b973e9";
            subkey_2 := 64x"7305aa3bc12d1589";
            subkey_3 := 64x"677b3b822b79f317";
            round := 64x"11";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"b036488643f05424") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 17, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"259216a62b973e9") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 17, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"7305aa3bc12d1589") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 17, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"2ab96055f97d29b4") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 17, Index 3 Failed!" severity error;

            subkey_0 := 64x"b036488643f05424";
            subkey_1 := 64x"259216a62b973e9";
            subkey_2 := 64x"7305aa3bc12d1589";
            subkey_3 := 64x"2ab96055f97d29b4";
            round := 64x"12";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"188ae595b1d1aca0") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 18, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"9938a1a7ae530d85") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 18, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"7305aa3bc12d1589") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 18, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"2ab96055f97d29b4") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 18, Index 3 Failed!" severity error;

            subkey_0 := 64x"188ae595b1d1aca0";
            subkey_1 := 64x"9938a1a7ae530d85";
            subkey_2 := 64x"7305aa3bc12d1589";
            subkey_3 := 64x"2ab96055f97d29b4";
            round := 64x"13";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"65aac792631fbca6") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 19, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"9938a1a7ae530d85") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 19, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"a1fdeb3fed92d9a6") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 19, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"2ab96055f97d29b4") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 19, Index 3 Failed!" severity error;

            subkey_0 := 64x"65aac792631fbca6";
            subkey_1 := 64x"9938a1a7ae530d85";
            subkey_2 := 64x"a1fdeb3fed92d9a6";
            subkey_3 := 64x"2ab96055f97d29b4";
            round := 64x"14";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"3483bc61a1e4dce8") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 20, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"9938a1a7ae530d85") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 20, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"a1fdeb3fed92d9a6") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 20, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"19d580f2b91939db") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 20, Index 3 Failed!" severity error;

            subkey_0 := 64x"3483bc61a1e4dce8";
            subkey_1 := 64x"9938a1a7ae530d85";
            subkey_2 := 64x"a1fdeb3fed92d9a6";
            subkey_3 := 64x"19d580f2b91939db";
            round := 64x"15";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"1e01160e46b5c8a1") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 21, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"ba1cf50349932fe0") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 21, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"a1fdeb3fed92d9a6") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 21, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"19d580f2b91939db") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 21, Index 3 Failed!" severity error;

            subkey_0 := 64x"1e01160e46b5c8a1";
            subkey_1 := 64x"ba1cf50349932fe0";
            subkey_2 := 64x"a1fdeb3fed92d9a6";
            subkey_3 := 64x"19d580f2b91939db";
            round := 64x"16";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"34aba38bb30d1e64") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 22, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"ba1cf50349932fe0") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 22, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"c4a313f986a35b6c") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 22, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"19d580f2b91939db") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 22, Index 3 Failed!" severity error;

            subkey_0 := 64x"34aba38bb30d1e64";
            subkey_1 := 64x"ba1cf50349932fe0";
            subkey_2 := 64x"c4a313f986a35b6c";
            subkey_3 := 64x"19d580f2b91939db";
            round := 64x"17";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"aa9865513daec4ab") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 23, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"ba1cf50349932fe0") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 23, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"c4a313f986a35b6c") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 23, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"fc5790ca5c6378a") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 23, Index 3 Failed!" severity error;

            subkey_0 := 64x"aa9865513daec4ab";
            subkey_1 := 64x"ba1cf50349932fe0";
            subkey_2 := 64x"c4a313f986a35b6c";
            subkey_3 := 64x"fc5790ca5c6378a";
            round := 64x"18";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"df91a8cfad8e729f") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 24, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8b52824640f857c2") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 24, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"c4a313f986a35b6c") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 24, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"fc5790ca5c6378a") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 24, Index 3 Failed!" severity error;

            subkey_0 := 64x"df91a8cfad8e729f";
            subkey_1 := 64x"8b52824640f857c2";
            subkey_2 := 64x"c4a313f986a35b6c";
            subkey_3 := 64x"fc5790ca5c6378a";
            round := 64x"19";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"b0db0d9ecb66811d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 25, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8b52824640f857c2") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 25, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"4c564be3a71515e3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 25, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"fc5790ca5c6378a") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 25, Index 3 Failed!" severity error;

            subkey_0 := 64x"b0db0d9ecb66811d";
            subkey_1 := 64x"8b52824640f857c2";
            subkey_2 := 64x"4c564be3a71515e3";
            subkey_3 := 64x"fc5790ca5c6378a";
            round := 64x"1a";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"bc32bfe183384fa3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 26, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"8b52824640f857c2") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 26, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"4c564be3a71515e3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 26, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"3aead317d80c474e") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 26, Index 3 Failed!" severity error;

            subkey_0 := 64x"bc32bfe183384fa3";
            subkey_1 := 64x"8b52824640f857c2";
            subkey_2 := 64x"4c564be3a71515e3";
            subkey_3 := 64x"3aead317d80c474e";
            round := 64x"1b";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"9f2bed6fd0bb3afc") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 27, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"7ebe1263c97947e1") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 27, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"4c564be3a71515e3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 27, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"3aead317d80c474e") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 27, Index 3 Failed!" severity error;

            subkey_0 := 64x"9f2bed6fd0bb3afc";
            subkey_1 := 64x"7ebe1263c97947e1";
            subkey_2 := 64x"4c564be3a71515e3";
            subkey_3 := 64x"3aead317d80c474e";
            round := 64x"1c";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"7b2728c531bb87e9") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 28, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"7ebe1263c97947e1") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 28, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"827843bbb462500d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 28, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"3aead317d80c474e") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 28, Index 3 Failed!" severity error;

            subkey_0 := 64x"7b2728c531bb87e9";
            subkey_1 := 64x"7ebe1263c97947e1";
            subkey_2 := 64x"827843bbb462500d";
            subkey_3 := 64x"3aead317d80c474e";
            round := 64x"1d";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"105b55b1c44fab66") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 29, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"7ebe1263c97947e1") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 29, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"827843bbb462500d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 29, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"c96213984993942d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 29, Index 3 Failed!" severity error;

            subkey_0 := 64x"105b55b1c44fab66";
            subkey_1 := 64x"7ebe1263c97947e1";
            subkey_2 := 64x"827843bbb462500d";
            subkey_3 := 64x"c96213984993942d";
            round := 64x"1e";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"7300be4a0a647f83") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 30, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"f1da13c4281924b3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 30, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"827843bbb462500d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 30, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"c96213984993942d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 30, Index 3 Failed!" severity error;

            subkey_0 := 64x"7300be4a0a647f83";
            subkey_1 := 64x"f1da13c4281924b3";
            subkey_2 := 64x"827843bbb462500d";
            subkey_3 := 64x"c96213984993942d";
            round := 64x"1f";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"1886c4dd953b1dd7") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 31, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"f1da13c4281924b3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 31, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"8083368dc618e1cc") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 31, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"c96213984993942d") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 31, Index 3 Failed!" severity error;

            subkey_0 := 64x"1886c4dd953b1dd7";
            subkey_1 := 64x"f1da13c4281924b3";
            subkey_2 := 64x"8083368dc618e1cc";
            subkey_3 := 64x"c96213984993942d";
            round := 64x"20";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"8266001d845c5ff3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 32, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"f1da13c4281924b3") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 32, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"8083368dc618e1cc") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 32, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"465026f12d84b14b") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 32, Index 3 Failed!" severity error;

            subkey_0 := 64x"8266001d845c5ff3";
            subkey_1 := 64x"f1da13c4281924b3";
            subkey_2 := 64x"8083368dc618e1cc";
            subkey_3 := 64x"465026f12d84b14b";
            round := 64x"21";
            output := key_schedule_round(subkey_0,
                                         subkey_1,
                                         subkey_2,
                                         subkey_3,
                                         round,
                                         KEY_SIZE,
                                         WORD_SIZE);

            wait until rising_edge(clk);

            assert (output(WORD_SIZE * 1 - 1 downto WORD_SIZE * 0)=64x"2567dadd6a6686aa") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 33, Index 0 Failed!" severity error;
            assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE * 1)=64x"3657da3148847936") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 33, Index 1 Failed!" severity error;
            assert (output(WORD_SIZE * 3 - 1 downto WORD_SIZE * 2)=64x"8083368dc618e1cc") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 33, Index 2 Failed!" severity error;
            assert (output(WORD_SIZE * 4 - 1 downto WORD_SIZE * 3)=64x"465026f12d84b14b") report "128-Bit Block, 256-Bit Key, Key Schedule Round Test 33, Index 3 Failed!" severity error;

            report "128-Bit Block, 256-Bit Key, Key Schedule Round Test Done." severity note;
        end process;
              
end Behavioral;
