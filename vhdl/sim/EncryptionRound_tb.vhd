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
-- Create Date: 06.02.2019 16:42:20
-- Module Name: EncryptionRound_tb - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Testbench for the encryption round entity.
-- 
-- Dependencies: EncryptionRound.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity EncryptionRound_tb is
end EncryptionRound_tb;

architecture Behavioral of EncryptionRound_tb is
    signal word_0_32_64, word_1_32_64: UNSIGNED(16 - 1 downto 0);
    signal subkey_0_32_64, subkey_1_32_64, subkey_2_32_64, subkey_3_32_64: UNSIGNED(16 - 1 downto 0);
    signal index_32_64: UNSIGNED(16 - 1 downto 0);
    signal word_0_out_32_64, word_1_out_32_64: UNSIGNED(16 - 1 downto 0);
    signal subkey_0_out_32_64, subkey_1_out_32_64, subkey_2_out_32_64, subkey_3_out_32_64: UNSIGNED(16 - 1 downto 0);
    
    signal word_0_48_72, word_1_48_72: UNSIGNED(24 - 1 downto 0);
    signal subkey_0_48_72, subkey_1_48_72, subkey_2_48_72, subkey_3_48_72: UNSIGNED(24 - 1 downto 0);
    signal index_48_72: UNSIGNED(24 - 1 downto 0);
    signal word_0_out_48_72, word_1_out_48_72: UNSIGNED(24 - 1 downto 0);
    signal subkey_0_out_48_72, subkey_1_out_48_72, subkey_2_out_48_72, subkey_3_out_48_72: UNSIGNED(24 - 1 downto 0);
    
    signal word_0_48_96, word_1_48_96: UNSIGNED(24 - 1 downto 0);
    signal subkey_0_48_96, subkey_1_48_96, subkey_2_48_96, subkey_3_48_96: UNSIGNED(24 - 1 downto 0);
    signal index_48_96: UNSIGNED(24 - 1 downto 0);
    signal word_0_out_48_96, word_1_out_48_96: UNSIGNED(24 - 1 downto 0);
    signal subkey_0_out_48_96, subkey_1_out_48_96, subkey_2_out_48_96, subkey_3_out_48_96: UNSIGNED(24 - 1 downto 0);
    
    signal word_0_64_96, word_1_64_96: UNSIGNED(32 - 1 downto 0);
    signal subkey_0_64_96, subkey_1_64_96, subkey_2_64_96, subkey_3_64_96: UNSIGNED(32 - 1 downto 0);
    signal index_64_96: UNSIGNED(32 - 1 downto 0);
    signal word_0_out_64_96, word_1_out_64_96: UNSIGNED(32 - 1 downto 0);
    signal subkey_0_out_64_96, subkey_1_out_64_96, subkey_2_out_64_96, subkey_3_out_64_96: UNSIGNED(32 - 1 downto 0);
    
    signal word_0_64_128, word_1_64_128: UNSIGNED(32 - 1 downto 0);
    signal subkey_0_64_128, subkey_1_64_128, subkey_2_64_128, subkey_3_64_128: UNSIGNED(32 - 1 downto 0);
    signal index_64_128: UNSIGNED(32 - 1 downto 0);
    signal word_0_out_64_128, word_1_out_64_128: UNSIGNED(32 - 1 downto 0);
    signal subkey_0_out_64_128, subkey_1_out_64_128, subkey_2_out_64_128, subkey_3_out_64_128: UNSIGNED(32 - 1 downto 0);
    
    signal word_0_96_96, word_1_96_96: UNSIGNED(48 - 1 downto 0);
    signal subkey_0_96_96, subkey_1_96_96, subkey_2_96_96, subkey_3_96_96: UNSIGNED(48 - 1 downto 0);
    signal index_96_96: UNSIGNED(48 - 1 downto 0);
    signal word_0_out_96_96, word_1_out_96_96: UNSIGNED(48 - 1 downto 0);
    signal subkey_0_out_96_96, subkey_1_out_96_96, subkey_2_out_96_96, subkey_3_out_96_96: UNSIGNED(48 - 1 downto 0);
    
    signal word_0_96_144, word_1_96_144: UNSIGNED(48 - 1 downto 0);
    signal subkey_0_96_144, subkey_1_96_144, subkey_2_96_144, subkey_3_96_144: UNSIGNED(48 - 1 downto 0);
    signal index_96_144: UNSIGNED(48 - 1 downto 0);
    signal word_0_out_96_144, word_1_out_96_144: UNSIGNED(48 - 1 downto 0);
    signal subkey_0_out_96_144, subkey_1_out_96_144, subkey_2_out_96_144, subkey_3_out_96_144: UNSIGNED(48 - 1 downto 0);
    
    signal word_0_128_128, word_1_128_128: UNSIGNED(64 - 1 downto 0);
    signal subkey_0_128_128, subkey_1_128_128, subkey_2_128_128, subkey_3_128_128: UNSIGNED(64 - 1 downto 0);
    signal index_128_128: UNSIGNED(64 - 1 downto 0);
    signal word_0_out_128_128, word_1_out_128_128: UNSIGNED(64 - 1 downto 0);
    signal subkey_0_out_128_128, subkey_1_out_128_128, subkey_2_out_128_128, subkey_3_out_128_128: UNSIGNED(64 - 1 downto 0);
    
    signal word_0_128_192, word_1_128_192: UNSIGNED(64 - 1 downto 0);
    signal subkey_0_128_192, subkey_1_128_192, subkey_2_128_192, subkey_3_128_192: UNSIGNED(64 - 1 downto 0);
    signal index_128_192: UNSIGNED(64 - 1 downto 0);
    signal word_0_out_128_192, word_1_out_128_192: UNSIGNED(64 - 1 downto 0);
    signal subkey_0_out_128_192, subkey_1_out_128_192, subkey_2_out_128_192, subkey_3_out_128_192: UNSIGNED(64 - 1 downto 0);
    
    signal word_0_128_256, word_1_128_256: UNSIGNED(64 - 1 downto 0);
    signal subkey_0_128_256, subkey_1_128_256, subkey_2_128_256, subkey_3_128_256: UNSIGNED(64 - 1 downto 0);
    signal index_128_256: UNSIGNED(64 - 1 downto 0);
    signal word_0_out_128_256, word_1_out_128_256: UNSIGNED(64 - 1 downto 0);
    signal subkey_0_out_128_256, subkey_1_out_128_256, subkey_2_out_128_256, subkey_3_out_128_256: UNSIGNED(64 - 1 downto 0);

    signal clk : std_logic := '0';
    constant CLK_HALF_PERIOD: TIME := 5 ns;
begin

clock: process
	begin
        wait for CLK_HALF_PERIOD;
        clk <= not clk; 
	end process;

EncryptionRound_32_64: entity work.EncryptionRound
    generic map (32, 64)
    port map (
        word_0 => word_0_32_64,
        word_1 => word_1_32_64,
        subkey_0 => subkey_0_32_64, 
        subkey_1 => subkey_1_32_64, 
        subkey_2 => subkey_2_32_64, 
        subkey_3 => subkey_3_32_64,
        index => index_32_64,
        clk => clk,
        word_0_out => word_0_out_32_64, 
        word_1_out => word_1_out_32_64,
        subkey_0_out => subkey_0_out_32_64, 
        subkey_1_out => subkey_1_out_32_64, 
        subkey_2_out => subkey_2_out_32_64, 
        subkey_3_out => subkey_3_out_32_64
    );
 
 EncryptionRound_48_72: entity work.EncryptionRound
    generic map (48, 72)
    port map (
        word_0 => word_0_48_72,
        word_1 => word_1_48_72,
        subkey_0 => subkey_0_48_72, 
        subkey_1 => subkey_1_48_72, 
        subkey_2 => subkey_2_48_72, 
        subkey_3 => subkey_3_48_72,
        index => index_48_72,
        clk => clk,
        word_0_out => word_0_out_48_72, 
        word_1_out => word_1_out_48_72,
        subkey_0_out => subkey_0_out_48_72, 
        subkey_1_out => subkey_1_out_48_72, 
        subkey_2_out => subkey_2_out_48_72, 
        subkey_3_out => subkey_3_out_48_72
    );
        
 EncryptionRound_48_96: entity work.EncryptionRound
    generic map (48, 96)
    port map (
        word_0 => word_0_48_96,
        word_1 => word_1_48_96,
        subkey_0 => subkey_0_48_96, 
        subkey_1 => subkey_1_48_96, 
        subkey_2 => subkey_2_48_96, 
        subkey_3 => subkey_3_48_96,
        index => index_48_96,
        clk => clk,
        word_0_out => word_0_out_48_96, 
        word_1_out => word_1_out_48_96,
        subkey_0_out => subkey_0_out_48_96, 
        subkey_1_out => subkey_1_out_48_96, 
        subkey_2_out => subkey_2_out_48_96, 
        subkey_3_out => subkey_3_out_48_96
    );         

EncryptionRound_64_96: entity work.EncryptionRound
    generic map (64, 96)
    port map (
        word_0 => word_0_64_96,
        word_1 => word_1_64_96,
        subkey_0 => subkey_0_64_96, 
        subkey_1 => subkey_1_64_96, 
        subkey_2 => subkey_2_64_96, 
        subkey_3 => subkey_3_64_96,
        index => index_64_96,
        clk => clk,
        word_0_out => word_0_out_64_96, 
        word_1_out => word_1_out_64_96,
        subkey_0_out => subkey_0_out_64_96, 
        subkey_1_out => subkey_1_out_64_96, 
        subkey_2_out => subkey_2_out_64_96, 
        subkey_3_out => subkey_3_out_64_96
    );

EncryptionRound_64_128: entity work.EncryptionRound
    generic map (64, 128)
    port map (
        word_0 => word_0_64_128,
        word_1 => word_1_64_128,
        subkey_0 => subkey_0_64_128, 
        subkey_1 => subkey_1_64_128, 
        subkey_2 => subkey_2_64_128, 
        subkey_3 => subkey_3_64_128,
        index => index_64_128,
        clk => clk,
        word_0_out => word_0_out_64_128, 
        word_1_out => word_1_out_64_128,
        subkey_0_out => subkey_0_out_64_128, 
        subkey_1_out => subkey_1_out_64_128, 
        subkey_2_out => subkey_2_out_64_128, 
        subkey_3_out => subkey_3_out_64_128
    );
    
EncryptionRound_96_96: entity work.EncryptionRound
    generic map (96, 96)
    port map (
        word_0 => word_0_96_96,
        word_1 => word_1_96_96,
        subkey_0 => subkey_0_96_96, 
        subkey_1 => subkey_1_96_96, 
        subkey_2 => subkey_2_96_96, 
        subkey_3 => subkey_3_96_96,
        index => index_96_96,
        clk => clk,
        word_0_out => word_0_out_96_96, 
        word_1_out => word_1_out_96_96,
        subkey_0_out => subkey_0_out_96_96, 
        subkey_1_out => subkey_1_out_96_96, 
        subkey_2_out => subkey_2_out_96_96, 
        subkey_3_out => subkey_3_out_96_96
    );

EncryptionRound_96_144: entity work.EncryptionRound
    generic map (96, 144)
    port map (
        word_0 => word_0_96_144,
        word_1 => word_1_96_144,
        subkey_0 => subkey_0_96_144, 
        subkey_1 => subkey_1_96_144, 
        subkey_2 => subkey_2_96_144, 
        subkey_3 => subkey_3_96_144,
        index => index_96_144,
        clk => clk,
        word_0_out => word_0_out_96_144, 
        word_1_out => word_1_out_96_144,
        subkey_0_out => subkey_0_out_96_144, 
        subkey_1_out => subkey_1_out_96_144, 
        subkey_2_out => subkey_2_out_96_144, 
        subkey_3_out => subkey_3_out_96_144
    );  
    
EncryptionRound_128_128: entity work.EncryptionRound
    generic map (128, 128)
    port map (
        word_0 => word_0_128_128,
        word_1 => word_1_128_128,
        subkey_0 => subkey_0_128_128, 
        subkey_1 => subkey_1_128_128, 
        subkey_2 => subkey_2_128_128, 
        subkey_3 => subkey_3_128_128,
        index => index_128_128,
        clk => clk,
        word_0_out => word_0_out_128_128, 
        word_1_out => word_1_out_128_128,
        subkey_0_out => subkey_0_out_128_128, 
        subkey_1_out => subkey_1_out_128_128, 
        subkey_2_out => subkey_2_out_128_128, 
        subkey_3_out => subkey_3_out_128_128
    );   
 
 EncryptionRound_128_192: entity work.EncryptionRound
    generic map (128, 192)
    port map (
        word_0 => word_0_128_192,
        word_1 => word_1_128_192,
        subkey_0 => subkey_0_128_192, 
        subkey_1 => subkey_1_128_192, 
        subkey_2 => subkey_2_128_192, 
        subkey_3 => subkey_3_128_192,
        index => index_128_192,
        clk => clk,
        word_0_out => word_0_out_128_192, 
        word_1_out => word_1_out_128_192,
        subkey_0_out => subkey_0_out_128_192, 
        subkey_1_out => subkey_1_out_128_192, 
        subkey_2_out => subkey_2_out_128_192, 
        subkey_3_out => subkey_3_out_128_192
    );
    
EncryptionRound_128_256: entity work.EncryptionRound
    generic map (128, 256)
    port map (
        word_0 => word_0_128_256,
        word_1 => word_1_128_256,
        subkey_0 => subkey_0_128_256, 
        subkey_1 => subkey_1_128_256, 
        subkey_2 => subkey_2_128_256, 
        subkey_3 => subkey_3_128_256,
        index => index_128_256,
        clk => clk,
        word_0_out => word_0_out_128_256, 
        word_1_out => word_1_out_128_256,
        subkey_0_out => subkey_0_out_128_256, 
        subkey_1_out => subkey_1_out_128_256, 
        subkey_2_out => subkey_2_out_128_256, 
        subkey_3_out => subkey_3_out_128_256
    );
 
tb_er_set_32_64: process
        begin
            word_0_32_64 <= 16x"e662";
            word_1_32_64 <= 16x"82e2";
            subkey_0_32_64 <= 16x"682";
            subkey_1_32_64 <= 16x"e3e7";
            subkey_2_32_64 <= 16x"9455";
            subkey_3_32_64 <= 16x"6baa";
            index_32_64 <= 16x"0";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"346e";
            word_1_32_64 <= 16x"ade5";
            subkey_0_32_64 <= 16x"cc41";
            subkey_1_32_64 <= 16x"d649";
            subkey_2_32_64 <= 16x"9455";
            subkey_3_32_64 <= 16x"6baa";
            index_32_64 <= 16x"1";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"e230";
            word_1_32_64 <= 16x"3388";
            subkey_0_32_64 <= 16x"466f";
            subkey_1_32_64 <= 16x"d649";
            subkey_2_32_64 <= 16x"7768";
            subkey_3_32_64 <= 16x"6baa";
            index_32_64 <= 16x"2";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"3c3b";
            word_1_32_64 <= 16x"b4f8";
            subkey_0_32_64 <= 16x"82f9";
            subkey_1_32_64 <= 16x"d649";
            subkey_2_32_64 <= 16x"7768";
            subkey_3_32_64 <= 16x"9b44";
            index_32_64 <= 16x"3";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"5fb1";
            word_1_32_64 <= 16x"af5d";
            subkey_0_32_64 <= 16x"1d40";
            subkey_1_32_64 <= 16x"16a6";
            subkey_2_32_64 <= 16x"7768";
            subkey_3_32_64 <= 16x"9b44";
            index_32_64 <= 16x"4";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"788a";
            word_1_32_64 <= 16x"64f";
            subkey_0_32_64 <= 16x"9b2a";
            subkey_1_32_64 <= 16x"16a6";
            subkey_2_32_64 <= 16x"ee2a";
            subkey_3_32_64 <= 16x"9b44";
            index_32_64 <= 16x"5";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"6f95";
            word_1_32_64 <= 16x"8dbc";
            subkey_0_32_64 <= 16x"48cf";
            subkey_1_32_64 <= 16x"16a6";
            subkey_2_32_64 <= 16x"ee2a";
            subkey_3_32_64 <= 16x"2465";
            index_32_64 <= 16x"6";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"1e2a";
            word_1_32_64 <= 16x"a07f";
            subkey_0_32_64 <= 16x"b7c7";
            subkey_1_32_64 <= 16x"94fa";
            subkey_2_32_64 <= 16x"ee2a";
            subkey_3_32_64 <= 16x"2465";
            index_32_64 <= 16x"7";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"d205";
            word_1_32_64 <= 16x"aaad";
            subkey_0_32_64 <= 16x"d2ba";
            subkey_1_32_64 <= 16x"94fa";
            subkey_2_32_64 <= 16x"da4";
            subkey_3_32_64 <= 16x"2465";
            index_32_64 <= 16x"8";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"b7f7";
            word_1_32_64 <= 16x"ffe0";
            subkey_0_32_64 <= 16x"d7e1";
            subkey_1_32_64 <= 16x"94fa";
            subkey_2_32_64 <= 16x"da4";
            subkey_3_32_64 <= 16x"9d0a";
            index_32_64 <= 16x"9";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"71c9";
            word_1_32_64 <= 16x"ae17";
            subkey_0_32_64 <= 16x"9284";
            subkey_1_32_64 <= 16x"cd03";
            subkey_2_32_64 <= 16x"da4";
            subkey_3_32_64 <= 16x"9d0a";
            index_32_64 <= 16x"a";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"f484";
            word_1_32_64 <= 16x"33a1";
            subkey_0_32_64 <= 16x"9087";
            subkey_1_32_64 <= 16x"cd03";
            subkey_2_32_64 <= 16x"da95";
            subkey_3_32_64 <= 16x"9d0a";
            index_32_64 <= 16x"b";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"747f";
            word_1_32_64 <= 16x"a66c";
            subkey_0_32_64 <= 16x"e7d4";
            subkey_1_32_64 <= 16x"cd03";
            subkey_2_32_64 <= 16x"da95";
            subkey_3_32_64 <= 16x"a5ca";
            index_32_64 <= 16x"c";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"7be2";
            word_1_32_64 <= 16x"aa1f";
            subkey_0_32_64 <= 16x"7031";
            subkey_1_32_64 <= 16x"ef62";
            subkey_2_32_64 <= 16x"da95";
            subkey_3_32_64 <= 16x"a5ca";
            index_32_64 <= 16x"d";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"248e";
            word_1_32_64 <= 16x"cb07";
            subkey_0_32_64 <= 16x"5b2e";
            subkey_1_32_64 <= 16x"ef62";
            subkey_2_32_64 <= 16x"9beb";
            subkey_3_32_64 <= 16x"a5ca";
            index_32_64 <= 16x"e";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"fd32";
            word_1_32_64 <= 16x"6f0a";
            subkey_0_32_64 <= 16x"9cce";
            subkey_1_32_64 <= 16x"ef62";
            subkey_2_32_64 <= 16x"9beb";
            subkey_3_32_64 <= 16x"f077";
            index_32_64 <= 16x"f";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"7a15";
            word_1_32_64 <= 16x"8ede";
            subkey_0_32_64 <= 16x"1199";
            subkey_1_32_64 <= 16x"62a3";
            subkey_2_32_64 <= 16x"9beb";
            subkey_3_32_64 <= 16x"f077";
            index_32_64 <= 16x"10";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"cefe";
            word_1_32_64 <= 16x"26ab";
            subkey_0_32_64 <= 16x"aea4";
            subkey_1_32_64 <= 16x"62a3";
            subkey_2_32_64 <= 16x"e8c0";
            subkey_3_32_64 <= 16x"f077";
            index_32_64 <= 16x"11";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"b014";
            word_1_32_64 <= 16x"8bef";
            subkey_0_32_64 <= 16x"2407";
            subkey_1_32_64 <= 16x"62a3";
            subkey_2_32_64 <= 16x"e8c0";
            subkey_3_32_64 <= 16x"9e95";
            index_32_64 <= 16x"12";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"6b7e";
            word_1_32_64 <= 16x"ab2c";
            subkey_0_32_64 <= 16x"fac2";
            subkey_1_32_64 <= 16x"6ade";
            subkey_2_32_64 <= 16x"e8c0";
            subkey_3_32_64 <= 16x"9e95";
            index_32_64 <= 16x"13";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"93ef";
            word_1_32_64 <= 16x"3e16";
            subkey_0_32_64 <= 16x"978b";
            subkey_1_32_64 <= 16x"6ade";
            subkey_2_32_64 <= 16x"7c80";
            subkey_3_32_64 <= 16x"9e95";
            index_32_64 <= 16x"14";
            wait until rising_edge(clk);
    
            word_0_32_64 <= 16x"185e";
            word_1_32_64 <= 16x"57e0";
            subkey_0_32_64 <= 16x"9cf2";
            subkey_1_32_64 <= 16x"6ade";
            subkey_2_32_64 <= 16x"7c80";
            subkey_3_32_64 <= 16x"c2dc";
            index_32_64 <= 16x"15";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_32_64: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"346e") report "32-Bit Block, 64-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_32_64=16x"ade5") report "32-Bit Block, 64-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"cc41") report "32-Bit Block, 64-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"d649") report "32-Bit Block, 64-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"9455") report "32-Bit Block, 64-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"6baa") report "32-Bit Block, 64-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"e230") report "32-Bit Block, 64-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_32_64=16x"3388") report "32-Bit Block, 64-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"466f") report "32-Bit Block, 64-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"d649") report "32-Bit Block, 64-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"7768") report "32-Bit Block, 64-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"6baa") report "32-Bit Block, 64-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"3c3b") report "32-Bit Block, 64-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_32_64=16x"b4f8") report "32-Bit Block, 64-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"82f9") report "32-Bit Block, 64-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"d649") report "32-Bit Block, 64-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"7768") report "32-Bit Block, 64-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9b44") report "32-Bit Block, 64-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"5fb1") report "32-Bit Block, 64-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_32_64=16x"af5d") report "32-Bit Block, 64-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"1d40") report "32-Bit Block, 64-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"16a6") report "32-Bit Block, 64-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"7768") report "32-Bit Block, 64-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9b44") report "32-Bit Block, 64-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"788a") report "32-Bit Block, 64-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_32_64=16x"64f") report "32-Bit Block, 64-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"9b2a") report "32-Bit Block, 64-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"16a6") report "32-Bit Block, 64-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"ee2a") report "32-Bit Block, 64-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9b44") report "32-Bit Block, 64-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"6f95") report "32-Bit Block, 64-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_32_64=16x"8dbc") report "32-Bit Block, 64-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"48cf") report "32-Bit Block, 64-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"16a6") report "32-Bit Block, 64-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"ee2a") report "32-Bit Block, 64-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"2465") report "32-Bit Block, 64-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"1e2a") report "32-Bit Block, 64-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_32_64=16x"a07f") report "32-Bit Block, 64-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"b7c7") report "32-Bit Block, 64-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"94fa") report "32-Bit Block, 64-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"ee2a") report "32-Bit Block, 64-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"2465") report "32-Bit Block, 64-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"d205") report "32-Bit Block, 64-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_32_64=16x"aaad") report "32-Bit Block, 64-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"d2ba") report "32-Bit Block, 64-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"94fa") report "32-Bit Block, 64-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"da4") report "32-Bit Block, 64-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"2465") report "32-Bit Block, 64-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"b7f7") report "32-Bit Block, 64-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_32_64=16x"ffe0") report "32-Bit Block, 64-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"d7e1") report "32-Bit Block, 64-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"94fa") report "32-Bit Block, 64-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"da4") report "32-Bit Block, 64-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9d0a") report "32-Bit Block, 64-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"71c9") report "32-Bit Block, 64-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_32_64=16x"ae17") report "32-Bit Block, 64-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"9284") report "32-Bit Block, 64-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"cd03") report "32-Bit Block, 64-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"da4") report "32-Bit Block, 64-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9d0a") report "32-Bit Block, 64-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"f484") report "32-Bit Block, 64-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_32_64=16x"33a1") report "32-Bit Block, 64-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"9087") report "32-Bit Block, 64-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"cd03") report "32-Bit Block, 64-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"da95") report "32-Bit Block, 64-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9d0a") report "32-Bit Block, 64-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"747f") report "32-Bit Block, 64-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_32_64=16x"a66c") report "32-Bit Block, 64-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"e7d4") report "32-Bit Block, 64-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"cd03") report "32-Bit Block, 64-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"da95") report "32-Bit Block, 64-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"a5ca") report "32-Bit Block, 64-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"7be2") report "32-Bit Block, 64-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_32_64=16x"aa1f") report "32-Bit Block, 64-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"7031") report "32-Bit Block, 64-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"ef62") report "32-Bit Block, 64-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"da95") report "32-Bit Block, 64-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"a5ca") report "32-Bit Block, 64-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"248e") report "32-Bit Block, 64-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_32_64=16x"cb07") report "32-Bit Block, 64-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"5b2e") report "32-Bit Block, 64-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"ef62") report "32-Bit Block, 64-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"9beb") report "32-Bit Block, 64-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"a5ca") report "32-Bit Block, 64-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"fd32") report "32-Bit Block, 64-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_32_64=16x"6f0a") report "32-Bit Block, 64-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"9cce") report "32-Bit Block, 64-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"ef62") report "32-Bit Block, 64-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"9beb") report "32-Bit Block, 64-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"f077") report "32-Bit Block, 64-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"7a15") report "32-Bit Block, 64-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_32_64=16x"8ede") report "32-Bit Block, 64-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"1199") report "32-Bit Block, 64-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"62a3") report "32-Bit Block, 64-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"9beb") report "32-Bit Block, 64-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"f077") report "32-Bit Block, 64-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"cefe") report "32-Bit Block, 64-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_32_64=16x"26ab") report "32-Bit Block, 64-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"aea4") report "32-Bit Block, 64-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"62a3") report "32-Bit Block, 64-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"e8c0") report "32-Bit Block, 64-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"f077") report "32-Bit Block, 64-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"b014") report "32-Bit Block, 64-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_32_64=16x"8bef") report "32-Bit Block, 64-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"2407") report "32-Bit Block, 64-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"62a3") report "32-Bit Block, 64-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"e8c0") report "32-Bit Block, 64-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9e95") report "32-Bit Block, 64-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"6b7e") report "32-Bit Block, 64-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_32_64=16x"ab2c") report "32-Bit Block, 64-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"fac2") report "32-Bit Block, 64-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"6ade") report "32-Bit Block, 64-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"e8c0") report "32-Bit Block, 64-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9e95") report "32-Bit Block, 64-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"93ef") report "32-Bit Block, 64-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_32_64=16x"3e16") report "32-Bit Block, 64-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"978b") report "32-Bit Block, 64-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"6ade") report "32-Bit Block, 64-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"7c80") report "32-Bit Block, 64-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"9e95") report "32-Bit Block, 64-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"185e") report "32-Bit Block, 64-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_32_64=16x"57e0") report "32-Bit Block, 64-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"9cf2") report "32-Bit Block, 64-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"6ade") report "32-Bit Block, 64-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"7c80") report "32-Bit Block, 64-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"c2dc") report "32-Bit Block, 64-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_32_64=16x"2487") report "32-Bit Block, 64-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_32_64=16x"45ff") report "32-Bit Block, 64-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_32_64=16x"2a18") report "32-Bit Block, 64-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_32_64=16x"59d2") report "32-Bit Block, 64-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_32_64=16x"7c80") report "32-Bit Block, 64-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_32_64=16x"c2dc") report "32-Bit Block, 64-Bit Key, Encryption Round Test 21 Failed!" severity error;
    
            report "32-Bit Block, 64-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_48_72: process
        begin
            word_0_48_72 <= 24x"332876";
            word_1_48_72 <= 24x"474e81";
            subkey_0_48_72 <= 24x"43df78";
            subkey_1_48_72 <= 24x"1613e4";
            subkey_2_48_72 <= 24x"6fe87a";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"0";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"6ef30d";
            word_1_48_72 <= 24x"f7b0bc";
            subkey_0_48_72 <= 24x"390e49";
            subkey_1_48_72 <= 24x"27f58b";
            subkey_2_48_72 <= 24x"6fe87a";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"1";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"657c9f";
            word_1_48_72 <= 24x"12e4f4";
            subkey_0_48_72 <= 24x"7b0c79";
            subkey_1_48_72 <= 24x"27f58b";
            subkey_2_48_72 <= 24x"b37e30";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"2";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"96701";
            word_1_48_72 <= 24x"2283fa";
            subkey_0_48_72 <= 24x"de57a7";
            subkey_1_48_72 <= 24x"6346c";
            subkey_2_48_72 <= 24x"b37e30";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"3";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"96e62b";
            word_1_48_72 <= 24x"ddde23";
            subkey_0_48_72 <= 24x"fdb618";
            subkey_1_48_72 <= 24x"6346c";
            subkey_2_48_72 <= 24x"f0b26";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"4";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"f0434d";
            word_1_48_72 <= 24x"477211";
            subkey_0_48_72 <= 24x"840c8f";
            subkey_1_48_72 <= 24x"69bc48";
            subkey_2_48_72 <= 24x"f0b26";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"5";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"79c5f";
            word_1_48_72 <= 24x"858630";
            subkey_0_48_72 <= 24x"8a7fe3";
            subkey_1_48_72 <= 24x"69bc48";
            subkey_2_48_72 <= 24x"aa1b9f";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"6";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"8ebcfe";
            word_1_48_72 <= 24x"b25e06";
            subkey_0_48_72 <= 24x"811685";
            subkey_1_48_72 <= 24x"d2e999";
            subkey_2_48_72 <= 24x"aa1b9f";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"7";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"619e2d";
            word_1_48_72 <= 24x"1479d9";
            subkey_0_48_72 <= 24x"28748b";
            subkey_1_48_72 <= 24x"d2e999";
            subkey_2_48_72 <= 24x"20c0a7";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"8";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"1e3746";
            word_1_48_72 <= 24x"12c62d";
            subkey_0_48_72 <= 24x"81e325";
            subkey_1_48_72 <= 24x"c2477c";
            subkey_2_48_72 <= 24x"20c0a7";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"9";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"3b1319";
            word_1_48_72 <= 24x"caa929";
            subkey_0_48_72 <= 24x"261ac0";
            subkey_1_48_72 <= 24x"c2477c";
            subkey_2_48_72 <= 24x"2903ec";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"a";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"9a5fcb";
            word_1_48_72 <= 24x"42c702";
            subkey_0_48_72 <= 24x"920b0c";
            subkey_1_48_72 <= 24x"a2dd0d";
            subkey_2_48_72 <= 24x"2903ec";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"b";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"dc57c2";
            word_1_48_72 <= 24x"ea99e";
            subkey_0_48_72 <= 24x"ee6c60";
            subkey_1_48_72 <= 24x"a2dd0d";
            subkey_2_48_72 <= 24x"7e3404";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"c";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"76b41d";
            word_1_48_72 <= 24x"940a0b";
            subkey_0_48_72 <= 24x"8f6c36";
            subkey_1_48_72 <= 24x"fc0f31";
            subkey_2_48_72 <= 24x"7e3404";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"d";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"b884fa";
            word_1_48_72 <= 24x"d2411";
            subkey_0_48_72 <= 24x"e88bd3";
            subkey_1_48_72 <= 24x"fc0f31";
            subkey_2_48_72 <= 24x"93ea67";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"e";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"e53e18";
            word_1_48_72 <= 24x"2119cd";
            subkey_0_48_72 <= 24x"5ed973";
            subkey_1_48_72 <= 24x"1a87ec";
            subkey_2_48_72 <= 24x"93ea67";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"f";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"c57685";
            word_1_48_72 <= 24x"ec8642";
            subkey_0_48_72 <= 24x"30a6c8";
            subkey_1_48_72 <= 24x"1a87ec";
            subkey_2_48_72 <= 24x"c66d52";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"10";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"1371ed";
            word_1_48_72 <= 24x"38c5c3";
            subkey_0_48_72 <= 24x"99f71e";
            subkey_1_48_72 <= 24x"1cc15f";
            subkey_2_48_72 <= 24x"c66d52";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"11";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"d4d2c4";
            word_1_48_72 <= 24x"4f5dac";
            subkey_0_48_72 <= 24x"23056e";
            subkey_1_48_72 <= 24x"1cc15f";
            subkey_2_48_72 <= 24x"ecbd9a";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"12";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"4b169";
            word_1_48_72 <= 24x"a2274f";
            subkey_0_48_72 <= 24x"9a094c";
            subkey_1_48_72 <= 24x"82223d";
            subkey_2_48_72 <= 24x"ecbd9a";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"13";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"ebd194";
            word_1_48_72 <= 24x"ce5adc";
            subkey_0_48_72 <= 24x"e4bc7e";
            subkey_1_48_72 <= 24x"82223d";
            subkey_2_48_72 <= 24x"34f61a";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"14";
            wait until rising_edge(clk);
    
            word_0_48_72 <= 24x"72af37";
            word_1_48_72 <= 24x"2c2390";
            subkey_0_48_72 <= 24x"7dd43";
            subkey_1_48_72 <= 24x"223eb4";
            subkey_2_48_72 <= 24x"34f61a";
            subkey_3_48_72 <= 24x"0";
            index_48_72 <= 24x"15";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_48_72: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"6ef30d") report "48-Bit Block, 72-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_48_72=24x"f7b0bc") report "48-Bit Block, 72-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"390e49") report "48-Bit Block, 72-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"27f58b") report "48-Bit Block, 72-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"6fe87a") report "48-Bit Block, 72-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"657c9f") report "48-Bit Block, 72-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_48_72=24x"12e4f4") report "48-Bit Block, 72-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"7b0c79") report "48-Bit Block, 72-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"27f58b") report "48-Bit Block, 72-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"b37e30") report "48-Bit Block, 72-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"96701") report "48-Bit Block, 72-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_48_72=24x"2283fa") report "48-Bit Block, 72-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"de57a7") report "48-Bit Block, 72-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"6346c") report "48-Bit Block, 72-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"b37e30") report "48-Bit Block, 72-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"96e62b") report "48-Bit Block, 72-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_48_72=24x"ddde23") report "48-Bit Block, 72-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"fdb618") report "48-Bit Block, 72-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"6346c") report "48-Bit Block, 72-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"f0b26") report "48-Bit Block, 72-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"f0434d") report "48-Bit Block, 72-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_48_72=24x"477211") report "48-Bit Block, 72-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"840c8f") report "48-Bit Block, 72-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"69bc48") report "48-Bit Block, 72-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"f0b26") report "48-Bit Block, 72-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"79c5f") report "48-Bit Block, 72-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_48_72=24x"858630") report "48-Bit Block, 72-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"8a7fe3") report "48-Bit Block, 72-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"69bc48") report "48-Bit Block, 72-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"aa1b9f") report "48-Bit Block, 72-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"8ebcfe") report "48-Bit Block, 72-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_48_72=24x"b25e06") report "48-Bit Block, 72-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"811685") report "48-Bit Block, 72-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"d2e999") report "48-Bit Block, 72-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"aa1b9f") report "48-Bit Block, 72-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"619e2d") report "48-Bit Block, 72-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_48_72=24x"1479d9") report "48-Bit Block, 72-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"28748b") report "48-Bit Block, 72-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"d2e999") report "48-Bit Block, 72-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"20c0a7") report "48-Bit Block, 72-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"1e3746") report "48-Bit Block, 72-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_48_72=24x"12c62d") report "48-Bit Block, 72-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"81e325") report "48-Bit Block, 72-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"c2477c") report "48-Bit Block, 72-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"20c0a7") report "48-Bit Block, 72-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"3b1319") report "48-Bit Block, 72-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_48_72=24x"caa929") report "48-Bit Block, 72-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"261ac0") report "48-Bit Block, 72-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"c2477c") report "48-Bit Block, 72-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"2903ec") report "48-Bit Block, 72-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"9a5fcb") report "48-Bit Block, 72-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_48_72=24x"42c702") report "48-Bit Block, 72-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"920b0c") report "48-Bit Block, 72-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"a2dd0d") report "48-Bit Block, 72-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"2903ec") report "48-Bit Block, 72-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"dc57c2") report "48-Bit Block, 72-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_48_72=24x"ea99e") report "48-Bit Block, 72-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"ee6c60") report "48-Bit Block, 72-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"a2dd0d") report "48-Bit Block, 72-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"7e3404") report "48-Bit Block, 72-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"76b41d") report "48-Bit Block, 72-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_48_72=24x"940a0b") report "48-Bit Block, 72-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"8f6c36") report "48-Bit Block, 72-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"fc0f31") report "48-Bit Block, 72-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"7e3404") report "48-Bit Block, 72-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"b884fa") report "48-Bit Block, 72-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_48_72=24x"d2411") report "48-Bit Block, 72-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"e88bd3") report "48-Bit Block, 72-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"fc0f31") report "48-Bit Block, 72-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"93ea67") report "48-Bit Block, 72-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"e53e18") report "48-Bit Block, 72-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_48_72=24x"2119cd") report "48-Bit Block, 72-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"5ed973") report "48-Bit Block, 72-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"1a87ec") report "48-Bit Block, 72-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"93ea67") report "48-Bit Block, 72-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"c57685") report "48-Bit Block, 72-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_48_72=24x"ec8642") report "48-Bit Block, 72-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"30a6c8") report "48-Bit Block, 72-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"1a87ec") report "48-Bit Block, 72-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"c66d52") report "48-Bit Block, 72-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"1371ed") report "48-Bit Block, 72-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_48_72=24x"38c5c3") report "48-Bit Block, 72-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"99f71e") report "48-Bit Block, 72-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"1cc15f") report "48-Bit Block, 72-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"c66d52") report "48-Bit Block, 72-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"d4d2c4") report "48-Bit Block, 72-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_48_72=24x"4f5dac") report "48-Bit Block, 72-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"23056e") report "48-Bit Block, 72-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"1cc15f") report "48-Bit Block, 72-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"ecbd9a") report "48-Bit Block, 72-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"4b169") report "48-Bit Block, 72-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_48_72=24x"a2274f") report "48-Bit Block, 72-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"9a094c") report "48-Bit Block, 72-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"82223d") report "48-Bit Block, 72-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"ecbd9a") report "48-Bit Block, 72-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"ebd194") report "48-Bit Block, 72-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_48_72=24x"ce5adc") report "48-Bit Block, 72-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"e4bc7e") report "48-Bit Block, 72-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"82223d") report "48-Bit Block, 72-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"34f61a") report "48-Bit Block, 72-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"72af37") report "48-Bit Block, 72-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_48_72=24x"2c2390") report "48-Bit Block, 72-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"7dd43") report "48-Bit Block, 72-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"223eb4") report "48-Bit Block, 72-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"34f61a") report "48-Bit Block, 72-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_72=24x"907fa2") report "48-Bit Block, 72-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_48_72=24x"50619") report "48-Bit Block, 72-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_48_72=24x"1cf834") report "48-Bit Block, 72-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_48_72=24x"223eb4") report "48-Bit Block, 72-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_48_72=24x"22122c") report "48-Bit Block, 72-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_48_72=24x"0") report "48-Bit Block, 72-Bit Key, Encryption Round Test 21 Failed!" severity error;
    
            report "48-Bit Block, 72-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_48_96: process
        begin
            word_0_48_96 <= 24x"f4590b";
            word_1_48_96 <= 24x"4b3ee6";
            subkey_0_48_96 <= 24x"268673";
            subkey_1_48_96 <= 24x"612f48";
            subkey_2_48_96 <= 24x"7923c6";
            subkey_3_48_96 <= 24x"c17c62";
            index_48_96 <= 24x"0";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"5eea65";
            word_1_48_96 <= 24x"fc223a";
            subkey_0_48_96 <= 24x"5ad43b";
            subkey_1_48_96 <= 24x"6ee7a2";
            subkey_2_48_96 <= 24x"7923c6";
            subkey_3_48_96 <= 24x"c17c62";
            index_48_96 <= 24x"1";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"346196";
            word_1_48_96 <= 24x"c332bc";
            subkey_0_48_96 <= 24x"f7ec85";
            subkey_1_48_96 <= 24x"6ee7a2";
            subkey_2_48_96 <= 24x"214d5f";
            subkey_3_48_96 <= 24x"c17c62";
            index_48_96 <= 24x"2";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"a5c4fc";
            word_1_48_96 <= 24x"6c84d";
            subkey_0_48_96 <= 24x"e5ca2c";
            subkey_1_48_96 <= 24x"6ee7a2";
            subkey_2_48_96 <= 24x"214d5f";
            subkey_3_48_96 <= 24x"5aae03";
            index_48_96 <= 24x"3";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"39260d";
            word_1_48_96 <= 24x"1701e8";
            subkey_0_48_96 <= 24x"a66877";
            subkey_1_48_96 <= 24x"883910";
            subkey_2_48_96 <= 24x"214d5f";
            subkey_3_48_96 <= 24x"5aae03";
            index_48_96 <= 24x"4";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"4e6510";
            word_1_48_96 <= 24x"875579";
            subkey_0_48_96 <= 24x"36ca7d";
            subkey_1_48_96 <= 24x"883910";
            subkey_2_48_96 <= 24x"589c0";
            subkey_3_48_96 <= 24x"5aae03";
            index_48_96 <= 24x"5";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"820e9a";
            word_1_48_96 <= 24x"f12618";
            subkey_0_48_96 <= 24x"8c76c7";
            subkey_1_48_96 <= 24x"883910";
            subkey_2_48_96 <= 24x"589c0";
            subkey_3_48_96 <= 24x"3a252e";
            index_48_96 <= 24x"6";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"6fdd3";
            word_1_48_96 <= 24x"168907";
            subkey_0_48_96 <= 24x"ff493a";
            subkey_1_48_96 <= 24x"9cff06";
            subkey_2_48_96 <= 24x"589c0";
            subkey_3_48_96 <= 24x"3a252e";
            index_48_96 <= 24x"7";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"c6b3fe";
            word_1_48_96 <= 24x"f15d66";
            subkey_0_48_96 <= 24x"450713";
            subkey_1_48_96 <= 24x"9cff06";
            subkey_2_48_96 <= 24x"bf4ec4";
            subkey_3_48_96 <= 24x"3a252e";
            index_48_96 <= 24x"8";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"5d3dbe";
            word_1_48_96 <= 24x"68a248";
            subkey_0_48_96 <= 24x"5b79aa";
            subkey_1_48_96 <= 24x"9cff06";
            subkey_2_48_96 <= 24x"bf4ec4";
            subkey_3_48_96 <= 24x"734130";
            index_48_96 <= 24x"9";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"173238";
            word_1_48_96 <= 24x"fedfca";
            subkey_0_48_96 <= 24x"b9dbf2";
            subkey_1_48_96 <= 24x"6216a0";
            subkey_2_48_96 <= 24x"bf4ec4";
            subkey_3_48_96 <= 24x"734130";
            index_48_96 <= 24x"a";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"e27b25";
            word_1_48_96 <= 24x"5beae5";
            subkey_0_48_96 <= 24x"b044df";
            subkey_1_48_96 <= 24x"6216a0";
            subkey_2_48_96 <= 24x"7e9b4a";
            subkey_3_48_96 <= 24x"734130";
            index_48_96 <= 24x"b";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"644aff";
            word_1_48_96 <= 24x"7793d0";
            subkey_0_48_96 <= 24x"629ed6";
            subkey_1_48_96 <= 24x"6216a0";
            subkey_2_48_96 <= 24x"7e9b4a";
            subkey_3_48_96 <= 24x"e0b82b";
            index_48_96 <= 24x"c";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"740bbf";
            word_1_48_96 <= 24x"565c44";
            subkey_0_48_96 <= 24x"17f653";
            subkey_1_48_96 <= 24x"300e0";
            subkey_2_48_96 <= 24x"7e9b4a";
            subkey_3_48_96 <= 24x"e0b82b";
            index_48_96 <= 24x"d";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"fc9b3";
            word_1_48_96 <= 24x"af9448";
            subkey_0_48_96 <= 24x"ddc67b";
            subkey_1_48_96 <= 24x"300e0";
            subkey_2_48_96 <= 24x"6274e3";
            subkey_3_48_96 <= 24x"e0b82b";
            index_48_96 <= 24x"e";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"fbf2a4";
            word_1_48_96 <= 24x"85bf3c";
            subkey_0_48_96 <= 24x"e794e3";
            subkey_1_48_96 <= 24x"300e0";
            subkey_2_48_96 <= 24x"6274e3";
            subkey_3_48_96 <= 24x"9a73d";
            index_48_96 <= 24x"f";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"79a7";
            word_1_48_96 <= 24x"dfec80";
            subkey_0_48_96 <= 24x"fb30f3";
            subkey_1_48_96 <= 24x"c797ec";
            subkey_2_48_96 <= 24x"6274e3";
            subkey_3_48_96 <= 24x"9a73d";
            index_48_96 <= 24x"10";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"79a458";
            word_1_48_96 <= 24x"7a6960";
            subkey_0_48_96 <= 24x"714e8";
            subkey_1_48_96 <= 24x"c797ec";
            subkey_2_48_96 <= 24x"de9377";
            subkey_3_48_96 <= 24x"9a73d";
            index_48_96 <= 24x"11";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"1028ea";
            word_1_48_96 <= 24x"dd0a29";
            subkey_0_48_96 <= 24x"7cb9de";
            subkey_1_48_96 <= 24x"c797ec";
            subkey_2_48_96 <= 24x"de9377";
            subkey_3_48_96 <= 24x"441e9e";
            index_48_96 <= 24x"12";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"c7fb7a";
            word_1_48_96 <= 24x"46bc2a";
            subkey_0_48_96 <= 24x"8c4f94";
            subkey_1_48_96 <= 24x"698167";
            subkey_2_48_96 <= 24x"de9377";
            subkey_3_48_96 <= 24x"441e9e";
            index_48_96 <= 24x"13";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"41d674";
            word_1_48_96 <= 24x"7e0da2";
            subkey_0_48_96 <= 24x"665290";
            subkey_1_48_96 <= 24x"698167";
            subkey_2_48_96 <= 24x"42e34";
            subkey_3_48_96 <= 24x"441e9e";
            index_48_96 <= 24x"14";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"8cb5b3";
            word_1_48_96 <= 24x"820611";
            subkey_0_48_96 <= 24x"360239";
            subkey_1_48_96 <= 24x"698167";
            subkey_2_48_96 <= 24x"42e34";
            subkey_3_48_96 <= 24x"496ba";
            index_48_96 <= 24x"15";
            wait until rising_edge(clk);
    
            word_0_48_96 <= 24x"cd981c";
            word_1_48_96 <= 24x"a83580";
            subkey_0_48_96 <= 24x"2d7a66";
            subkey_1_48_96 <= 24x"9d6baf";
            subkey_2_48_96 <= 24x"42e34";
            subkey_3_48_96 <= 24x"496ba";
            index_48_96 <= 24x"16";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_48_96: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"5eea65") report "48-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_48_96=24x"fc223a") report "48-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"5ad43b") report "48-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"6ee7a2") report "48-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"7923c6") report "48-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"c17c62") report "48-Bit Block, 96-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"346196") report "48-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_48_96=24x"c332bc") report "48-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"f7ec85") report "48-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"6ee7a2") report "48-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"214d5f") report "48-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"c17c62") report "48-Bit Block, 96-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"a5c4fc") report "48-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_48_96=24x"6c84d") report "48-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"e5ca2c") report "48-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"6ee7a2") report "48-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"214d5f") report "48-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"5aae03") report "48-Bit Block, 96-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"39260d") report "48-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_48_96=24x"1701e8") report "48-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"a66877") report "48-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"883910") report "48-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"214d5f") report "48-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"5aae03") report "48-Bit Block, 96-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"4e6510") report "48-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_48_96=24x"875579") report "48-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"36ca7d") report "48-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"883910") report "48-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"589c0") report "48-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"5aae03") report "48-Bit Block, 96-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"820e9a") report "48-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_48_96=24x"f12618") report "48-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"8c76c7") report "48-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"883910") report "48-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"589c0") report "48-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"3a252e") report "48-Bit Block, 96-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"6fdd3") report "48-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_48_96=24x"168907") report "48-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"ff493a") report "48-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"9cff06") report "48-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"589c0") report "48-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"3a252e") report "48-Bit Block, 96-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"c6b3fe") report "48-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_48_96=24x"f15d66") report "48-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"450713") report "48-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"9cff06") report "48-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"bf4ec4") report "48-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"3a252e") report "48-Bit Block, 96-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"5d3dbe") report "48-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_48_96=24x"68a248") report "48-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"5b79aa") report "48-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"9cff06") report "48-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"bf4ec4") report "48-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"734130") report "48-Bit Block, 96-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"173238") report "48-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_48_96=24x"fedfca") report "48-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"b9dbf2") report "48-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"6216a0") report "48-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"bf4ec4") report "48-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"734130") report "48-Bit Block, 96-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"e27b25") report "48-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_48_96=24x"5beae5") report "48-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"b044df") report "48-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"6216a0") report "48-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"7e9b4a") report "48-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"734130") report "48-Bit Block, 96-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"644aff") report "48-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_48_96=24x"7793d0") report "48-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"629ed6") report "48-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"6216a0") report "48-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"7e9b4a") report "48-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"e0b82b") report "48-Bit Block, 96-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"740bbf") report "48-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_48_96=24x"565c44") report "48-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"17f653") report "48-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"300e0") report "48-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"7e9b4a") report "48-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"e0b82b") report "48-Bit Block, 96-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"fc9b3") report "48-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_48_96=24x"af9448") report "48-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"ddc67b") report "48-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"300e0") report "48-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"6274e3") report "48-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"e0b82b") report "48-Bit Block, 96-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"fbf2a4") report "48-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_48_96=24x"85bf3c") report "48-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"e794e3") report "48-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"300e0") report "48-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"6274e3") report "48-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"9a73d") report "48-Bit Block, 96-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"79a7") report "48-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_48_96=24x"dfec80") report "48-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"fb30f3") report "48-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"c797ec") report "48-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"6274e3") report "48-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"9a73d") report "48-Bit Block, 96-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"79a458") report "48-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_48_96=24x"7a6960") report "48-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"714e8") report "48-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"c797ec") report "48-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"de9377") report "48-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"9a73d") report "48-Bit Block, 96-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"1028ea") report "48-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_48_96=24x"dd0a29") report "48-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"7cb9de") report "48-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"c797ec") report "48-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"de9377") report "48-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"441e9e") report "48-Bit Block, 96-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"c7fb7a") report "48-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_48_96=24x"46bc2a") report "48-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"8c4f94") report "48-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"698167") report "48-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"de9377") report "48-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"441e9e") report "48-Bit Block, 96-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"41d674") report "48-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_48_96=24x"7e0da2") report "48-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"665290") report "48-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"698167") report "48-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"42e34") report "48-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"441e9e") report "48-Bit Block, 96-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"8cb5b3") report "48-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_48_96=24x"820611") report "48-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"360239") report "48-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"698167") report "48-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"42e34") report "48-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"496ba") report "48-Bit Block, 96-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"cd981c") report "48-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_48_96=24x"a83580") report "48-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"2d7a66") report "48-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"9d6baf") report "48-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"42e34") report "48-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"496ba") report "48-Bit Block, 96-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_48_96=24x"ffad1") report "48-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_48_96=24x"633a37") report "48-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_48_96=24x"aadb3") report "48-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_48_96=24x"9d6baf") report "48-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_48_96=24x"617e82") report "48-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_48_96=24x"496ba") report "48-Bit Block, 96-Bit Key, Encryption Round Test 22 Failed!" severity error;
    
            report "48-Bit Block, 96-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_64_96: process
        begin
            word_0_64_96 <= 32x"19c78df4";
            word_1_64_96 <= 32x"5a921187";
            subkey_0_64_96 <= 32x"4f65d4d9";
            subkey_1_64_96 <= 32x"19488dec";
            subkey_2_64_96 <= 32x"bad640fb";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"0";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"207b9b7c";
            word_1_64_96 <= 32x"ee47f4dc";
            subkey_0_64_96 <= 32x"4051bbac";
            subkey_1_64_96 <= 32x"3b7f1d66";
            subkey_2_64_96 <= 32x"bad640fb";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"1";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"bee4833d";
            word_1_64_96 <= 32x"bd3858dc";
            subkey_0_64_96 <= 32x"3e814c8f";
            subkey_1_64_96 <= 32x"3b7f1d66";
            subkey_2_64_96 <= 32x"3c0c91ed";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"2";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"5204eef7";
            word_1_64_96 <= 32x"a520f71a";
            subkey_0_64_96 <= 32x"50b6afd7";
            subkey_1_64_96 <= 32x"a4bccbae";
            subkey_2_64_96 <= 32x"3c0c91ed";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"3";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"ac3bd783";
            word_1_64_96 <= 32x"3c1ca039";
            subkey_0_64_96 <= 32x"b847c2d1";
            subkey_1_64_96 <= 32x"a4bccbae";
            subkey_2_64_96 <= 32x"3df2bc6b";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"4";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"3cee8aef";
            word_1_64_96 <= 32x"5d3036f2";
            subkey_0_64_96 <= 32x"a4d26915";
            subkey_1_64_96 <= 32x"66ec7f98";
            subkey_2_64_96 <= 32x"3df2bc6b";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"5";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"6ced8549";
            word_1_64_96 <= 32x"8b99d230";
            subkey_0_64_96 <= 32x"36831379";
            subkey_1_64_96 <= 32x"66ec7f98";
            subkey_2_64_96 <= 32x"10105bd4";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"6";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"cc962629";
            word_1_64_96 <= 32x"abfa0c62";
            subkey_0_64_96 <= 32x"7af16437";
            subkey_1_64_96 <= 32x"cee9fffe";
            subkey_2_64_96 <= 32x"10105bd4";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"7";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"3102754c";
            word_1_64_96 <= 32x"55b34402";
            subkey_0_64_96 <= 32x"988a552e";
            subkey_1_64_96 <= 32x"cee9fffe";
            subkey_2_64_96 <= 32x"4f017495";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"8";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"23c1d7df";
            word_1_64_96 <= 32x"abd27dbe";
            subkey_0_64_96 <= 32x"530b9651";
            subkey_1_64_96 <= 32x"97593f25";
            subkey_2_64_96 <= 32x"4f017495";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"9";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"af6882f4";
            word_1_64_96 <= 32x"b1663c0d";
            subkey_0_64_96 <= 32x"70062546";
            subkey_1_64_96 <= 32x"97593f25";
            subkey_2_64_96 <= 32x"e85a97cc";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"a";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"b65bdbd3";
            word_1_64_96 <= 32x"cd1fcc76";
            subkey_0_64_96 <= 32x"15ac54bc";
            subkey_1_64_96 <= 32x"959d7e8f";
            subkey_2_64_96 <= 32x"e85a97cc";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"b";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"8a5a71be";
            word_1_64_96 <= 32x"3884af23";
            subkey_0_64_96 <= 32x"4ff60ab8";
            subkey_1_64_96 <= 32x"959d7e8f";
            subkey_2_64_96 <= 32x"e294af58";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"c";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"b0b77121";
            word_1_64_96 <= 32x"e264fcd5";
            subkey_0_64_96 <= 32x"a03bfdf8";
            subkey_1_64_96 <= 32x"df8ba83a";
            subkey_2_64_96 <= 32x"e294af58";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"d";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"a319a2e8";
            word_1_64_96 <= 32x"26a22be5";
            subkey_0_64_96 <= 32x"f8c17d6f";
            subkey_1_64_96 <= 32x"df8ba83a";
            subkey_2_64_96 <= 32x"f91e92aa";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"e";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"684c2f39";
            word_1_64_96 <= 32x"7081387c";
            subkey_0_64_96 <= 32x"f5aae266";
            subkey_1_64_96 <= 32x"33a10919";
            subkey_2_64_96 <= 32x"f91e92aa";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"f";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"53772bdc";
            word_1_64_96 <= 32x"11165217";
            subkey_0_64_96 <= 32x"df313c0";
            subkey_1_64_96 <= 32x"33a10919";
            subkey_2_64_96 <= 32x"a0a400f7";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"10";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"fcc20f0c";
            word_1_64_96 <= 32x"677b51ee";
            subkey_0_64_96 <= 32x"48be2ad9";
            subkey_1_64_96 <= 32x"2726b4d9";
            subkey_2_64_96 <= 32x"a0a400f7";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"11";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"4587d8e3";
            word_1_64_96 <= 32x"a397a084";
            subkey_0_64_96 <= 32x"5af9802";
            subkey_1_64_96 <= 32x"2726b4d9";
            subkey_2_64_96 <= 32x"405ecec8";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"12";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"e3ba2f9b";
            word_1_64_96 <= 32x"cf84e881";
            subkey_0_64_96 <= 32x"f3aa7eb4";
            subkey_1_64_96 <= 32x"ded6bea4";
            subkey_2_64_96 <= 32x"405ecec8";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"13";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"8bf2b6e8";
            word_1_64_96 <= 32x"9623ca37";
            subkey_0_64_96 <= 32x"26b92836";
            subkey_1_64_96 <= 32x"ded6bea4";
            subkey_2_64_96 <= 32x"bbeadd91";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"14";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"baa445c0";
            word_1_64_96 <= 32x"e531f284";
            subkey_0_64_96 <= 32x"fe5ebf51";
            subkey_1_64_96 <= 32x"cb97fee0";
            subkey_2_64_96 <= 32x"bbeadd91";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"15";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"14f5e6e6";
            word_1_64_96 <= 32x"c1d7c8e3";
            subkey_0_64_96 <= 32x"62ef50b4";
            subkey_1_64_96 <= 32x"cb97fee0";
            subkey_2_64_96 <= 32x"901aaa3b";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"16";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"3df7d92a";
            word_1_64_96 <= 32x"9a58ee1a";
            subkey_0_64_96 <= 32x"54c06d07";
            subkey_1_64_96 <= 32x"43bae8a4";
            subkey_2_64_96 <= 32x"901aaa3b";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"17";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"e3ec964e";
            word_1_64_96 <= 32x"c525f1f";
            subkey_0_64_96 <= 32x"3653ef9c";
            subkey_1_64_96 <= 32x"43bae8a4";
            subkey_2_64_96 <= 32x"905087a6";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"18";
            wait until rising_edge(clk);
    
            word_0_64_96 <= 32x"2bcfb546";
            word_1_64_96 <= 32x"34ab0731";
            subkey_0_64_96 <= 32x"6808d67d";
            subkey_1_64_96 <= 32x"da97aa9c";
            subkey_2_64_96 <= 32x"905087a6";
            subkey_3_64_96 <= 32x"0";
            index_64_96 <= 32x"19";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_64_96: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"207b9b7c") report "64-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_64_96=32x"ee47f4dc") report "64-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"4051bbac") report "64-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"3b7f1d66") report "64-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"bad640fb") report "64-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"bee4833d") report "64-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_64_96=32x"bd3858dc") report "64-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"3e814c8f") report "64-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"3b7f1d66") report "64-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"3c0c91ed") report "64-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"5204eef7") report "64-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_64_96=32x"a520f71a") report "64-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"50b6afd7") report "64-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"a4bccbae") report "64-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"3c0c91ed") report "64-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"ac3bd783") report "64-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_64_96=32x"3c1ca039") report "64-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"b847c2d1") report "64-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"a4bccbae") report "64-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"3df2bc6b") report "64-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"3cee8aef") report "64-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_64_96=32x"5d3036f2") report "64-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"a4d26915") report "64-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"66ec7f98") report "64-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"3df2bc6b") report "64-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"6ced8549") report "64-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_64_96=32x"8b99d230") report "64-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"36831379") report "64-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"66ec7f98") report "64-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"10105bd4") report "64-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"cc962629") report "64-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_64_96=32x"abfa0c62") report "64-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"7af16437") report "64-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"cee9fffe") report "64-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"10105bd4") report "64-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"3102754c") report "64-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_64_96=32x"55b34402") report "64-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"988a552e") report "64-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"cee9fffe") report "64-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"4f017495") report "64-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"23c1d7df") report "64-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_64_96=32x"abd27dbe") report "64-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"530b9651") report "64-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"97593f25") report "64-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"4f017495") report "64-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"af6882f4") report "64-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_64_96=32x"b1663c0d") report "64-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"70062546") report "64-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"97593f25") report "64-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"e85a97cc") report "64-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"b65bdbd3") report "64-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_64_96=32x"cd1fcc76") report "64-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"15ac54bc") report "64-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"959d7e8f") report "64-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"e85a97cc") report "64-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"8a5a71be") report "64-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_64_96=32x"3884af23") report "64-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"4ff60ab8") report "64-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"959d7e8f") report "64-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"e294af58") report "64-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"b0b77121") report "64-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_64_96=32x"e264fcd5") report "64-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"a03bfdf8") report "64-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"df8ba83a") report "64-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"e294af58") report "64-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"a319a2e8") report "64-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_64_96=32x"26a22be5") report "64-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"f8c17d6f") report "64-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"df8ba83a") report "64-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"f91e92aa") report "64-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"684c2f39") report "64-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_64_96=32x"7081387c") report "64-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"f5aae266") report "64-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"33a10919") report "64-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"f91e92aa") report "64-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"53772bdc") report "64-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_64_96=32x"11165217") report "64-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"df313c0") report "64-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"33a10919") report "64-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"a0a400f7") report "64-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"fcc20f0c") report "64-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_64_96=32x"677b51ee") report "64-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"48be2ad9") report "64-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"2726b4d9") report "64-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"a0a400f7") report "64-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"4587d8e3") report "64-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_64_96=32x"a397a084") report "64-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"5af9802") report "64-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"2726b4d9") report "64-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"405ecec8") report "64-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"e3ba2f9b") report "64-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_64_96=32x"cf84e881") report "64-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"f3aa7eb4") report "64-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"ded6bea4") report "64-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"405ecec8") report "64-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"8bf2b6e8") report "64-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_64_96=32x"9623ca37") report "64-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"26b92836") report "64-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"ded6bea4") report "64-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"bbeadd91") report "64-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"baa445c0") report "64-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_64_96=32x"e531f284") report "64-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"fe5ebf51") report "64-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"cb97fee0") report "64-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"bbeadd91") report "64-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"14f5e6e6") report "64-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_64_96=32x"c1d7c8e3") report "64-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"62ef50b4") report "64-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"cb97fee0") report "64-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"901aaa3b") report "64-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"3df7d92a") report "64-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_64_96=32x"9a58ee1a") report "64-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"54c06d07") report "64-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"43bae8a4") report "64-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"901aaa3b") report "64-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"e3ec964e") report "64-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_64_96=32x"c525f1f") report "64-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"3653ef9c") report "64-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"43bae8a4") report "64-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"905087a6") report "64-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"2bcfb546") report "64-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_64_96=32x"34ab0731") report "64-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"6808d67d") report "64-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"da97aa9c") report "64-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"905087a6") report "64-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_96=32x"6b711c01") report "64-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_64_96=32x"350cb630") report "64-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_64_96=32x"4edf94f6") report "64-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_64_96=32x"da97aa9c") report "64-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_64_96=32x"e99271d") report "64-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_64_96=32x"0") report "64-Bit Block, 96-Bit Key, Encryption Round Test 25 Failed!" severity error;
    
            report "64-Bit Block, 96-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_64_128: process
        begin
            word_0_64_128 <= 32x"f77383c1";
            word_1_64_128 <= 32x"8d723104";
            subkey_0_64_128 <= 32x"50f24455";
            subkey_1_64_128 <= 32x"9c6316b9";
            subkey_2_64_128 <= 32x"a3f2c9bf";
            subkey_3_64_128 <= 32x"e9bb17bc";
            index_64_128 <= 32x"0";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"176eafa8";
            word_1_64_128 <= 32x"acf2b1a7";
            subkey_0_64_128 <= 32x"8d1c85c1";
            subkey_1_64_128 <= 32x"a8ea76b";
            subkey_2_64_128 <= 32x"a3f2c9bf";
            subkey_3_64_128 <= 32x"e9bb17bc";
            index_64_128 <= 32x"1";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"89725ad8";
            word_1_64_128 <= 32x"32072798";
            subkey_0_64_128 <= 32x"24245687";
            subkey_1_64_128 <= 32x"a8ea76b";
            subkey_2_64_128 <= 32x"4cc0788b";
            subkey_3_64_128 <= 32x"e9bb17bc";
            index_64_128 <= 32x"2";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"4e12e1bc";
            word_1_64_128 <= 32x"5803778";
            subkey_0_64_128 <= 32x"c02ca5a5";
            subkey_1_64_128 <= 32x"a8ea76b";
            subkey_2_64_128 <= 32x"4cc0788b";
            subkey_3_64_128 <= 32x"e10e119c";
            index_64_128 <= 32x"3";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"76a3c9b4";
            word_1_64_128 <= 32x"634c456";
            subkey_0_64_128 <= 32x"2a521961";
            subkey_1_64_128 <= 32x"2b37344f";
            subkey_2_64_128 <= 32x"4cc0788b";
            subkey_3_64_128 <= 32x"e10e119c";
            index_64_128 <= 32x"4";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"53e5aaba";
            word_1_64_128 <= 32x"e6fbe719";
            subkey_0_64_128 <= 32x"e70e12d4";
            subkey_1_64_128 <= 32x"2b37344f";
            subkey_2_64_128 <= 32x"b59ed9dd";
            subkey_3_64_128 <= 32x"e10e119c";
            index_64_128 <= 32x"5";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"15efe1a7";
            word_1_64_128 <= 32x"8ac2b475";
            subkey_0_64_128 <= 32x"bb9fb647";
            subkey_1_64_128 <= 32x"2b37344f";
            subkey_2_64_128 <= 32x"b59ed9dd";
            subkey_3_64_128 <= 32x"83ef20e0";
            index_64_128 <= 32x"6";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"9f9a1f24";
            word_1_64_128 <= 32x"30e5121c";
            subkey_0_64_128 <= 32x"d6375f40";
            subkey_1_64_128 <= 32x"acaed7d";
            subkey_2_64_128 <= 32x"b59ed9dd";
            subkey_3_64_128 <= 32x"83ef20e0";
            index_64_128 <= 32x"7";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"912ca252";
            word_1_64_128 <= 32x"6dfc5b76";
            subkey_0_64_128 <= 32x"2560418";
            subkey_1_64_128 <= 32x"acaed7d";
            subkey_2_64_128 <= 32x"b3ecfe1e";
            subkey_3_64_128 <= 32x"83ef20e0";
            index_64_128 <= 32x"8";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"8ca98821";
            word_1_64_128 <= 32x"5cc9ab5";
            subkey_0_64_128 <= 32x"f069d3f0";
            subkey_1_64_128 <= 32x"acaed7d";
            subkey_2_64_128 <= 32x"b3ecfe1e";
            subkey_3_64_128 <= 32x"e2d9f330";
            index_64_128 <= 32x"9";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"d48ac647";
            word_1_64_128 <= 32x"b1c6874b";
            subkey_0_64_128 <= 32x"ee3a0153";
            subkey_1_64_128 <= 32x"6d749ed4";
            subkey_2_64_128 <= 32x"b3ecfe1e";
            subkey_3_64_128 <= 32x"e2d9f330";
            index_64_128 <= 32x"a";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"6a50bfa3";
            word_1_64_128 <= 32x"ce068d9d";
            subkey_0_64_128 <= 32x"7d3de4c4";
            subkey_1_64_128 <= 32x"6d749ed4";
            subkey_2_64_128 <= 32x"cedee5b";
            subkey_3_64_128 <= 32x"e2d9f330";
            index_64_128 <= 32x"b";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"27a6dfef";
            word_1_64_128 <= 32x"752322f4";
            subkey_0_64_128 <= 32x"47cf989f";
            subkey_1_64_128 <= 32x"6d749ed4";
            subkey_2_64_128 <= 32x"cedee5b";
            subkey_3_64_128 <= 32x"ae20bebc";
            index_64_128 <= 32x"c";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"66e564f7";
            word_1_64_128 <= 32x"5bd39b8e";
            subkey_0_64_128 <= 32x"2241c9cb";
            subkey_1_64_128 <= 32x"1c3d0d31";
            subkey_2_64_128 <= 32x"cedee5b";
            subkey_3_64_128 <= 32x"ae20bebc";
            index_64_128 <= 32x"d";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"e02bd6e2";
            word_1_64_128 <= 32x"d700f159";
            subkey_0_64_128 <= 32x"6f40f9ed";
            subkey_1_64_128 <= 32x"1c3d0d31";
            subkey_2_64_128 <= 32x"7d4eb7b4";
            subkey_3_64_128 <= 32x"ae20bebc";
            index_64_128 <= 32x"e";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"541c9929";
            word_1_64_128 <= 32x"55422e3e";
            subkey_0_64_128 <= 32x"51e8d5ce";
            subkey_1_64_128 <= 32x"1c3d0d31";
            subkey_2_64_128 <= 32x"7d4eb7b4";
            subkey_3_64_128 <= 32x"2bef1aa5";
            index_64_128 <= 32x"f";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"637dc7d3";
            word_1_64_128 <= 32x"c3990e99";
            subkey_0_64_128 <= 32x"c43bca6";
            subkey_1_64_128 <= 32x"830512d4";
            subkey_2_64_128 <= 32x"7d4eb7b4";
            subkey_3_64_128 <= 32x"2bef1aa5";
            index_64_128 <= 32x"10";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"eaece2dc";
            word_1_64_128 <= 32x"f102dc47";
            subkey_0_64_128 <= 32x"a2dcee7d";
            subkey_1_64_128 <= 32x"830512d4";
            subkey_2_64_128 <= 32x"c0c10b4d";
            subkey_3_64_128 <= 32x"2bef1aa5";
            index_64_128 <= 32x"11";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"c7661d22";
            word_1_64_128 <= 32x"90010bc5";
            subkey_0_64_128 <= 32x"5eefae6b";
            subkey_1_64_128 <= 32x"830512d4";
            subkey_2_64_128 <= 32x"c0c10b4d";
            subkey_3_64_128 <= 32x"4808dd86";
            index_64_128 <= 32x"12";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"e9295950";
            word_1_64_128 <= 32x"d219b046";
            subkey_0_64_128 <= 32x"c40fc035";
            subkey_1_64_128 <= 32x"3372b36f";
            subkey_2_64_128 <= 32x"c0c10b4d";
            subkey_3_64_128 <= 32x"4808dd86";
            index_64_128 <= 32x"13";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"a2be79b2";
            word_1_64_128 <= 32x"ebf4b335";
            subkey_0_64_128 <= 32x"31ae80fd";
            subkey_1_64_128 <= 32x"3372b36f";
            subkey_2_64_128 <= 32x"11d08153";
            subkey_3_64_128 <= 32x"4808dd86";
            index_64_128 <= 32x"14";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"fcf7230d";
            word_1_64_128 <= 32x"e904ee98";
            subkey_0_64_128 <= 32x"3a828e27";
            subkey_1_64_128 <= 32x"3372b36f";
            subkey_2_64_128 <= 32x"11d08153";
            subkey_3_64_128 <= 32x"b7f689ce";
            index_64_128 <= 32x"15";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"48dbb1b3";
            word_1_64_128 <= 32x"af62a9dc";
            subkey_0_64_128 <= 32x"7da271f6";
            subkey_1_64_128 <= 32x"a9b600cf";
            subkey_2_64_128 <= 32x"11d08153";
            subkey_3_64_128 <= 32x"b7f689ce";
            index_64_128 <= 32x"16";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"1ef4e830";
            word_1_64_128 <= 32x"582965aa";
            subkey_0_64_128 <= 32x"3da7cdd2";
            subkey_1_64_128 <= 32x"a9b600cf";
            subkey_2_64_128 <= 32x"d0b44261";
            subkey_3_64_128 <= 32x"b7f689ce";
            index_64_128 <= 32x"17";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"34d9dc7";
            word_1_64_128 <= 32x"f4eadc47";
            subkey_0_64_128 <= 32x"e161aadd";
            subkey_1_64_128 <= 32x"a9b600cf";
            subkey_2_64_128 <= 32x"d0b44261";
            subkey_3_64_128 <= 32x"c5fc44c";
            index_64_128 <= 32x"18";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"b04fcc46";
            word_1_64_128 <= 32x"aa23227e";
            subkey_0_64_128 <= 32x"ba06362a";
            subkey_1_64_128 <= 32x"b10b60c5";
            subkey_2_64_128 <= 32x"d0b44261";
            subkey_3_64_128 <= 32x"c5fc44c";
            index_64_128 <= 32x"19";
            wait until rising_edge(clk);
    
            word_0_64_128 <= 32x"1681bb77";
            word_1_64_128 <= 32x"94ffd942";
            subkey_0_64_128 <= 32x"cbe75b20";
            subkey_1_64_128 <= 32x"b10b60c5";
            subkey_2_64_128 <= 32x"1bd6ea75";
            subkey_3_64_128 <= 32x"c5fc44c";
            index_64_128 <= 32x"1a";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_64_128: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"176eafa8") report "64-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_64_128=32x"acf2b1a7") report "64-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"8d1c85c1") report "64-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"a8ea76b") report "64-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"a3f2c9bf") report "64-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e9bb17bc") report "64-Bit Block, 128-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"89725ad8") report "64-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_64_128=32x"32072798") report "64-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"24245687") report "64-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"a8ea76b") report "64-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"4cc0788b") report "64-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e9bb17bc") report "64-Bit Block, 128-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"4e12e1bc") report "64-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_64_128=32x"5803778") report "64-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"c02ca5a5") report "64-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"a8ea76b") report "64-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"4cc0788b") report "64-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e10e119c") report "64-Bit Block, 128-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"76a3c9b4") report "64-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_64_128=32x"634c456") report "64-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"2a521961") report "64-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"2b37344f") report "64-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"4cc0788b") report "64-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e10e119c") report "64-Bit Block, 128-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"53e5aaba") report "64-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_64_128=32x"e6fbe719") report "64-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"e70e12d4") report "64-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"2b37344f") report "64-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"b59ed9dd") report "64-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e10e119c") report "64-Bit Block, 128-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"15efe1a7") report "64-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_64_128=32x"8ac2b475") report "64-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"bb9fb647") report "64-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"2b37344f") report "64-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"b59ed9dd") report "64-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"83ef20e0") report "64-Bit Block, 128-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"9f9a1f24") report "64-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_64_128=32x"30e5121c") report "64-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"d6375f40") report "64-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"acaed7d") report "64-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"b59ed9dd") report "64-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"83ef20e0") report "64-Bit Block, 128-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"912ca252") report "64-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_64_128=32x"6dfc5b76") report "64-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"2560418") report "64-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"acaed7d") report "64-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"b3ecfe1e") report "64-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"83ef20e0") report "64-Bit Block, 128-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"8ca98821") report "64-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_64_128=32x"5cc9ab5") report "64-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"f069d3f0") report "64-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"acaed7d") report "64-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"b3ecfe1e") report "64-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e2d9f330") report "64-Bit Block, 128-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"d48ac647") report "64-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_64_128=32x"b1c6874b") report "64-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"ee3a0153") report "64-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"6d749ed4") report "64-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"b3ecfe1e") report "64-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e2d9f330") report "64-Bit Block, 128-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"6a50bfa3") report "64-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_64_128=32x"ce068d9d") report "64-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"7d3de4c4") report "64-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"6d749ed4") report "64-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"cedee5b") report "64-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"e2d9f330") report "64-Bit Block, 128-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"27a6dfef") report "64-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_64_128=32x"752322f4") report "64-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"47cf989f") report "64-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"6d749ed4") report "64-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"cedee5b") report "64-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"ae20bebc") report "64-Bit Block, 128-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"66e564f7") report "64-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_64_128=32x"5bd39b8e") report "64-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"2241c9cb") report "64-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"1c3d0d31") report "64-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"cedee5b") report "64-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"ae20bebc") report "64-Bit Block, 128-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"e02bd6e2") report "64-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_64_128=32x"d700f159") report "64-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"6f40f9ed") report "64-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"1c3d0d31") report "64-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"7d4eb7b4") report "64-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"ae20bebc") report "64-Bit Block, 128-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"541c9929") report "64-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_64_128=32x"55422e3e") report "64-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"51e8d5ce") report "64-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"1c3d0d31") report "64-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"7d4eb7b4") report "64-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"2bef1aa5") report "64-Bit Block, 128-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"637dc7d3") report "64-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_64_128=32x"c3990e99") report "64-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"c43bca6") report "64-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"830512d4") report "64-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"7d4eb7b4") report "64-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"2bef1aa5") report "64-Bit Block, 128-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"eaece2dc") report "64-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_64_128=32x"f102dc47") report "64-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"a2dcee7d") report "64-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"830512d4") report "64-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"c0c10b4d") report "64-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"2bef1aa5") report "64-Bit Block, 128-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"c7661d22") report "64-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_64_128=32x"90010bc5") report "64-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"5eefae6b") report "64-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"830512d4") report "64-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"c0c10b4d") report "64-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"4808dd86") report "64-Bit Block, 128-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"e9295950") report "64-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_64_128=32x"d219b046") report "64-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"c40fc035") report "64-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"3372b36f") report "64-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"c0c10b4d") report "64-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"4808dd86") report "64-Bit Block, 128-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"a2be79b2") report "64-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_64_128=32x"ebf4b335") report "64-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"31ae80fd") report "64-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"3372b36f") report "64-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"11d08153") report "64-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"4808dd86") report "64-Bit Block, 128-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"fcf7230d") report "64-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_64_128=32x"e904ee98") report "64-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"3a828e27") report "64-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"3372b36f") report "64-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"11d08153") report "64-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"b7f689ce") report "64-Bit Block, 128-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"48dbb1b3") report "64-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_64_128=32x"af62a9dc") report "64-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"7da271f6") report "64-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"a9b600cf") report "64-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"11d08153") report "64-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"b7f689ce") report "64-Bit Block, 128-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"1ef4e830") report "64-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_64_128=32x"582965aa") report "64-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"3da7cdd2") report "64-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"a9b600cf") report "64-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"d0b44261") report "64-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"b7f689ce") report "64-Bit Block, 128-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"34d9dc7") report "64-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_64_128=32x"f4eadc47") report "64-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"e161aadd") report "64-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"a9b600cf") report "64-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"d0b44261") report "64-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"c5fc44c") report "64-Bit Block, 128-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"b04fcc46") report "64-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_64_128=32x"aa23227e") report "64-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"ba06362a") report "64-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"b10b60c5") report "64-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"d0b44261") report "64-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"c5fc44c") report "64-Bit Block, 128-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"1681bb77") report "64-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_64_128=32x"94ffd942") report "64-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"cbe75b20") report "64-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"b10b60c5") report "64-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"1bd6ea75") report "64-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"c5fc44c") report "64-Bit Block, 128-Bit Key, Encryption Round Test 25 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_64_128=32x"26fc3bc8") report "64-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (word_1_out_64_128=32x"92f1e070") report "64-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_0_out_64_128=32x"48c963f8") report "64-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_1_out_64_128=32x"b10b60c5") report "64-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_2_out_64_128=32x"1bd6ea75") report "64-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_3_out_64_128=32x"17f3bafe") report "64-Bit Block, 128-Bit Key, Encryption Round Test 26 Failed!" severity error;
    
            report "64-Bit Block, 128-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_96_96: process
        begin
            word_0_96_96 <= 48x"1681c8f8e3d0";
            word_1_96_96 <= 48x"a0116be5ab0c";
            subkey_0_96_96 <= 48x"f39e71545a13";
            subkey_1_96_96 <= 48x"85776e9add84";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"0";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"64b1ecf78de8";
            word_1_96_96 <= 48x"d0bfab309368";
            subkey_0_96_96 <= 48x"e4d06260246f";
            subkey_1_96_96 <= 48x"7823e8c2f4f0";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"1";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"cdda97ef557";
            word_1_96_96 <= 48x"2952cec29a14";
            subkey_0_96_96 <= 48x"f3cb9549c41d";
            subkey_1_96_96 <= 48x"d5488648e762";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"2";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"b42022f3d954";
            word_1_96_96 <= 48x"d2cd690473ec";
            subkey_0_96_96 <= 48x"c8fc779e2de9";
            subkey_1_96_96 <= 48x"56a0ddd00d06";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"3";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"c90f905c3a8b";
            word_1_96_96 <= 48x"680e87c2f02e";
            subkey_0_96_96 <= 48x"88b0a48a92bb";
            subkey_1_96_96 <= 48x"cf53187bfdf5";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"4";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"37bbb888bb9e";
            word_1_96_96 <= 48x"7fc73a696fc0";
            subkey_0_96_96 <= 48x"3bfad3f79b60";
            subkey_1_96_96 <= 48x"7e7ff7a30ebc";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"5";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"7e1c6871629c";
            word_1_96_96 <= 48x"c3c1ac34be6d";
            subkey_0_96_96 <= 48x"27afcc53e56a";
            subkey_1_96_96 <= 48x"f87953ef3e6b";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"6";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"3caca5c566d3";
            word_1_96_96 <= 48x"cc4fe64e7230";
            subkey_0_96_96 <= 48x"aed62738ffff";
            subkey_1_96_96 <= 48x"93a845a7d4ae";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"7";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"26cbfcb87c23";
            word_1_96_96 <= 48x"c3aed2934aba";
            subkey_0_96_96 <= 48x"2bd8f6b95829";
            subkey_1_96_96 <= 48x"5d69cf7ea7d4";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"8";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"fc08b8f1b65d";
            word_1_96_96 <= 48x"ca575d325744";
            subkey_0_96_96 <= 48x"5ef1d5421791";
            subkey_1_96_96 <= 48x"366088d6d8";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"9";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"fe6702814dca";
            word_1_96_96 <= 48x"1e22c50cff25";
            subkey_0_96_96 <= 48x"c17ca1b21ce4";
            subkey_1_96_96 <= 48x"36f20ba2a06e";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"a";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"11c190fe287a";
            word_1_96_96 <= 48x"e2f984f4462d";
            subkey_0_96_96 <= 48x"24569e2d58a8";
            subkey_1_96_96 <= 48x"2fb393bdbf8e";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"b";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"95fe935f07b8";
            word_1_96_96 <= 48x"1bf214ae4468";
            subkey_0_96_96 <= 48x"9032a0abd32d";
            subkey_1_96_96 <= 48x"b28651c1166c";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"c";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"c1dcbf205b15";
            word_1_96_96 <= 48x"6e2825d866d1";
            subkey_0_96_96 <= 48x"7d7023a30d23";
            subkey_1_96_96 <= 48x"fce526fd944f";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"d";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"e0df3de7e6f6";
            word_1_96_96 <= 48x"ee3ac4e53e58";
            subkey_0_96_96 <= 48x"26ec15d263a1";
            subkey_1_96_96 <= 48x"cd6d08ca0aba";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"e";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"19d882419822";
            word_1_96_96 <= 48x"1f216d7eaf95";
            subkey_0_96_96 <= 48x"d6d92c4830ac";
            subkey_1_96_96 <= 48x"e1b982db2da5";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"f";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"b6ea9debe76d";
            word_1_96_96 <= 48x"782e8fe7267d";
            subkey_0_96_96 <= 48x"ca73878a8eb0";
            subkey_1_96_96 <= 48x"7cbae5cb0bd6";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"10";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"4945a4ae7b4e";
            word_1_96_96 <= 48x"fe114bf14023";
            subkey_0_96_96 <= 48x"f36c7e242c2d";
            subkey_1_96_96 <= 48x"a0f0427059ab";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"11";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"d402eead9ad1";
            word_1_96_96 <= 48x"9e2fcbde40a3";
            subkey_0_96_96 <= 48x"46e9f47fdf8";
            subkey_1_96_96 <= 48x"9f0d6e669c97";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"12";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"d3d8f4525267";
            word_1_96_96 <= 48x"73cf813e84e9";
            subkey_0_96_96 <= 48x"bf7956898b46";
            subkey_1_96_96 <= 48x"9c0dacb66486";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"13";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"9cf237c88893";
            word_1_96_96 <= 48x"235955a1bad";
            subkey_0_96_96 <= 48x"bddfd07a1b8c";
            subkey_1_96_96 <= 48x"4615643641b9";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"14";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"13ba0363bdbe";
            word_1_96_96 <= 48x"f42bbd27f922";
            subkey_0_96_96 <= 48x"99db660e8dbc";
            subkey_1_96_96 <= 48x"7725e5de51d9";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"15";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"32a5523385fb";
            word_1_96_96 <= 48x"af75492e680b";
            subkey_0_96_96 <= 48x"bd89bb8001fc";
            subkey_1_96_96 <= 48x"73528bf46c18";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"16";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"16f7ed609a46";
            word_1_96_96 <= 48x"83dd7cfcb59f";
            subkey_0_96_96 <= 48x"39b0d20bf99b";
            subkey_1_96_96 <= 48x"d5fd0e0bf67e";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"17";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"387473d2bd50";
            word_1_96_96 <= 48x"8fcb18d66f60";
            subkey_0_96_96 <= 48x"75005f45c95f";
            subkey_1_96_96 <= 48x"b886cf1a0586";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"18";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"2fa7ff3bb061";
            word_1_96_96 <= 48x"ec0461ae5ae0";
            subkey_0_96_96 <= 48x"53ba1c3aa987";
            subkey_1_96_96 <= 48x"fbb8e614e37c";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"19";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"3e11e67a7435";
            word_1_96_96 <= 48x"432e1fa7f73c";
            subkey_0_96_96 <= 48x"4d6534f5f249";
            subkey_1_96_96 <= 48x"d0b5d520be73";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"1a";
            wait until rising_edge(clk);
    
            word_0_96_96 <= 48x"c7bf13bc4fcc";
            word_1_96_96 <= 48x"3730206fee65";
            subkey_0_96_96 <= 48x"aa1c4d648157";
            subkey_1_96_96 <= 48x"c135eacb131d";
            subkey_2_96_96 <= 48x"0";
            subkey_3_96_96 <= 48x"0";
            index_96_96 <= 48x"1b";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_96_96: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"64b1ecf78de8") report "96-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_96_96=48x"d0bfab309368") report "96-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"e4d06260246f") report "96-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"7823e8c2f4f0") report "96-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"cdda97ef557") report "96-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_96_96=48x"2952cec29a14") report "96-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"f3cb9549c41d") report "96-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"d5488648e762") report "96-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"b42022f3d954") report "96-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_96_96=48x"d2cd690473ec") report "96-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"c8fc779e2de9") report "96-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"56a0ddd00d06") report "96-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"c90f905c3a8b") report "96-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_96_96=48x"680e87c2f02e") report "96-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"88b0a48a92bb") report "96-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"cf53187bfdf5") report "96-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"37bbb888bb9e") report "96-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_96_96=48x"7fc73a696fc0") report "96-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"3bfad3f79b60") report "96-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"7e7ff7a30ebc") report "96-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"7e1c6871629c") report "96-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_96_96=48x"c3c1ac34be6d") report "96-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"27afcc53e56a") report "96-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"f87953ef3e6b") report "96-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"3caca5c566d3") report "96-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_96_96=48x"cc4fe64e7230") report "96-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"aed62738ffff") report "96-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"93a845a7d4ae") report "96-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"26cbfcb87c23") report "96-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_96_96=48x"c3aed2934aba") report "96-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"2bd8f6b95829") report "96-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"5d69cf7ea7d4") report "96-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"fc08b8f1b65d") report "96-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_96_96=48x"ca575d325744") report "96-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"5ef1d5421791") report "96-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"366088d6d8") report "96-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"fe6702814dca") report "96-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_96_96=48x"1e22c50cff25") report "96-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"c17ca1b21ce4") report "96-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"36f20ba2a06e") report "96-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"11c190fe287a") report "96-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_96_96=48x"e2f984f4462d") report "96-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"24569e2d58a8") report "96-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"2fb393bdbf8e") report "96-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"95fe935f07b8") report "96-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_96_96=48x"1bf214ae4468") report "96-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"9032a0abd32d") report "96-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"b28651c1166c") report "96-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"c1dcbf205b15") report "96-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_96_96=48x"6e2825d866d1") report "96-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"7d7023a30d23") report "96-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"fce526fd944f") report "96-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"e0df3de7e6f6") report "96-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_96_96=48x"ee3ac4e53e58") report "96-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"26ec15d263a1") report "96-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"cd6d08ca0aba") report "96-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"19d882419822") report "96-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_96_96=48x"1f216d7eaf95") report "96-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"d6d92c4830ac") report "96-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"e1b982db2da5") report "96-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"b6ea9debe76d") report "96-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_96_96=48x"782e8fe7267d") report "96-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"ca73878a8eb0") report "96-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"7cbae5cb0bd6") report "96-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"4945a4ae7b4e") report "96-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_96_96=48x"fe114bf14023") report "96-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"f36c7e242c2d") report "96-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"a0f0427059ab") report "96-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"d402eead9ad1") report "96-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_96_96=48x"9e2fcbde40a3") report "96-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"46e9f47fdf8") report "96-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"9f0d6e669c97") report "96-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"d3d8f4525267") report "96-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_96_96=48x"73cf813e84e9") report "96-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"bf7956898b46") report "96-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"9c0dacb66486") report "96-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"9cf237c88893") report "96-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_96_96=48x"235955a1bad") report "96-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"bddfd07a1b8c") report "96-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"4615643641b9") report "96-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"13ba0363bdbe") report "96-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_96_96=48x"f42bbd27f922") report "96-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"99db660e8dbc") report "96-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"7725e5de51d9") report "96-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"32a5523385fb") report "96-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_96_96=48x"af75492e680b") report "96-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"bd89bb8001fc") report "96-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"73528bf46c18") report "96-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"16f7ed609a46") report "96-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_96_96=48x"83dd7cfcb59f") report "96-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"39b0d20bf99b") report "96-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"d5fd0e0bf67e") report "96-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"387473d2bd50") report "96-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_96_96=48x"8fcb18d66f60") report "96-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"75005f45c95f") report "96-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"b886cf1a0586") report "96-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"2fa7ff3bb061") report "96-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_96_96=48x"ec0461ae5ae0") report "96-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"53ba1c3aa987") report "96-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"fbb8e614e37c") report "96-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"3e11e67a7435") report "96-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_96_96=48x"432e1fa7f73c") report "96-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"4d6534f5f249") report "96-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"d0b5d520be73") report "96-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 25 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"c7bf13bc4fcc") report "96-Bit Block, 96-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (word_1_out_96_96=48x"3730206fee65") report "96-Bit Block, 96-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"aa1c4d648157") report "96-Bit Block, 96-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"c135eacb131d") report "96-Bit Block, 96-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 26 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_96=48x"bb12935a408b") report "96-Bit Block, 96-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (word_1_out_96_96=48x"86ea0eb83eed") report "96-Bit Block, 96-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_0_out_96_96=48x"973fe86b46cc") report "96-Bit Block, 96-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_1_out_96_96=48x"c7dd834f4c71") report "96-Bit Block, 96-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_2_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_3_out_96_96=48x"0") report "96-Bit Block, 96-Bit Key, Encryption Round Test 27 Failed!" severity error;
    
            report "96-Bit Block, 96-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_96_144: process
        begin
            word_0_96_144 <= 48x"e602eece328b";
            word_1_96_144 <= 48x"1beb37117d41";
            subkey_0_96_144 <= 48x"1e7f9ca5499d";
            subkey_1_96_144 <= 48x"d3fbf47a7e5b";
            subkey_2_96_144 <= 48x"aa90de1b372a";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"0";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"97630d199ca";
            word_1_96_144 <= 48x"396146a00d95";
            subkey_0_96_144 <= 48x"89af7db388f3";
            subkey_1_96_144 <= 48x"7a539899c41b";
            subkey_2_96_144 <= 48x"aa90de1b372a";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"1";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"5cb169277f74";
            word_1_96_144 <= 48x"1700efabb124";
            subkey_0_96_144 <= 48x"f921e30de3b7";
            subkey_1_96_144 <= 48x"7a539899c41b";
            subkey_2_96_144 <= 48x"b45a0e91a42b";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"2";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"9c62c0213330";
            word_1_96_144 <= 48x"79e9891ac892";
            subkey_0_96_144 <= 48x"dd932ec960c6";
            subkey_1_96_144 <= 48x"149c36a67d79";
            subkey_2_96_144 <= 48x"b45a0e91a42b";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"3";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"1059866ab4ba";
            word_1_96_144 <= 48x"f34f87632d3e";
            subkey_0_96_144 <= 48x"e5defe9cf45f";
            subkey_1_96_144 <= 48x"149c36a67d79";
            subkey_2_96_144 <= 48x"94788d7f269";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"4";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"285e183b4668";
            word_1_96_144 <= 48x"aa922b6ee3b8";
            subkey_0_96_144 <= 48x"70046e343827";
            subkey_1_96_144 <= 48x"5ef39ad39ad8";
            subkey_2_96_144 <= 48x"94788d7f269";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"5";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"d3fc0588be2d";
            word_1_96_144 <= 48x"910cc4528d6c";
            subkey_0_96_144 <= 48x"592ec41cd127";
            subkey_1_96_144 <= 48x"5ef39ad39ad8";
            subkey_2_96_144 <= 48x"d90db5bd101c";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"6";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"8643fa1430f3";
            word_1_96_144 <= 48x"19a3d651c19d";
            subkey_0_96_144 <= 48x"f8fb97512dfd";
            subkey_1_96_144 <= 48x"318db7b7a4c7";
            subkey_2_96_144 <= 48x"d90db5bd101c";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"7";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"e9b9da1a28d5";
            word_1_96_144 <= 48x"dba60abbaf49";
            subkey_0_96_144 <= 48x"d2081f8f84e5";
            subkey_1_96_144 <= 48x"318db7b7a4c7";
            subkey_2_96_144 <= 48x"15d4a506eb0a";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"8";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"ac534f7a26ce";
            word_1_96_144 <= 48x"e19d9fab6061";
            subkey_0_96_144 <= 48x"979513b1baf";
            subkey_1_96_144 <= 48x"9939ad473c81";
            subkey_2_96_144 <= 48x"15d4a506eb0a";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"9";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"65d7c7f3fff4";
            word_1_96_144 <= 48x"74dbc22c981";
            subkey_0_96_144 <= 48x"5845ac38ffeb";
            subkey_1_96_144 <= 48x"9939ad473c81";
            subkey_2_96_144 <= 48x"138f25e02293";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"a";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"9024861722f5";
            word_1_96_144 <= 48x"be9ab988dd56";
            subkey_0_96_144 <= 48x"1bf38421b877";
            subkey_1_96_144 <= 48x"d9dee5e6472d";
            subkey_2_96_144 <= 48x"138f25e02293";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"b";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"7c3494480409";
            word_1_96_144 <= 48x"fd10a4f113a5";
            subkey_0_96_144 <= 48x"709b324a5b2a";
            subkey_1_96_144 <= 48x"d9dee5e6472d";
            subkey_2_96_144 <= 48x"af0713479892";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"c";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"b30e34e68e7d";
            word_1_96_144 <= 48x"52aa96a6ae36";
            subkey_0_96_144 <= 48x"1aac8362982e";
            subkey_1_96_144 <= 48x"9e751130417d";
            subkey_2_96_144 <= 48x"af0713479892";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"d";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"6bbdfb2bdee8";
            word_1_96_144 <= 48x"f3cc5c1fad05";
            subkey_0_96_144 <= 48x"783f91611ebb";
            subkey_1_96_144 <= 48x"9e751130417d";
            subkey_2_96_144 <= 48x"ad5b8a75dfcb";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"e";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"54618fb8176d";
            word_1_96_144 <= 48x"98e56e6e02e";
            subkey_0_96_144 <= 48x"34228d7abb29";
            subkey_1_96_144 <= 48x"f5de06724ef2";
            subkey_2_96_144 <= 48x"ad5b8a75dfcb";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"f";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"1545eeb4fe0e";
            word_1_96_144 <= 48x"b64993744564";
            subkey_0_96_144 <= 48x"5edb82d0e84e";
            subkey_1_96_144 <= 48x"f5de06724ef2";
            subkey_2_96_144 <= 48x"ffcfe9053107";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"10";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"8d08cf3f6a6d";
            word_1_96_144 <= 48x"2727ba989a1d";
            subkey_0_96_144 <= 48x"a70d765018fe";
            subkey_1_96_144 <= 48x"51d160d75a8c";
            subkey_2_96_144 <= 48x"ffcfe9053107";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"11";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"6564f9514895";
            word_1_96_144 <= 48x"d2280aa1bf9";
            subkey_0_96_144 <= 48x"9766f4b9d9cb";
            subkey_1_96_144 <= 48x"51d160d75a8c";
            subkey_2_96_144 <= 48x"af0d46391e3e";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"12";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"e23325e26fd0";
            word_1_96_144 <= 48x"c914ef682b7b";
            subkey_0_96_144 <= 48x"988f63d47f6b";
            subkey_1_96_144 <= 48x"23b8c61ab137";
            subkey_2_96_144 <= 48x"af0d46391e3e";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"13";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"d4ea7616d617";
            word_1_96_144 <= 48x"c5735905a890";
            subkey_0_96_144 <= 48x"13456fb943c6";
            subkey_1_96_144 <= 48x"23b8c61ab137";
            subkey_2_96_144 <= 48x"d73e711ab89a";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"14";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"d1b9366028c7";
            word_1_96_144 <= 48x"76ea86d69879";
            subkey_0_96_144 <= 48x"d04255b54053";
            subkey_1_96_144 <= 48x"4a69287f5e63";
            subkey_2_96_144 <= 48x"d73e711ab89a";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"15";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"16bbc652f932";
            word_1_96_144 <= 48x"9b727553bf0c";
            subkey_0_96_144 <= 48x"e90b398c5980";
            subkey_1_96_144 <= 48x"4a69287f5e63";
            subkey_2_96_144 <= 48x"6b1994265b1e";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"16";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"7f8233d3dce1";
            word_1_96_144 <= 48x"ca5c01441571";
            subkey_0_96_144 <= 48x"40c6ed614cf";
            subkey_1_96_144 <= 48x"4c55a2b4d8c8";
            subkey_2_96_144 <= 48x"6b1994265b1e";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"17";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"9517f9dd332";
            word_1_96_144 <= 48x"f540e1033439";
            subkey_0_96_144 <= 48x"214feda9d45";
            subkey_1_96_144 <= 48x"4c55a2b4d8c8";
            subkey_2_96_144 <= 48x"2277886a3b3d";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"18";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"bd9c24ad2b3";
            word_1_96_144 <= 48x"41523ea44b23";
            subkey_0_96_144 <= 48x"dac6a2a9b82d";
            subkey_1_96_144 <= 48x"ca61547d5205";
            subkey_2_96_144 <= 48x"2277886a3b3d";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"19";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"ab13a4765b4b";
            word_1_96_144 <= 48x"f5ddb620ced3";
            subkey_0_96_144 <= 48x"c1dc0f7fe31f";
            subkey_1_96_144 <= 48x"ca61547d5205";
            subkey_2_96_144 <= 48x"17e91a322271";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"1a";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"e648aee1455b";
            word_1_96_144 <= 48x"bed58d539f06";
            subkey_0_96_144 <= 48x"c9460b2b7895";
            subkey_1_96_144 <= 48x"c7a670d4606b";
            subkey_2_96_144 <= 48x"17e91a322271";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"1b";
            wait until rising_edge(clk);
    
            word_0_96_144 <= 48x"1604f84fcab0";
            word_1_96_144 <= 48x"24418f45e06f";
            subkey_0_96_144 <= 48x"706dad1e6e02";
            subkey_1_96_144 <= 48x"c7a670d4606b";
            subkey_2_96_144 <= 48x"3a5df445aaac";
            subkey_3_96_144 <= 48x"0";
            index_96_144 <= 48x"1c";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_96_144: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"97630d199ca") report "96-Bit Block, 144-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_96_144=48x"396146a00d95") report "96-Bit Block, 144-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"89af7db388f3") report "96-Bit Block, 144-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"7a539899c41b") report "96-Bit Block, 144-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"aa90de1b372a") report "96-Bit Block, 144-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"5cb169277f74") report "96-Bit Block, 144-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_96_144=48x"1700efabb124") report "96-Bit Block, 144-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"f921e30de3b7") report "96-Bit Block, 144-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"7a539899c41b") report "96-Bit Block, 144-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"b45a0e91a42b") report "96-Bit Block, 144-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"9c62c0213330") report "96-Bit Block, 144-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_96_144=48x"79e9891ac892") report "96-Bit Block, 144-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"dd932ec960c6") report "96-Bit Block, 144-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"149c36a67d79") report "96-Bit Block, 144-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"b45a0e91a42b") report "96-Bit Block, 144-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"1059866ab4ba") report "96-Bit Block, 144-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_96_144=48x"f34f87632d3e") report "96-Bit Block, 144-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"e5defe9cf45f") report "96-Bit Block, 144-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"149c36a67d79") report "96-Bit Block, 144-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"94788d7f269") report "96-Bit Block, 144-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"285e183b4668") report "96-Bit Block, 144-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_96_144=48x"aa922b6ee3b8") report "96-Bit Block, 144-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"70046e343827") report "96-Bit Block, 144-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"5ef39ad39ad8") report "96-Bit Block, 144-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"94788d7f269") report "96-Bit Block, 144-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"d3fc0588be2d") report "96-Bit Block, 144-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_96_144=48x"910cc4528d6c") report "96-Bit Block, 144-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"592ec41cd127") report "96-Bit Block, 144-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"5ef39ad39ad8") report "96-Bit Block, 144-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"d90db5bd101c") report "96-Bit Block, 144-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"8643fa1430f3") report "96-Bit Block, 144-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_96_144=48x"19a3d651c19d") report "96-Bit Block, 144-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"f8fb97512dfd") report "96-Bit Block, 144-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"318db7b7a4c7") report "96-Bit Block, 144-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"d90db5bd101c") report "96-Bit Block, 144-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"e9b9da1a28d5") report "96-Bit Block, 144-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_96_144=48x"dba60abbaf49") report "96-Bit Block, 144-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"d2081f8f84e5") report "96-Bit Block, 144-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"318db7b7a4c7") report "96-Bit Block, 144-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"15d4a506eb0a") report "96-Bit Block, 144-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"ac534f7a26ce") report "96-Bit Block, 144-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_96_144=48x"e19d9fab6061") report "96-Bit Block, 144-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"979513b1baf") report "96-Bit Block, 144-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"9939ad473c81") report "96-Bit Block, 144-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"15d4a506eb0a") report "96-Bit Block, 144-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"65d7c7f3fff4") report "96-Bit Block, 144-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_96_144=48x"74dbc22c981") report "96-Bit Block, 144-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"5845ac38ffeb") report "96-Bit Block, 144-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"9939ad473c81") report "96-Bit Block, 144-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"138f25e02293") report "96-Bit Block, 144-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"9024861722f5") report "96-Bit Block, 144-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_96_144=48x"be9ab988dd56") report "96-Bit Block, 144-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"1bf38421b877") report "96-Bit Block, 144-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"d9dee5e6472d") report "96-Bit Block, 144-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"138f25e02293") report "96-Bit Block, 144-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"7c3494480409") report "96-Bit Block, 144-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_96_144=48x"fd10a4f113a5") report "96-Bit Block, 144-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"709b324a5b2a") report "96-Bit Block, 144-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"d9dee5e6472d") report "96-Bit Block, 144-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"af0713479892") report "96-Bit Block, 144-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"b30e34e68e7d") report "96-Bit Block, 144-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_96_144=48x"52aa96a6ae36") report "96-Bit Block, 144-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"1aac8362982e") report "96-Bit Block, 144-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"9e751130417d") report "96-Bit Block, 144-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"af0713479892") report "96-Bit Block, 144-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"6bbdfb2bdee8") report "96-Bit Block, 144-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_96_144=48x"f3cc5c1fad05") report "96-Bit Block, 144-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"783f91611ebb") report "96-Bit Block, 144-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"9e751130417d") report "96-Bit Block, 144-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"ad5b8a75dfcb") report "96-Bit Block, 144-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"54618fb8176d") report "96-Bit Block, 144-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_96_144=48x"98e56e6e02e") report "96-Bit Block, 144-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"34228d7abb29") report "96-Bit Block, 144-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"f5de06724ef2") report "96-Bit Block, 144-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"ad5b8a75dfcb") report "96-Bit Block, 144-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"1545eeb4fe0e") report "96-Bit Block, 144-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_96_144=48x"b64993744564") report "96-Bit Block, 144-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"5edb82d0e84e") report "96-Bit Block, 144-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"f5de06724ef2") report "96-Bit Block, 144-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"ffcfe9053107") report "96-Bit Block, 144-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"8d08cf3f6a6d") report "96-Bit Block, 144-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_96_144=48x"2727ba989a1d") report "96-Bit Block, 144-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"a70d765018fe") report "96-Bit Block, 144-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"51d160d75a8c") report "96-Bit Block, 144-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"ffcfe9053107") report "96-Bit Block, 144-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"6564f9514895") report "96-Bit Block, 144-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_96_144=48x"d2280aa1bf9") report "96-Bit Block, 144-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"9766f4b9d9cb") report "96-Bit Block, 144-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"51d160d75a8c") report "96-Bit Block, 144-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"af0d46391e3e") report "96-Bit Block, 144-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"e23325e26fd0") report "96-Bit Block, 144-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_96_144=48x"c914ef682b7b") report "96-Bit Block, 144-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"988f63d47f6b") report "96-Bit Block, 144-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"23b8c61ab137") report "96-Bit Block, 144-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"af0d46391e3e") report "96-Bit Block, 144-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"d4ea7616d617") report "96-Bit Block, 144-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_96_144=48x"c5735905a890") report "96-Bit Block, 144-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"13456fb943c6") report "96-Bit Block, 144-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"23b8c61ab137") report "96-Bit Block, 144-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"d73e711ab89a") report "96-Bit Block, 144-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"d1b9366028c7") report "96-Bit Block, 144-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_96_144=48x"76ea86d69879") report "96-Bit Block, 144-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"d04255b54053") report "96-Bit Block, 144-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"4a69287f5e63") report "96-Bit Block, 144-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"d73e711ab89a") report "96-Bit Block, 144-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"16bbc652f932") report "96-Bit Block, 144-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_96_144=48x"9b727553bf0c") report "96-Bit Block, 144-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"e90b398c5980") report "96-Bit Block, 144-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"4a69287f5e63") report "96-Bit Block, 144-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"6b1994265b1e") report "96-Bit Block, 144-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"7f8233d3dce1") report "96-Bit Block, 144-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_96_144=48x"ca5c01441571") report "96-Bit Block, 144-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"40c6ed614cf") report "96-Bit Block, 144-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"4c55a2b4d8c8") report "96-Bit Block, 144-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"6b1994265b1e") report "96-Bit Block, 144-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"9517f9dd332") report "96-Bit Block, 144-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_96_144=48x"f540e1033439") report "96-Bit Block, 144-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"214feda9d45") report "96-Bit Block, 144-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"4c55a2b4d8c8") report "96-Bit Block, 144-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"2277886a3b3d") report "96-Bit Block, 144-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"bd9c24ad2b3") report "96-Bit Block, 144-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_96_144=48x"41523ea44b23") report "96-Bit Block, 144-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"dac6a2a9b82d") report "96-Bit Block, 144-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"ca61547d5205") report "96-Bit Block, 144-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"2277886a3b3d") report "96-Bit Block, 144-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"ab13a4765b4b") report "96-Bit Block, 144-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_96_144=48x"f5ddb620ced3") report "96-Bit Block, 144-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"c1dc0f7fe31f") report "96-Bit Block, 144-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"ca61547d5205") report "96-Bit Block, 144-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"17e91a322271") report "96-Bit Block, 144-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 25 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"e648aee1455b") report "96-Bit Block, 144-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (word_1_out_96_144=48x"bed58d539f06") report "96-Bit Block, 144-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"c9460b2b7895") report "96-Bit Block, 144-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"c7a670d4606b") report "96-Bit Block, 144-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"17e91a322271") report "96-Bit Block, 144-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 26 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"1604f84fcab0") report "96-Bit Block, 144-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (word_1_out_96_144=48x"24418f45e06f") report "96-Bit Block, 144-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"706dad1e6e02") report "96-Bit Block, 144-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"c7a670d4606b") report "96-Bit Block, 144-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"3a5df445aaac") report "96-Bit Block, 144-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 27 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_96_144=48x"456356bf2b12") report "96-Bit Block, 144-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (word_1_out_96_144=48x"f54494c17e92") report "96-Bit Block, 144-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_0_out_96_144=48x"5f583b7c326d") report "96-Bit Block, 144-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_1_out_96_144=48x"dc35538f427e") report "96-Bit Block, 144-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_2_out_96_144=48x"3a5df445aaac") report "96-Bit Block, 144-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_3_out_96_144=48x"0") report "96-Bit Block, 144-Bit Key, Encryption Round Test 28 Failed!" severity error;
    
            report "96-Bit Block, 144-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_128_128: process
        begin
            word_0_128_128 <= 64x"5129fb7c6288e1a5";
            word_1_128_128 <= 64x"3dfabc08935ddd72";
            subkey_0_128_128 <= 64x"d080e66e552f233a";
            subkey_1_128_128 <= 64x"8a5006c1ec188efb";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"0";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"9aa8cbb52a741192";
            word_1_128_128 <= 64x"13e710563e331cb8";
            subkey_0_128_128 <= 64x"480c0507be62221e";
            subkey_1_128_128 <= 64x"cc0b3675171b3bc8";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"cff6ea6b6d70ea24";
            word_1_128_128 <= 64x"1ab0b7c23ed066b0";
            subkey_0_128_128 <= 64x"50b83803c0682daa";
            subkey_1_128_128 <= 64x"10d8103e33793d58";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"2";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"af1ef07b8440c606";
            word_1_128_128 <= 64x"d0a9a320efc79720";
            subkey_0_128_128 <= 64x"2d08d00dfddacbb7";
            subkey_1_128_128 <= 64x"a8c91013fe9ba6e5";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"3";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"9a10c9cf7aec761f";
            word_1_128_128 <= 64x"e2e74a1358ea462a";
            subkey_0_128_128 <= 64x"7af71971ff0f3ae7";
            subkey_1_128_128 <= 64x"12b1991e11d9675e";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"4";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"6e82e613a629ea7e";
            word_1_128_128 <= 64x"be04a868714a5a82";
            subkey_0_128_128 <= 64x"eb10084e558c371";
            subkey_1_128_128 <= 64x"d909cb0b1d21144a";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"5";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"8be6daa5da8ca45a";
            word_1_128_128 <= 64x"fff1ea38ebc3f7a9";
            subkey_0_128_128 <= 64x"2c020e68dab3ff08";
            subkey_1_128_128 <= 64x"598a0a4ff075e480";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"6";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"46d217d61daeb58d";
            word_1_128_128 <= 64x"19e4c2f8c9cb9759";
            subkey_0_128_128 <= 64x"cc4beb35ff3b8cab";
            subkey_1_128_128 <= 64x"ac5b98732aa474ea";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"7";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"6530a91c0436a1e5";
            word_1_128_128 <= 64x"53a017ace9430d8f";
            subkey_0_128_128 <= 64x"d4a71f618bba5446";
            subkey_1_128_128 <= 64x"b6f846ce72663118";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"8";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"9a61eb21b10bf9f";
            word_1_128_128 <= 64x"202356523aa5b0b4";
            subkey_0_128_128 <= 64x"4866eca407fe1849";
            subkey_1_128_128 <= 64x"ed5e17a85a2cba7f";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"9";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"b8905b3cb23081fe";
            word_1_128_128 <= 64x"f5a0aeac6ab57d06";
            subkey_0_128_128 <= 64x"8b632f9b8fa88740";
            subkey_1_128_128 <= 64x"c8544abbb058450a";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"a";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"f0640d9540b7bfce";
            word_1_128_128 <= 64x"34e6d470d133b03b";
            subkey_0_128_128 <= 64x"cd32ff3a361ce58b";
            subkey_1_128_128 <= 64x"962b83e64b58df8f";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"b";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"658a67f98229e882";
            word_1_128_128 <= 64x"e6aa0b53879416f5";
            subkey_0_128_128 <= 64x"355ed36fac8f123f";
            subkey_1_128_128 <= 64x"5cc92abe1c683e61";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"c";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"427cfea768712ab4";
            word_1_128_128 <= 64x"6e2fc16b793e6ea7";
            subkey_0_128_128 <= 64x"3c4d07e70ed3eb88";
            subkey_1_128_128 <= 64x"96bb9c9a6aab7a71";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"d";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"c641dcb49eb0d708";
            word_1_128_128 <= 64x"d5a6298fdd3982aa";
            subkey_0_128_128 <= 64x"4f8bfcbbdfa1cb4e";
            subkey_1_128_128 <= 64x"ade3c383a93e970f";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"e";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"c929bc104a96382";
            word_1_128_128 <= 64x"3e9c7e65f12fdbc4";
            subkey_0_128_128 <= 64x"236605a19e455399";
            subkey_1_128_128 <= 64x"5f39e07f634b09eb";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"f";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"9723e396d194dcd4";
            word_1_128_128 <= 64x"f3b73d9ef4dfc0c4";
            subkey_0_128_128 <= 64x"15f5128eef820264";
            subkey_1_128_128 <= 64x"ec53f821da89ead";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"10";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"f0fd94ec13ad5854";
            word_1_128_128 <= 64x"49e2885a9f0bbef0";
            subkey_0_128_128 <= 64x"6cab43b90d8fb832";
            subkey_1_128_128 <= 64x"c303d7ce719fab12";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"11";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"a0093adfea91e87";
            word_1_128_128 <= 64x"8dec34cd63c3dc20";
            subkey_0_128_128 <= 64x"1a345a58b07c965f";
            subkey_1_128_128 <= 64x"7f6e4790dc0157cc";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"12";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"60beb8d589388004";
            word_1_128_128 <= 64x"30ba25ba7c70743c";
            subkey_0_128_128 <= 64x"37111a65c2bc255c";
            subkey_1_128_128 <= 64x"e6b3c8a0415897a4";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"13";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"ae0bae32c8ccd507";
            word_1_128_128 <= 64x"abfe689e8108d524";
            subkey_0_128_128 <= 64x"637f1d00771c5701";
            subkey_1_128_128 <= 64x"dbf7ce2e62fd7de0";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"14";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"c195c00d563722e0";
            word_1_128_128 <= 64x"b1c8b19b10518add";
            subkey_0_128_128 <= 64x"5fa3fccd1d9dec61";
            subkey_1_128_128 <= 64x"445b14cea57f546a";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"15";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"cc4a74195d638f0d";
            word_1_128_128 <= 64x"c0e47473ecda980b";
            subkey_0_128_128 <= 64x"34f7b18900ac08aa";
            subkey_1_128_128 <= 64x"c9e857e1ec436ba0";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"16";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"8eaf49ce3ae01961";
            word_1_128_128 <= 64x"ecfce904d1fc610f";
            subkey_0_128_128 <= 64x"727c15a8e7f80952";
            subkey_1_128_128 <= 64x"d5c199e0e2984c03";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"17";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"999a1d6e0f4ad79c";
            word_1_128_128 <= 64x"ece0531fd84a1c90";
            subkey_0_128_128 <= 64x"e5b17a05f71aeb1a";
            subkey_1_128_128 <= 64x"7651d742c8daa189";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"18";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"3e76cb4a26f7646";
            word_1_128_128 <= 64x"cf3787c4d839caa2";
            subkey_0_128_128 <= 64x"42ac1bf281349d74";
            subkey_1_128_128 <= 64x"6f27cbdd39e3c5a3";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"19";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"fb21da6bf5089f54";
            word_1_128_128 <= 64x"e41abfcee6732d64";
            subkey_0_128_128 <= 64x"f37b9c2a57ca6a82";
            subkey_1_128_128 <= 64x"e61b43be5e6e8120";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1a";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"4a70ba5e3c6182a4";
            word_1_128_128 <= 64x"937e690194257803";
            subkey_0_128_128 <= 64x"8fbd563ca87b8d0e";
            subkey_1_128_128 <= 64x"1461b76e1628d919";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1b";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"923cbc0a76823030";
            word_1_128_128 <= 64x"c1b96efb958e2512";
            subkey_0_128_128 <= 64x"d53b0611554ddd88";
            subkey_1_128_128 <= 64x"a8d1b7f41691b5fc";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1c";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"e020933b934be259";
            word_1_128_128 <= 64x"71c57368275a63dd";
            subkey_0_128_128 <= 64x"783be743e30a8367";
            subkey_1_128_128 <= 64x"d1e3d7c949646f21";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1d";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"c4ad26318226ad14";
            word_1_128_128 <= 64x"c5a9bfed1879bfdb";
            subkey_0_128_128 <= 64x"5bd2f104b407fcf0";
            subkey_1_128_128 <= 64x"9a0dcb1bac53e7cb";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1e";
            wait until rising_edge(clk);
    
            word_0_128_128 <= 64x"dec90f79ca0db285";
            word_1_128_128 <= 64x"fba03ef5db38da23";
            subkey_0_128_128 <= 64x"f9fb76ea6f8bb74b";
            subkey_1_128_128 <= 64x"276cfecfcfb450c9";
            subkey_2_128_128 <= 64x"0";
            subkey_3_128_128 <= 64x"0";
            index_128_128 <= 64x"1f";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_128_128: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"9aa8cbb52a741192") report "128-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_128_128=64x"13e710563e331cb8") report "128-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"480c0507be62221e") report "128-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"cc0b3675171b3bc8") report "128-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"cff6ea6b6d70ea24") report "128-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_128_128=64x"1ab0b7c23ed066b0") report "128-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"50b83803c0682daa") report "128-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"10d8103e33793d58") report "128-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"af1ef07b8440c606") report "128-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_128_128=64x"d0a9a320efc79720") report "128-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"2d08d00dfddacbb7") report "128-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"a8c91013fe9ba6e5") report "128-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"9a10c9cf7aec761f") report "128-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_128_128=64x"e2e74a1358ea462a") report "128-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"7af71971ff0f3ae7") report "128-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"12b1991e11d9675e") report "128-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"6e82e613a629ea7e") report "128-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_128_128=64x"be04a868714a5a82") report "128-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"eb10084e558c371") report "128-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"d909cb0b1d21144a") report "128-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"8be6daa5da8ca45a") report "128-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_128_128=64x"fff1ea38ebc3f7a9") report "128-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"2c020e68dab3ff08") report "128-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"598a0a4ff075e480") report "128-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"46d217d61daeb58d") report "128-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_128_128=64x"19e4c2f8c9cb9759") report "128-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"cc4beb35ff3b8cab") report "128-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"ac5b98732aa474ea") report "128-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"6530a91c0436a1e5") report "128-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_128_128=64x"53a017ace9430d8f") report "128-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"d4a71f618bba5446") report "128-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"b6f846ce72663118") report "128-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"9a61eb21b10bf9f") report "128-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_128_128=64x"202356523aa5b0b4") report "128-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"4866eca407fe1849") report "128-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"ed5e17a85a2cba7f") report "128-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"b8905b3cb23081fe") report "128-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_128_128=64x"f5a0aeac6ab57d06") report "128-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"8b632f9b8fa88740") report "128-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"c8544abbb058450a") report "128-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"f0640d9540b7bfce") report "128-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_128_128=64x"34e6d470d133b03b") report "128-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"cd32ff3a361ce58b") report "128-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"962b83e64b58df8f") report "128-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"658a67f98229e882") report "128-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_128_128=64x"e6aa0b53879416f5") report "128-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"355ed36fac8f123f") report "128-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"5cc92abe1c683e61") report "128-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"427cfea768712ab4") report "128-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_128_128=64x"6e2fc16b793e6ea7") report "128-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"3c4d07e70ed3eb88") report "128-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"96bb9c9a6aab7a71") report "128-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"c641dcb49eb0d708") report "128-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_128_128=64x"d5a6298fdd3982aa") report "128-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"4f8bfcbbdfa1cb4e") report "128-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"ade3c383a93e970f") report "128-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"c929bc104a96382") report "128-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_128_128=64x"3e9c7e65f12fdbc4") report "128-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"236605a19e455399") report "128-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"5f39e07f634b09eb") report "128-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"9723e396d194dcd4") report "128-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_128_128=64x"f3b73d9ef4dfc0c4") report "128-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"15f5128eef820264") report "128-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"ec53f821da89ead") report "128-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"f0fd94ec13ad5854") report "128-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_128_128=64x"49e2885a9f0bbef0") report "128-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"6cab43b90d8fb832") report "128-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"c303d7ce719fab12") report "128-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"a0093adfea91e87") report "128-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_128_128=64x"8dec34cd63c3dc20") report "128-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"1a345a58b07c965f") report "128-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"7f6e4790dc0157cc") report "128-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"60beb8d589388004") report "128-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_128_128=64x"30ba25ba7c70743c") report "128-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"37111a65c2bc255c") report "128-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"e6b3c8a0415897a4") report "128-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"ae0bae32c8ccd507") report "128-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_128_128=64x"abfe689e8108d524") report "128-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"637f1d00771c5701") report "128-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"dbf7ce2e62fd7de0") report "128-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"c195c00d563722e0") report "128-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_128_128=64x"b1c8b19b10518add") report "128-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"5fa3fccd1d9dec61") report "128-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"445b14cea57f546a") report "128-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"cc4a74195d638f0d") report "128-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_128_128=64x"c0e47473ecda980b") report "128-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"34f7b18900ac08aa") report "128-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"c9e857e1ec436ba0") report "128-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"8eaf49ce3ae01961") report "128-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_128_128=64x"ecfce904d1fc610f") report "128-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"727c15a8e7f80952") report "128-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"d5c199e0e2984c03") report "128-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"999a1d6e0f4ad79c") report "128-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_128_128=64x"ece0531fd84a1c90") report "128-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"e5b17a05f71aeb1a") report "128-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"7651d742c8daa189") report "128-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"3e76cb4a26f7646") report "128-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_128_128=64x"cf3787c4d839caa2") report "128-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"42ac1bf281349d74") report "128-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"6f27cbdd39e3c5a3") report "128-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"fb21da6bf5089f54") report "128-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_128_128=64x"e41abfcee6732d64") report "128-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"f37b9c2a57ca6a82") report "128-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"e61b43be5e6e8120") report "128-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 25 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"4a70ba5e3c6182a4") report "128-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (word_1_out_128_128=64x"937e690194257803") report "128-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"8fbd563ca87b8d0e") report "128-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"1461b76e1628d919") report "128-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 26 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"923cbc0a76823030") report "128-Bit Block, 128-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (word_1_out_128_128=64x"c1b96efb958e2512") report "128-Bit Block, 128-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"d53b0611554ddd88") report "128-Bit Block, 128-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"a8d1b7f41691b5fc") report "128-Bit Block, 128-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 27 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"e020933b934be259") report "128-Bit Block, 128-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (word_1_out_128_128=64x"71c57368275a63dd") report "128-Bit Block, 128-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"783be743e30a8367") report "128-Bit Block, 128-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"d1e3d7c949646f21") report "128-Bit Block, 128-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 28 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"c4ad26318226ad14") report "128-Bit Block, 128-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (word_1_out_128_128=64x"c5a9bfed1879bfdb") report "128-Bit Block, 128-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"5bd2f104b407fcf0") report "128-Bit Block, 128-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"9a0dcb1bac53e7cb") report "128-Bit Block, 128-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 29 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"dec90f79ca0db285") report "128-Bit Block, 128-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (word_1_out_128_128=64x"fba03ef5db38da23") report "128-Bit Block, 128-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"f9fb76ea6f8bb74b") report "128-Bit Block, 128-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"276cfecfcfb450c9") report "128-Bit Block, 128-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 30 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_128=64x"d77a29c800ec83a") report "128-Bit Block, 128-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (word_1_out_128_128=64x"fb3fd952d0635c14") report "128-Bit Block, 128-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_0_out_128_128=64x"cf954ba4306d1db") report "128-Bit Block, 128-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_1_out_128_128=64x"c322e3e93f5b6b84") report "128-Bit Block, 128-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_2_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_3_out_128_128=64x"0") report "128-Bit Block, 128-Bit Key, Encryption Round Test 31 Failed!" severity error;
    
            report "128-Bit Block, 128-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_128_192: process
        begin
            word_0_128_192 <= 64x"6b5f5241f323ca74";
            word_1_128_192 <= 64x"467437419466e472";
            subkey_0_128_192 <= 64x"e07405eb215663ab";
            subkey_1_128_192 <= 64x"ec62b2c82648ee38";
            subkey_2_128_192 <= 64x"d7ab792809e469e6";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"0";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"672b519d8cf00150";
            word_1_128_192 <= 64x"3dd1c39215ee52f3";
            subkey_0_128_192 <= 64x"1ac047c4e3cfb1c6";
            subkey_1_128_192 <= 64x"1960689de97cac99";
            subkey_2_128_192 <= 64x"d7ab792809e469e6";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"79f3e8499b4a54e7";
            word_1_128_192 <= 64x"40a964a5fcca5e64";
            subkey_0_128_192 <= 64x"d795cd1915a4181e";
            subkey_1_128_192 <= 64x"1960689de97cac99";
            subkey_2_128_192 <= 64x"197f33e0bd9962e";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"2";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"c63e1efb8eb1a060";
            word_1_128_192 <= 64x"9a15cb754e3075b";
            subkey_0_128_192 <= 64x"cc0145491ead543e";
            subkey_1_128_192 <= 64x"70af2d81b38d94c8";
            subkey_2_128_192 <= 64x"197f33e0bd9962e";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"3";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"dcb672cd2d26d45f";
            word_1_128_192 <= 64x"ed46851158abd759";
            subkey_0_128_192 <= 64x"9a08f774a9d38c21";
            subkey_1_128_192 <= 64x"70af2d81b38d94c8";
            subkey_2_128_192 <= 64x"fa02dd3c5cb92dd7";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"4";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"4918d84ffe9aaee9";
            word_1_128_192 <= 64x"acab4e2697ac0c17";
            subkey_0_128_192 <= 64x"b23e1d07651b78bd";
            subkey_1_128_192 <= 64x"6279a6a22b8719b1";
            subkey_2_128_192 <= 64x"fa02dd3c5cb92dd7";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"5";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"9a3d5ce6b4fc5502";
            word_1_128_192 <= 64x"d2fb9e9940292248";
            subkey_0_128_192 <= 64x"1bc8f7df89a3f402";
            subkey_1_128_192 <= 64x"6279a6a22b8719b1";
            subkey_2_128_192 <= 64x"8a381fe4a17831ef";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"6";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"2932486f607d2232";
            word_1_128_192 <= 64x"f8d8af5ac79f8a26";
            subkey_0_128_192 <= 64x"136ccf7a66d0db0d";
            subkey_1_128_192 <= 64x"cd2b71862bcf7b1d";
            subkey_2_128_192 <= 64x"8a381fe4a17831ef";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"7";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"ad5ad1fde7d0b20";
            word_1_128_192 <= 64x"4347ee64dd941ab1";
            subkey_0_128_192 <= 64x"99917c497df48b51";
            subkey_1_128_192 <= 64x"cd2b71862bcf7b1d";
            subkey_2_128_192 <= 64x"2f7079a4b725339";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"8";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"7324e1b9cd464d6b";
            word_1_128_192 <= 64x"258989473eae146b";
            subkey_0_128_192 <= 64x"7bd545f0eb840048";
            subkey_1_128_192 <= 64x"b75ea7bb04205ac4";
            subkey_2_128_192 <= 64x"2f7079a4b725339";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"9";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"3cb8237d9532906c";
            word_1_128_192 <= 64x"a59f2eb3ff00fb37";
            subkey_0_128_192 <= 64x"6a72137fd9ef70d1";
            subkey_1_128_192 <= 64x"b75ea7bb04205ac4";
            subkey_2_128_192 <= 64x"b4d83cf885cf7292";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"a";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"fbeeca3f394a62d7";
            word_1_128_192 <= 64x"1e2fd1d390dee1b6";
            subkey_0_128_192 <= 64x"7cb9e9d95b8817aa";
            subkey_1_128_192 <= 64x"2f29722794f39121";
            subkey_2_128_192 <= 64x"b4d83cf885cf7292";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"b";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"11c342319d0040ad";
            word_1_128_192 <= 64x"ceb513c857535612";
            subkey_0_128_192 <= 64x"eaa18cdc884d5a44";
            subkey_1_128_192 <= 64x"2f29722794f39121";
            subkey_2_128_192 <= 64x"f6ec216540de717";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"c";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"402a6a150518cb2f";
            word_1_128_192 <= 64x"ce307b99ed1ace47";
            subkey_0_128_192 <= 64x"5edcd0aaed889ffe";
            subkey_1_128_192 <= 64x"bd0b64eafe24dd9";
            subkey_2_128_192 <= 64x"f6ec216540de717";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"d";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"d8771a925a4b2379";
            word_1_128_192 <= 64x"d9244a3a728d7a03";
            subkey_0_128_192 <= 64x"830aba3a6f98521a";
            subkey_1_128_192 <= 64x"bd0b64eafe24dd9";
            subkey_2_128_192 <= 64x"75ec3f6d03dcade8";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"e";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"9ce25074297cf927";
            word_1_128_192 <= 64x"5f5a84e6fb25e2e9";
            subkey_0_128_192 <= 64x"44435b23c28aa4bd";
            subkey_1_128_192 <= 64x"5c168af0be483469";
            subkey_2_128_192 <= 64x"75ec3f6d03dcade8";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"f";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"2510727b99157288";
            word_1_128_192 <= 64x"c202f1dad2f2bbb4";
            subkey_0_128_192 <= 64x"ea39e7d3bdba48f";
            subkey_1_128_192 <= 64x"5c168af0be483469";
            subkey_2_128_192 <= 64x"2cb947632f8e8165";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"10";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"fff278cc8098558d";
            word_1_128_192 <= 64x"d771eb104833c1cc";
            subkey_0_128_192 <= 64x"2e346e1f244c8ab";
            subkey_1_128_192 <= 64x"77ffb5082c99ecd3";
            subkey_2_128_192 <= 64x"2cb947632f8e8165";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"11";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"31b96a326666ed8a";
            word_1_128_192 <= 64x"ce2aac5662a441e5";
            subkey_0_128_192 <= 64x"7f0a3726c7521265";
            subkey_1_128_192 <= 64x"77ffb5082c99ecd3";
            subkey_2_128_192 <= 64x"681000295574573d";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"12";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"e546f26b48acefff";
            word_1_128_192 <= 64x"688da3f87b9b83ae";
            subkey_0_128_192 <= 64x"aad38fedf5ee3f68";
            subkey_1_128_192 <= 64x"528236dbcf7eac43";
            subkey_2_128_192 <= 64x"681000295574573d";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"13";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"134b9cb8f1a1cb15";
            word_1_128_192 <= 64x"397c0fe2b4c6b4ea";
            subkey_0_128_192 <= 64x"bea7e081b03248e9";
            subkey_1_128_192 <= 64x"528236dbcf7eac43";
            subkey_2_128_192 <= 64x"e83b9fee1f43b3ac";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"14";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"d97e1d8ee96a8188";
            word_1_128_192 <= 64x"4322f8496464d920";
            subkey_0_128_192 <= 64x"f4c566b50d9380cc";
            subkey_1_128_192 <= 64x"1fa62b88c01c781";
            subkey_2_128_192 <= 64x"e83b9fee1f43b3ac";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"15";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"c6f4ca4574096aeb";
            word_1_128_192 <= 64x"d0426323f5d66ad";
            subkey_0_128_192 <= 64x"78697fc972ec20d";
            subkey_1_128_192 <= 64x"1fa62b88c01c781";
            subkey_2_128_192 <= 64x"a1ada254fbb2c46a";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"16";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"44210bbc912d5d02";
            word_1_128_192 <= 64x"7387599731660a5c";
            subkey_0_128_192 <= 64x"b4bc2dbbf6ccd3aa";
            subkey_1_128_192 <= 64x"8888925f4fbac3c2";
            subkey_2_128_192 <= 64x"a1ada254fbb2c46a";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"17";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"3520e34957f8f8b4";
            word_1_128_192 <= 64x"1428beadde9210a6";
            subkey_0_128_192 <= 64x"babcb681fdae1b2c";
            subkey_1_128_192 <= 64x"8888925f4fbac3c2";
            subkey_2_128_192 <= 64x"1f5ddb5e4bc88679";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"18";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"c88ea0c347be5449";
            word_1_128_192 <= 64x"6189ba89f87991e8";
            subkey_0_128_192 <= 64x"a8a08b1bb18d0c92";
            subkey_1_128_192 <= 64x"7d453f145cfdd5f7";
            subkey_2_128_192 <= 64x"1f5ddb5e4bc88679";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"19";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"5c25a77c5dc96306";
            word_1_128_192 <= 64x"1850a166603bc148";
            subkey_0_128_192 <= 64x"64bbb02a83b0b194";
            subkey_1_128_192 <= 64x"7d453f145cfdd5f7";
            subkey_2_128_192 <= 64x"21bfe8f70fd8d501";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1a";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"21ab73d5a9d23761";
            word_1_128_192 <= 64x"c086483747992f53";
            subkey_0_128_192 <= 64x"79e5743d858823d0";
            subkey_1_128_192 <= 64x"5c38f569980daf73";
            subkey_2_128_192 <= 64x"21bfe8f70fd8d501";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1b";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"1d5108d2a004849";
            word_1_128_192 <= 64x"c8e8e206491f340";
            subkey_0_128_192 <= 64x"b42c95ca50d6e23d";
            subkey_1_128_192 <= 64x"5c38f569980daf73";
            subkey_2_128_192 <= 64x"7b0734267c97fcbe";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1c";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"fb658eb84ab07a49";
            word_1_128_192 <= 64x"f5cd0ad11ab23801";
            subkey_0_128_192 <= 64x"86ec60ed3cd9fe1d";
            subkey_1_128_192 <= 64x"2788cebfba6eeff0";
            subkey_2_128_192 <= 64x"7b0734267c97fcbe";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1d";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"a09b4eec729100d3";
            word_1_128_192 <= 64x"7bb73b2e2712d29c";
            subkey_0_128_192 <= 64x"72046f48859966e8";
            subkey_1_128_192 <= 64x"2788cebfba6eeff0";
            subkey_2_128_192 <= 64x"4567682163569604";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1e";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"4bc91e0cb1a973d0";
            word_1_128_192 <= 64x"4f13696f2521754d";
            subkey_0_128_192 <= 64x"f20882536998e28a";
            subkey_1_128_192 <= 64x"622bf8174553d5c9";
            subkey_2_128_192 <= 64x"4567682163569604";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"1f";
            wait until rising_edge(clk);
    
            word_0_128_192 <= 64x"35584340c41de94d";
            word_1_128_192 <= 64x"6b10b325495677cf";
            subkey_0_128_192 <= 64x"6609fb20c63b2d68";
            subkey_1_128_192 <= 64x"622bf8174553d5c9";
            subkey_2_128_192 <= 64x"f64de9bb8afc393f";
            subkey_3_128_192 <= 64x"0";
            index_128_192 <= 64x"20";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_128_192: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"672b519d8cf00150") report "128-Bit Block, 192-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_128_192=64x"3dd1c39215ee52f3") report "128-Bit Block, 192-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"1ac047c4e3cfb1c6") report "128-Bit Block, 192-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"1960689de97cac99") report "128-Bit Block, 192-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"d7ab792809e469e6") report "128-Bit Block, 192-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"79f3e8499b4a54e7") report "128-Bit Block, 192-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_128_192=64x"40a964a5fcca5e64") report "128-Bit Block, 192-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"d795cd1915a4181e") report "128-Bit Block, 192-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"1960689de97cac99") report "128-Bit Block, 192-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"197f33e0bd9962e") report "128-Bit Block, 192-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"c63e1efb8eb1a060") report "128-Bit Block, 192-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_128_192=64x"9a15cb754e3075b") report "128-Bit Block, 192-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"cc0145491ead543e") report "128-Bit Block, 192-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"70af2d81b38d94c8") report "128-Bit Block, 192-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"197f33e0bd9962e") report "128-Bit Block, 192-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"dcb672cd2d26d45f") report "128-Bit Block, 192-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_128_192=64x"ed46851158abd759") report "128-Bit Block, 192-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"9a08f774a9d38c21") report "128-Bit Block, 192-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"70af2d81b38d94c8") report "128-Bit Block, 192-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"fa02dd3c5cb92dd7") report "128-Bit Block, 192-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"4918d84ffe9aaee9") report "128-Bit Block, 192-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_128_192=64x"acab4e2697ac0c17") report "128-Bit Block, 192-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"b23e1d07651b78bd") report "128-Bit Block, 192-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"6279a6a22b8719b1") report "128-Bit Block, 192-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"fa02dd3c5cb92dd7") report "128-Bit Block, 192-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"9a3d5ce6b4fc5502") report "128-Bit Block, 192-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_128_192=64x"d2fb9e9940292248") report "128-Bit Block, 192-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"1bc8f7df89a3f402") report "128-Bit Block, 192-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"6279a6a22b8719b1") report "128-Bit Block, 192-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"8a381fe4a17831ef") report "128-Bit Block, 192-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"2932486f607d2232") report "128-Bit Block, 192-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_128_192=64x"f8d8af5ac79f8a26") report "128-Bit Block, 192-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"136ccf7a66d0db0d") report "128-Bit Block, 192-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"cd2b71862bcf7b1d") report "128-Bit Block, 192-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"8a381fe4a17831ef") report "128-Bit Block, 192-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"ad5ad1fde7d0b20") report "128-Bit Block, 192-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_128_192=64x"4347ee64dd941ab1") report "128-Bit Block, 192-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"99917c497df48b51") report "128-Bit Block, 192-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"cd2b71862bcf7b1d") report "128-Bit Block, 192-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"2f7079a4b725339") report "128-Bit Block, 192-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"7324e1b9cd464d6b") report "128-Bit Block, 192-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_128_192=64x"258989473eae146b") report "128-Bit Block, 192-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"7bd545f0eb840048") report "128-Bit Block, 192-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"b75ea7bb04205ac4") report "128-Bit Block, 192-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"2f7079a4b725339") report "128-Bit Block, 192-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"3cb8237d9532906c") report "128-Bit Block, 192-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_128_192=64x"a59f2eb3ff00fb37") report "128-Bit Block, 192-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"6a72137fd9ef70d1") report "128-Bit Block, 192-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"b75ea7bb04205ac4") report "128-Bit Block, 192-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"b4d83cf885cf7292") report "128-Bit Block, 192-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"fbeeca3f394a62d7") report "128-Bit Block, 192-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_128_192=64x"1e2fd1d390dee1b6") report "128-Bit Block, 192-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"7cb9e9d95b8817aa") report "128-Bit Block, 192-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"2f29722794f39121") report "128-Bit Block, 192-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"b4d83cf885cf7292") report "128-Bit Block, 192-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"11c342319d0040ad") report "128-Bit Block, 192-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_128_192=64x"ceb513c857535612") report "128-Bit Block, 192-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"eaa18cdc884d5a44") report "128-Bit Block, 192-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"2f29722794f39121") report "128-Bit Block, 192-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"f6ec216540de717") report "128-Bit Block, 192-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"402a6a150518cb2f") report "128-Bit Block, 192-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_128_192=64x"ce307b99ed1ace47") report "128-Bit Block, 192-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"5edcd0aaed889ffe") report "128-Bit Block, 192-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"bd0b64eafe24dd9") report "128-Bit Block, 192-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"f6ec216540de717") report "128-Bit Block, 192-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"d8771a925a4b2379") report "128-Bit Block, 192-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_128_192=64x"d9244a3a728d7a03") report "128-Bit Block, 192-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"830aba3a6f98521a") report "128-Bit Block, 192-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"bd0b64eafe24dd9") report "128-Bit Block, 192-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"75ec3f6d03dcade8") report "128-Bit Block, 192-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"9ce25074297cf927") report "128-Bit Block, 192-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_128_192=64x"5f5a84e6fb25e2e9") report "128-Bit Block, 192-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"44435b23c28aa4bd") report "128-Bit Block, 192-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"5c168af0be483469") report "128-Bit Block, 192-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"75ec3f6d03dcade8") report "128-Bit Block, 192-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"2510727b99157288") report "128-Bit Block, 192-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_128_192=64x"c202f1dad2f2bbb4") report "128-Bit Block, 192-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"ea39e7d3bdba48f") report "128-Bit Block, 192-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"5c168af0be483469") report "128-Bit Block, 192-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"2cb947632f8e8165") report "128-Bit Block, 192-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"fff278cc8098558d") report "128-Bit Block, 192-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_128_192=64x"d771eb104833c1cc") report "128-Bit Block, 192-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"2e346e1f244c8ab") report "128-Bit Block, 192-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"77ffb5082c99ecd3") report "128-Bit Block, 192-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"2cb947632f8e8165") report "128-Bit Block, 192-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"31b96a326666ed8a") report "128-Bit Block, 192-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_128_192=64x"ce2aac5662a441e5") report "128-Bit Block, 192-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"7f0a3726c7521265") report "128-Bit Block, 192-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"77ffb5082c99ecd3") report "128-Bit Block, 192-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"681000295574573d") report "128-Bit Block, 192-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"e546f26b48acefff") report "128-Bit Block, 192-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_128_192=64x"688da3f87b9b83ae") report "128-Bit Block, 192-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"aad38fedf5ee3f68") report "128-Bit Block, 192-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"528236dbcf7eac43") report "128-Bit Block, 192-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"681000295574573d") report "128-Bit Block, 192-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"134b9cb8f1a1cb15") report "128-Bit Block, 192-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_128_192=64x"397c0fe2b4c6b4ea") report "128-Bit Block, 192-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"bea7e081b03248e9") report "128-Bit Block, 192-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"528236dbcf7eac43") report "128-Bit Block, 192-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"e83b9fee1f43b3ac") report "128-Bit Block, 192-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"d97e1d8ee96a8188") report "128-Bit Block, 192-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_128_192=64x"4322f8496464d920") report "128-Bit Block, 192-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"f4c566b50d9380cc") report "128-Bit Block, 192-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"1fa62b88c01c781") report "128-Bit Block, 192-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"e83b9fee1f43b3ac") report "128-Bit Block, 192-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"c6f4ca4574096aeb") report "128-Bit Block, 192-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_128_192=64x"d0426323f5d66ad") report "128-Bit Block, 192-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"78697fc972ec20d") report "128-Bit Block, 192-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"1fa62b88c01c781") report "128-Bit Block, 192-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"a1ada254fbb2c46a") report "128-Bit Block, 192-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"44210bbc912d5d02") report "128-Bit Block, 192-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_128_192=64x"7387599731660a5c") report "128-Bit Block, 192-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"b4bc2dbbf6ccd3aa") report "128-Bit Block, 192-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"8888925f4fbac3c2") report "128-Bit Block, 192-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"a1ada254fbb2c46a") report "128-Bit Block, 192-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"3520e34957f8f8b4") report "128-Bit Block, 192-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_128_192=64x"1428beadde9210a6") report "128-Bit Block, 192-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"babcb681fdae1b2c") report "128-Bit Block, 192-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"8888925f4fbac3c2") report "128-Bit Block, 192-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"1f5ddb5e4bc88679") report "128-Bit Block, 192-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"c88ea0c347be5449") report "128-Bit Block, 192-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_128_192=64x"6189ba89f87991e8") report "128-Bit Block, 192-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"a8a08b1bb18d0c92") report "128-Bit Block, 192-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"7d453f145cfdd5f7") report "128-Bit Block, 192-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"1f5ddb5e4bc88679") report "128-Bit Block, 192-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"5c25a77c5dc96306") report "128-Bit Block, 192-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_128_192=64x"1850a166603bc148") report "128-Bit Block, 192-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"64bbb02a83b0b194") report "128-Bit Block, 192-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"7d453f145cfdd5f7") report "128-Bit Block, 192-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"21bfe8f70fd8d501") report "128-Bit Block, 192-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 25 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"21ab73d5a9d23761") report "128-Bit Block, 192-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (word_1_out_128_192=64x"c086483747992f53") report "128-Bit Block, 192-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"79e5743d858823d0") report "128-Bit Block, 192-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"5c38f569980daf73") report "128-Bit Block, 192-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"21bfe8f70fd8d501") report "128-Bit Block, 192-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 26 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"1d5108d2a004849") report "128-Bit Block, 192-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (word_1_out_128_192=64x"c8e8e206491f340") report "128-Bit Block, 192-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"b42c95ca50d6e23d") report "128-Bit Block, 192-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"5c38f569980daf73") report "128-Bit Block, 192-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"7b0734267c97fcbe") report "128-Bit Block, 192-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 27 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"fb658eb84ab07a49") report "128-Bit Block, 192-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (word_1_out_128_192=64x"f5cd0ad11ab23801") report "128-Bit Block, 192-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"86ec60ed3cd9fe1d") report "128-Bit Block, 192-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"2788cebfba6eeff0") report "128-Bit Block, 192-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"7b0734267c97fcbe") report "128-Bit Block, 192-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 28 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"a09b4eec729100d3") report "128-Bit Block, 192-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (word_1_out_128_192=64x"7bb73b2e2712d29c") report "128-Bit Block, 192-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"72046f48859966e8") report "128-Bit Block, 192-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"2788cebfba6eeff0") report "128-Bit Block, 192-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"4567682163569604") report "128-Bit Block, 192-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 29 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"4bc91e0cb1a973d0") report "128-Bit Block, 192-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (word_1_out_128_192=64x"4f13696f2521754d") report "128-Bit Block, 192-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"f20882536998e28a") report "128-Bit Block, 192-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"622bf8174553d5c9") report "128-Bit Block, 192-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"4567682163569604") report "128-Bit Block, 192-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 30 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"35584340c41de94d") report "128-Bit Block, 192-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (word_1_out_128_192=64x"6b10b325495677cf") report "128-Bit Block, 192-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"6609fb20c63b2d68") report "128-Bit Block, 192-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"622bf8174553d5c9") report "128-Bit Block, 192-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"f64de9bb8afc393f") report "128-Bit Block, 192-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 31 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_192=64x"c808b2d50fb358c5") report "128-Bit Block, 192-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (word_1_out_128_192=64x"62caa8d32f5c12ac") report "128-Bit Block, 192-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_0_out_128_192=64x"1f23fe1eec59ea5e") report "128-Bit Block, 192-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_1_out_128_192=64x"2f6c2718dd80811d") report "128-Bit Block, 192-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_2_out_128_192=64x"f64de9bb8afc393f") report "128-Bit Block, 192-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_3_out_128_192=64x"0") report "128-Bit Block, 192-Bit Key, Encryption Round Test 32 Failed!" severity error;
    
            report "128-Bit Block, 192-Bit Key, Encryption Round Test Done." severity note;
        end process;
    
    tb_er_set_128_256: process
        begin
            word_0_128_256 <= 64x"5306f3f515166570";
            word_1_128_256 <= 64x"1d878f9f9cdf5a86";
            subkey_0_128_256 <= 64x"a905d7507e1ea9c5";
            subkey_1_128_256 <= 64x"ff0ac0f1a425799a";
            subkey_2_128_256 <= 64x"eabca8d0b341facd";
            subkey_3_128_256 <= 64x"cb175a5afb82860d";
            index_128_256 <= 64x"0";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"e816337c621ec68d";
            word_1_128_256 <= 64x"7021acd4caaded0f";
            subkey_0_128_256 <= 64x"c2a58929f378113";
            subkey_1_128_256 <= 64x"4404e2116fc2cf3e";
            subkey_2_128_256 <= 64x"eabca8d0b341facd";
            subkey_3_128_256 <= 64x"cb175a5afb82860d";
            index_128_256 <= 64x"1";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"bb1d9658b928c106";
            word_1_128_256 <= 64x"fbac0dbba9def569";
            subkey_0_128_256 <= 64x"bb47d1af9656cb94";
            subkey_1_128_256 <= 64x"4404e2116fc2cf3e";
            subkey_2_128_256 <= 64x"da15153b6feac30c";
            subkey_3_128_256 <= 64x"cb175a5afb82860d";
            index_128_256 <= 64x"2";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"46b2210c2bc25c5a";
            word_1_128_256 <= 64x"9e5e93c9e284546f";
            subkey_0_128_256 <= 64x"132c647543e412bd";
            subkey_1_128_256 <= 64x"4404e2116fc2cf3e";
            subkey_2_128_256 <= 64x"da15153b6feac30c";
            subkey_3_128_256 <= 64x"c912e909f1524e18";
            index_128_256 <= 64x"3";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"90ed138be85210c1";
            word_1_128_256 <= 64x"a57c1beab640f213";
            subkey_0_128_256 <= 64x"c8134afd4a734067";
            subkey_1_128_256 <= 64x"517069575553d58f";
            subkey_2_128_256 <= 64x"da15153b6feac30c";
            subkey_3_128_256 <= 64x"c912e909f1524e18";
            index_128_256 <= 64x"4";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"ebe95905dbeb97d8";
            word_1_128_256 <= 64x"6c81c55a997b11d4";
            subkey_0_128_256 <= 64x"947737f8d6792810";
            subkey_1_128_256 <= 64x"517069575553d58f";
            subkey_2_128_256 <= 64x"d4ed601285e32b2e";
            subkey_3_128_256 <= 64x"c912e909f1524e18";
            index_128_256 <= 64x"5";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"b68251d3fa0843e";
            word_1_128_256 <= 64x"5422ed33e0fc3af9";
            subkey_0_128_256 <= 64x"ef9f52753a33adf";
            subkey_1_128_256 <= 64x"517069575553d58f";
            subkey_2_128_256 <= 64x"d4ed601285e32b2e";
            subkey_3_128_256 <= 64x"ad404ae1e06a7a5b";
            index_128_256 <= 64x"6";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"510495c4dd269b57";
            word_1_128_256 <= 64x"a45bd2d2022baa7";
            subkey_0_128_256 <= 64x"e984ccaa37e1584a";
            subkey_1_128_256 <= 64x"9e4b6590aaf88eb2";
            subkey_2_128_256 <= 64x"d4ed601285e32b2e";
            subkey_3_128_256 <= 64x"ad404ae1e06a7a5b";
            index_128_256 <= 64x"7";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"99aeb90ed4933ce1";
            word_1_128_256 <= 64x"118a17283da7e65b";
            subkey_0_128_256 <= 64x"547fdf5bf56df925";
            subkey_1_128_256 <= 64x"9e4b6590aaf88eb2";
            subkey_2_128_256 <= 64x"1859ba0a4a673b72";
            subkey_3_128_256 <= 64x"ad404ae1e06a7a5b";
            index_128_256 <= 64x"8";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"6dca5408ad24faee";
            word_1_128_256 <= 64x"a0bf9c7e09bd1de2";
            subkey_0_128_256 <= 64x"13d3e5797c21aabd";
            subkey_1_128_256 <= 64x"9e4b6590aaf88eb2";
            subkey_2_128_256 <= 64x"1859ba0a4a673b72";
            subkey_3_128_256 <= 64x"b02d1fa6d74e6397";
            index_128_256 <= 64x"9";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"2dea56993e28c5c5";
            word_1_128_256 <= 64x"43b8f6dc570f12b6";
            subkey_0_128_256 <= 64x"58ed1b14edc1f6aa";
            subkey_1_128_256 <= 64x"c67230df0ccca342";
            subkey_2_128_256 <= 64x"1859ba0a4a673b72";
            subkey_3_128_256 <= 64x"b02d1fa6d74e6397";
            index_128_256 <= 64x"a";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"d391a04d06f80c54";
            word_1_128_256 <= 64x"bcc31484f7be227d";
            subkey_0_128_256 <= 64x"c6dac699603e8bd";
            subkey_1_128_256 <= 64x"c67230df0ccca342";
            subkey_2_128_256 <= 64x"cb0574cef80c5def";
            subkey_3_128_256 <= 64x"b02d1fa6d74e6397";
            index_128_256 <= 64x"b";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"c1aecd602a2c406d";
            word_1_128_256 <= 64x"5d23cf081dec22cb";
            subkey_0_128_256 <= 64x"c770bac58cc472c3";
            subkey_1_128_256 <= 64x"c67230df0ccca342";
            subkey_2_128_256 <= 64x"cb0574cef80c5def";
            subkey_3_128_256 <= 64x"a41dd9893cdb372b";
            index_128_256 <= 64x"c";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"470d20ebefec5d22";
            word_1_128_256 <= 64x"4a7b4beabe8e5e4c";
            subkey_0_128_256 <= 64x"31b2fada0df2a974";
            subkey_1_128_256 <= 64x"a372cf66bd13f6a";
            subkey_2_128_256 <= 64x"cb0574cef80c5def";
            subkey_3_128_256 <= 64x"a41dd9893cdb372b";
            index_128_256 <= 64x"d";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"9a8c61b2a83aabe6";
            word_1_128_256 <= 64x"a2e566edd75842f4";
            subkey_0_128_256 <= 64x"ace9d69eb37ffe7d";
            subkey_1_128_256 <= 64x"a372cf66bd13f6a";
            subkey_2_128_256 <= 64x"217e004edceab5dc";
            subkey_3_128_256 <= 64x"a41dd9893cdb372b";
            index_128_256 <= 64x"e";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"f7a59c1264b8a561";
            word_1_128_256 <= 64x"23c69187256dfa55";
            subkey_0_128_256 <= 64x"bfc3408da7432a57";
            subkey_1_128_256 <= 64x"a372cf66bd13f6a";
            subkey_2_128_256 <= 64x"217e004edceab5dc";
            subkey_3_128_256 <= 64x"d88df4783cbcd9ba";
            index_128_256 <= 64x"f";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"4e26c2bd69581203";
            word_1_128_256 <= 64x"f30a222e4c9d390c";
            subkey_0_128_256 <= 64x"d7d773d7a7b7a924";
            subkey_1_128_256 <= 64x"29cd77ba9daefb99";
            subkey_2_128_256 <= 64x"217e004edceab5dc";
            subkey_3_128_256 <= 64x"d88df4783cbcd9ba";
            index_128_256 <= 64x"10";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"fdf8aae37ad39602";
            word_1_128_256 <= 64x"8ccebf0830130618";
            subkey_0_128_256 <= 64x"d436f6acb29daef";
            subkey_1_128_256 <= 64x"29cd77ba9daefb99";
            subkey_2_128_256 <= 64x"b3f8f1d7f69493c9";
            subkey_3_128_256 <= 64x"d88df4783cbcd9ba";
            index_128_256 <= 64x"11";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"f40341d39eb6c3f0";
            word_1_128_256 <= 64x"1bc616c8482a73e7";
            subkey_0_128_256 <= 64x"a20086091a2840a1";
            subkey_1_128_256 <= 64x"29cd77ba9daefb99";
            subkey_2_128_256 <= 64x"b3f8f1d7f69493c9";
            subkey_3_128_256 <= 64x"c81bfd5f436697d9";
            index_128_256 <= 64x"12";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"d9058f7f8960b145";
            word_1_128_256 <= 64x"791f81e37cd6aec2";
            subkey_0_128_256 <= 64x"2b2e63c80587ea83";
            subkey_1_128_256 <= 64x"3b2a5380d4c5ef8e";
            subkey_2_128_256 <= 64x"b3f8f1d7f69493c9";
            subkey_3_128_256 <= 64x"c81bfd5f436697d9";
            index_128_256 <= 64x"13";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"787cb735225fe75e";
            word_1_128_256 <= 64x"b050ccc9695a6d70";
            subkey_0_128_256 <= 64x"ad9142f9f1412b1c";
            subkey_1_128_256 <= 64x"3b2a5380d4c5ef8e";
            subkey_2_128_256 <= 64x"f4e25cb9dd7e7f05";
            subkey_3_128_256 <= 64x"c81bfd5f436697d9";
            index_128_256 <= 64x"14";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"8759f35108775024";
            word_1_128_256 <= 64x"44bc4af81a886ad7";
            subkey_0_128_256 <= 64x"ebd34938da8dc942";
            subkey_1_128_256 <= 64x"3b2a5380d4c5ef8e";
            subkey_2_128_256 <= 64x"f4e25cb9dd7e7f05";
            subkey_3_128_256 <= 64x"87595ef7508491a7";
            index_128_256 <= 64x"15";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"8f827c2c99a690e8";
            word_1_128_256 <= 64x"b54de6a4da1c11cc";
            subkey_0_128_256 <= 64x"24943a4a8f0cc533";
            subkey_1_128_256 <= 64x"7a0e738c5b628f24";
            subkey_2_128_256 <= 64x"f4e25cb9dd7e7f05";
            subkey_3_128_256 <= 64x"87595ef7508491a7";
            index_128_256 <= 64x"16";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"4b0113d7cb8ee8e";
            word_1_128_256 <= 64x"78a3f059b18c69ca";
            subkey_0_128_256 <= 64x"e28cef3308c6a3d";
            subkey_1_128_256 <= 64x"7a0e738c5b628f24";
            subkey_2_128_256 <= 64x"2a891ca748ea43a4";
            subkey_3_128_256 <= 64x"87595ef7508491a7";
            index_128_256 <= 64x"17";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"e480f235032164ba";
            word_1_128_256 <= 64x"c1007bdee6e610ca";
            subkey_0_128_256 <= 64x"c4f65fcba3bfbf31";
            subkey_1_128_256 <= 64x"7a0e738c5b628f24";
            subkey_2_128_256 <= 64x"2a891ca748ea43a4";
            subkey_3_128_256 <= 64x"b5b0285227dceed9";
            index_128_256 <= 64x"18";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"4fb03cd358bcd02c";
            word_1_128_256 <= 64x"6bb7ad7b41b7f5fb";
            subkey_0_128_256 <= 64x"cec290622de6d856";
            subkey_1_128_256 <= 64x"e9706e3f301b21d8";
            subkey_2_128_256 <= 64x"2a891ca748ea43a4";
            subkey_3_128_256 <= 64x"b5b0285227dceed9";
            index_128_256 <= 64x"19";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"f85882783bfed115";
            word_1_128_256 <= 64x"85d964e2fe185077";
            subkey_0_128_256 <= 64x"4f99a6fba190036";
            subkey_1_128_256 <= 64x"e9706e3f301b21d8";
            subkey_2_128_256 <= 64x"72ed197ed52fc280";
            subkey_3_128_256 <= 64x"b5b0285227dceed9";
            index_128_256 <= 64x"1a";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"a9e3d2737b1361fc";
            word_1_128_256 <= 64x"6b27c1b2a4e5e953";
            subkey_0_128_256 <= 64x"f96399e5dc88dc8e";
            subkey_1_128_256 <= 64x"e9706e3f301b21d8";
            subkey_2_128_256 <= 64x"72ed197ed52fc280";
            subkey_3_128_256 <= 64x"deaf4a980c40dd3e";
            index_128_256 <= 64x"1b";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"4b33f04b29ab948e";
            word_1_128_256 <= 64x"42d63d0f1309b6b";
            subkey_0_128_256 <= 64x"1951c57afffe13c3";
            subkey_1_128_256 <= 64x"d24d0a541bb8f7b4";
            subkey_2_128_256 <= 64x"72ed197ed52fc280";
            subkey_3_128_256 <= 64x"deaf4a980c40dd3e";
            index_128_256 <= 64x"1c";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"f6f65a8d483e7298";
            word_1_128_256 <= 64x"af69d8d40562d6ea";
            subkey_0_128_256 <= 64x"534a99438123dd81";
            subkey_1_128_256 <= 64x"d24d0a541bb8f7b4";
            subkey_2_128_256 <= 64x"99c4b2947ed34399";
            subkey_3_128_256 <= 64x"deaf4a980c40dd3e";
            index_128_256 <= 64x"1d";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"55d894fdc939c28";
            word_1_128_256 <= 64x"b2ef5d259d6008ef";
            subkey_0_128_256 <= 64x"87d8292102ef249";
            subkey_1_128_256 <= 64x"d24d0a541bb8f7b4";
            subkey_2_128_256 <= 64x"99c4b2947ed34399";
            subkey_3_128_256 <= 64x"9229488e19301e43";
            index_128_256 <= 64x"1e";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"d781b041f682ef39";
            word_1_128_256 <= 64x"fd6dfa3f121e0e79";
            subkey_0_128_256 <= 64x"fea3db0ce53d3916";
            subkey_1_128_256 <= 64x"bd4fcf9c644aab5e";
            subkey_2_128_256 <= 64x"99c4b2947ed34399";
            subkey_3_128_256 <= 64x"9229488e19301e43";
            index_128_256 <= 64x"1f";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"13d1473f64bf4d9f";
            word_1_128_256 <= 64x"afdcc530d0a83451";
            subkey_0_128_256 <= 64x"6d2347d85055c4f1";
            subkey_1_128_256 <= 64x"bd4fcf9c644aab5e";
            subkey_2_128_256 <= 64x"983d9fbf79bc0c46";
            subkey_3_128_256 <= 64x"9229488e19301e43";
            index_128_256 <= 64x"20";
            wait until rising_edge(clk);
    
            word_0_128_256 <= 64x"96285a27e0205dda";
            word_1_128_256 <= 64x"8a263dcc5da3122";
            subkey_0_128_256 <= 64x"d9af4fe25cc0d2a4";
            subkey_1_128_256 <= 64x"bd4fcf9c644aab5e";
            subkey_2_128_256 <= 64x"983d9fbf79bc0c46";
            subkey_3_128_256 <= 64x"b0b57120de6ef52f";
            index_128_256 <= 64x"21";
            wait until rising_edge(clk);
    
        end process;
    
    tb_er_check_128_256: process
        begin
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"e816337c621ec68d") report "128-Bit Block, 256-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (word_1_out_128_256=64x"7021acd4caaded0f") report "128-Bit Block, 256-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"c2a58929f378113") report "128-Bit Block, 256-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"4404e2116fc2cf3e") report "128-Bit Block, 256-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"eabca8d0b341facd") report "128-Bit Block, 256-Bit Key, Encryption Test 0 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"cb175a5afb82860d") report "128-Bit Block, 256-Bit Key, Encryption Round Test 0 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"bb1d9658b928c106") report "128-Bit Block, 256-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (word_1_out_128_256=64x"fbac0dbba9def569") report "128-Bit Block, 256-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"bb47d1af9656cb94") report "128-Bit Block, 256-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"4404e2116fc2cf3e") report "128-Bit Block, 256-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"da15153b6feac30c") report "128-Bit Block, 256-Bit Key, Encryption Test 1 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"cb175a5afb82860d") report "128-Bit Block, 256-Bit Key, Encryption Round Test 1 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"46b2210c2bc25c5a") report "128-Bit Block, 256-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (word_1_out_128_256=64x"9e5e93c9e284546f") report "128-Bit Block, 256-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"132c647543e412bd") report "128-Bit Block, 256-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"4404e2116fc2cf3e") report "128-Bit Block, 256-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"da15153b6feac30c") report "128-Bit Block, 256-Bit Key, Encryption Test 2 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"c912e909f1524e18") report "128-Bit Block, 256-Bit Key, Encryption Round Test 2 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"90ed138be85210c1") report "128-Bit Block, 256-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (word_1_out_128_256=64x"a57c1beab640f213") report "128-Bit Block, 256-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"c8134afd4a734067") report "128-Bit Block, 256-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"517069575553d58f") report "128-Bit Block, 256-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"da15153b6feac30c") report "128-Bit Block, 256-Bit Key, Encryption Test 3 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"c912e909f1524e18") report "128-Bit Block, 256-Bit Key, Encryption Round Test 3 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"ebe95905dbeb97d8") report "128-Bit Block, 256-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (word_1_out_128_256=64x"6c81c55a997b11d4") report "128-Bit Block, 256-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"947737f8d6792810") report "128-Bit Block, 256-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"517069575553d58f") report "128-Bit Block, 256-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"d4ed601285e32b2e") report "128-Bit Block, 256-Bit Key, Encryption Test 4 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"c912e909f1524e18") report "128-Bit Block, 256-Bit Key, Encryption Round Test 4 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"b68251d3fa0843e") report "128-Bit Block, 256-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (word_1_out_128_256=64x"5422ed33e0fc3af9") report "128-Bit Block, 256-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"ef9f52753a33adf") report "128-Bit Block, 256-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"517069575553d58f") report "128-Bit Block, 256-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"d4ed601285e32b2e") report "128-Bit Block, 256-Bit Key, Encryption Test 5 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"ad404ae1e06a7a5b") report "128-Bit Block, 256-Bit Key, Encryption Round Test 5 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"510495c4dd269b57") report "128-Bit Block, 256-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (word_1_out_128_256=64x"a45bd2d2022baa7") report "128-Bit Block, 256-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"e984ccaa37e1584a") report "128-Bit Block, 256-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"9e4b6590aaf88eb2") report "128-Bit Block, 256-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"d4ed601285e32b2e") report "128-Bit Block, 256-Bit Key, Encryption Test 6 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"ad404ae1e06a7a5b") report "128-Bit Block, 256-Bit Key, Encryption Round Test 6 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"99aeb90ed4933ce1") report "128-Bit Block, 256-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (word_1_out_128_256=64x"118a17283da7e65b") report "128-Bit Block, 256-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"547fdf5bf56df925") report "128-Bit Block, 256-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"9e4b6590aaf88eb2") report "128-Bit Block, 256-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"1859ba0a4a673b72") report "128-Bit Block, 256-Bit Key, Encryption Test 7 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"ad404ae1e06a7a5b") report "128-Bit Block, 256-Bit Key, Encryption Round Test 7 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"6dca5408ad24faee") report "128-Bit Block, 256-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (word_1_out_128_256=64x"a0bf9c7e09bd1de2") report "128-Bit Block, 256-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"13d3e5797c21aabd") report "128-Bit Block, 256-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"9e4b6590aaf88eb2") report "128-Bit Block, 256-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"1859ba0a4a673b72") report "128-Bit Block, 256-Bit Key, Encryption Test 8 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b02d1fa6d74e6397") report "128-Bit Block, 256-Bit Key, Encryption Round Test 8 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"2dea56993e28c5c5") report "128-Bit Block, 256-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (word_1_out_128_256=64x"43b8f6dc570f12b6") report "128-Bit Block, 256-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"58ed1b14edc1f6aa") report "128-Bit Block, 256-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"c67230df0ccca342") report "128-Bit Block, 256-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"1859ba0a4a673b72") report "128-Bit Block, 256-Bit Key, Encryption Test 9 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b02d1fa6d74e6397") report "128-Bit Block, 256-Bit Key, Encryption Round Test 9 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"d391a04d06f80c54") report "128-Bit Block, 256-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (word_1_out_128_256=64x"bcc31484f7be227d") report "128-Bit Block, 256-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"c6dac699603e8bd") report "128-Bit Block, 256-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"c67230df0ccca342") report "128-Bit Block, 256-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"cb0574cef80c5def") report "128-Bit Block, 256-Bit Key, Encryption Test 10 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b02d1fa6d74e6397") report "128-Bit Block, 256-Bit Key, Encryption Round Test 10 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"c1aecd602a2c406d") report "128-Bit Block, 256-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (word_1_out_128_256=64x"5d23cf081dec22cb") report "128-Bit Block, 256-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"c770bac58cc472c3") report "128-Bit Block, 256-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"c67230df0ccca342") report "128-Bit Block, 256-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"cb0574cef80c5def") report "128-Bit Block, 256-Bit Key, Encryption Test 11 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"a41dd9893cdb372b") report "128-Bit Block, 256-Bit Key, Encryption Round Test 11 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"470d20ebefec5d22") report "128-Bit Block, 256-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (word_1_out_128_256=64x"4a7b4beabe8e5e4c") report "128-Bit Block, 256-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"31b2fada0df2a974") report "128-Bit Block, 256-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"a372cf66bd13f6a") report "128-Bit Block, 256-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"cb0574cef80c5def") report "128-Bit Block, 256-Bit Key, Encryption Test 12 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"a41dd9893cdb372b") report "128-Bit Block, 256-Bit Key, Encryption Round Test 12 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"9a8c61b2a83aabe6") report "128-Bit Block, 256-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (word_1_out_128_256=64x"a2e566edd75842f4") report "128-Bit Block, 256-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"ace9d69eb37ffe7d") report "128-Bit Block, 256-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"a372cf66bd13f6a") report "128-Bit Block, 256-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"217e004edceab5dc") report "128-Bit Block, 256-Bit Key, Encryption Test 13 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"a41dd9893cdb372b") report "128-Bit Block, 256-Bit Key, Encryption Round Test 13 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"f7a59c1264b8a561") report "128-Bit Block, 256-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (word_1_out_128_256=64x"23c69187256dfa55") report "128-Bit Block, 256-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"bfc3408da7432a57") report "128-Bit Block, 256-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"a372cf66bd13f6a") report "128-Bit Block, 256-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"217e004edceab5dc") report "128-Bit Block, 256-Bit Key, Encryption Test 14 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"d88df4783cbcd9ba") report "128-Bit Block, 256-Bit Key, Encryption Round Test 14 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"4e26c2bd69581203") report "128-Bit Block, 256-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (word_1_out_128_256=64x"f30a222e4c9d390c") report "128-Bit Block, 256-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"d7d773d7a7b7a924") report "128-Bit Block, 256-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"29cd77ba9daefb99") report "128-Bit Block, 256-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"217e004edceab5dc") report "128-Bit Block, 256-Bit Key, Encryption Test 15 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"d88df4783cbcd9ba") report "128-Bit Block, 256-Bit Key, Encryption Round Test 15 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"fdf8aae37ad39602") report "128-Bit Block, 256-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (word_1_out_128_256=64x"8ccebf0830130618") report "128-Bit Block, 256-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"d436f6acb29daef") report "128-Bit Block, 256-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"29cd77ba9daefb99") report "128-Bit Block, 256-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"b3f8f1d7f69493c9") report "128-Bit Block, 256-Bit Key, Encryption Test 16 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"d88df4783cbcd9ba") report "128-Bit Block, 256-Bit Key, Encryption Round Test 16 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"f40341d39eb6c3f0") report "128-Bit Block, 256-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (word_1_out_128_256=64x"1bc616c8482a73e7") report "128-Bit Block, 256-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"a20086091a2840a1") report "128-Bit Block, 256-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"29cd77ba9daefb99") report "128-Bit Block, 256-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"b3f8f1d7f69493c9") report "128-Bit Block, 256-Bit Key, Encryption Test 17 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"c81bfd5f436697d9") report "128-Bit Block, 256-Bit Key, Encryption Round Test 17 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"d9058f7f8960b145") report "128-Bit Block, 256-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (word_1_out_128_256=64x"791f81e37cd6aec2") report "128-Bit Block, 256-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"2b2e63c80587ea83") report "128-Bit Block, 256-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"3b2a5380d4c5ef8e") report "128-Bit Block, 256-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"b3f8f1d7f69493c9") report "128-Bit Block, 256-Bit Key, Encryption Test 18 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"c81bfd5f436697d9") report "128-Bit Block, 256-Bit Key, Encryption Round Test 18 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"787cb735225fe75e") report "128-Bit Block, 256-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (word_1_out_128_256=64x"b050ccc9695a6d70") report "128-Bit Block, 256-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"ad9142f9f1412b1c") report "128-Bit Block, 256-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"3b2a5380d4c5ef8e") report "128-Bit Block, 256-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"f4e25cb9dd7e7f05") report "128-Bit Block, 256-Bit Key, Encryption Test 19 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"c81bfd5f436697d9") report "128-Bit Block, 256-Bit Key, Encryption Round Test 19 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"8759f35108775024") report "128-Bit Block, 256-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (word_1_out_128_256=64x"44bc4af81a886ad7") report "128-Bit Block, 256-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"ebd34938da8dc942") report "128-Bit Block, 256-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"3b2a5380d4c5ef8e") report "128-Bit Block, 256-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"f4e25cb9dd7e7f05") report "128-Bit Block, 256-Bit Key, Encryption Test 20 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"87595ef7508491a7") report "128-Bit Block, 256-Bit Key, Encryption Round Test 20 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"8f827c2c99a690e8") report "128-Bit Block, 256-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (word_1_out_128_256=64x"b54de6a4da1c11cc") report "128-Bit Block, 256-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"24943a4a8f0cc533") report "128-Bit Block, 256-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"7a0e738c5b628f24") report "128-Bit Block, 256-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"f4e25cb9dd7e7f05") report "128-Bit Block, 256-Bit Key, Encryption Test 21 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"87595ef7508491a7") report "128-Bit Block, 256-Bit Key, Encryption Round Test 21 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"4b0113d7cb8ee8e") report "128-Bit Block, 256-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (word_1_out_128_256=64x"78a3f059b18c69ca") report "128-Bit Block, 256-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"e28cef3308c6a3d") report "128-Bit Block, 256-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"7a0e738c5b628f24") report "128-Bit Block, 256-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"2a891ca748ea43a4") report "128-Bit Block, 256-Bit Key, Encryption Test 22 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"87595ef7508491a7") report "128-Bit Block, 256-Bit Key, Encryption Round Test 22 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"e480f235032164ba") report "128-Bit Block, 256-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (word_1_out_128_256=64x"c1007bdee6e610ca") report "128-Bit Block, 256-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"c4f65fcba3bfbf31") report "128-Bit Block, 256-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"7a0e738c5b628f24") report "128-Bit Block, 256-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"2a891ca748ea43a4") report "128-Bit Block, 256-Bit Key, Encryption Test 23 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b5b0285227dceed9") report "128-Bit Block, 256-Bit Key, Encryption Round Test 23 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"4fb03cd358bcd02c") report "128-Bit Block, 256-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (word_1_out_128_256=64x"6bb7ad7b41b7f5fb") report "128-Bit Block, 256-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"cec290622de6d856") report "128-Bit Block, 256-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"e9706e3f301b21d8") report "128-Bit Block, 256-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"2a891ca748ea43a4") report "128-Bit Block, 256-Bit Key, Encryption Test 24 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b5b0285227dceed9") report "128-Bit Block, 256-Bit Key, Encryption Round Test 24 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"f85882783bfed115") report "128-Bit Block, 256-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (word_1_out_128_256=64x"85d964e2fe185077") report "128-Bit Block, 256-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"4f99a6fba190036") report "128-Bit Block, 256-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"e9706e3f301b21d8") report "128-Bit Block, 256-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"72ed197ed52fc280") report "128-Bit Block, 256-Bit Key, Encryption Test 25 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b5b0285227dceed9") report "128-Bit Block, 256-Bit Key, Encryption Round Test 25 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"a9e3d2737b1361fc") report "128-Bit Block, 256-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (word_1_out_128_256=64x"6b27c1b2a4e5e953") report "128-Bit Block, 256-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"f96399e5dc88dc8e") report "128-Bit Block, 256-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"e9706e3f301b21d8") report "128-Bit Block, 256-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"72ed197ed52fc280") report "128-Bit Block, 256-Bit Key, Encryption Test 26 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"deaf4a980c40dd3e") report "128-Bit Block, 256-Bit Key, Encryption Round Test 26 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"4b33f04b29ab948e") report "128-Bit Block, 256-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (word_1_out_128_256=64x"42d63d0f1309b6b") report "128-Bit Block, 256-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"1951c57afffe13c3") report "128-Bit Block, 256-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"d24d0a541bb8f7b4") report "128-Bit Block, 256-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"72ed197ed52fc280") report "128-Bit Block, 256-Bit Key, Encryption Test 27 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"deaf4a980c40dd3e") report "128-Bit Block, 256-Bit Key, Encryption Round Test 27 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"f6f65a8d483e7298") report "128-Bit Block, 256-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (word_1_out_128_256=64x"af69d8d40562d6ea") report "128-Bit Block, 256-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"534a99438123dd81") report "128-Bit Block, 256-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"d24d0a541bb8f7b4") report "128-Bit Block, 256-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"99c4b2947ed34399") report "128-Bit Block, 256-Bit Key, Encryption Test 28 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"deaf4a980c40dd3e") report "128-Bit Block, 256-Bit Key, Encryption Round Test 28 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"55d894fdc939c28") report "128-Bit Block, 256-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (word_1_out_128_256=64x"b2ef5d259d6008ef") report "128-Bit Block, 256-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"87d8292102ef249") report "128-Bit Block, 256-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"d24d0a541bb8f7b4") report "128-Bit Block, 256-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"99c4b2947ed34399") report "128-Bit Block, 256-Bit Key, Encryption Test 29 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"9229488e19301e43") report "128-Bit Block, 256-Bit Key, Encryption Round Test 29 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"d781b041f682ef39") report "128-Bit Block, 256-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (word_1_out_128_256=64x"fd6dfa3f121e0e79") report "128-Bit Block, 256-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"fea3db0ce53d3916") report "128-Bit Block, 256-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"bd4fcf9c644aab5e") report "128-Bit Block, 256-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"99c4b2947ed34399") report "128-Bit Block, 256-Bit Key, Encryption Test 30 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"9229488e19301e43") report "128-Bit Block, 256-Bit Key, Encryption Round Test 30 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"13d1473f64bf4d9f") report "128-Bit Block, 256-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (word_1_out_128_256=64x"afdcc530d0a83451") report "128-Bit Block, 256-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"6d2347d85055c4f1") report "128-Bit Block, 256-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"bd4fcf9c644aab5e") report "128-Bit Block, 256-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"983d9fbf79bc0c46") report "128-Bit Block, 256-Bit Key, Encryption Test 31 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"9229488e19301e43") report "128-Bit Block, 256-Bit Key, Encryption Round Test 31 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"96285a27e0205dda") report "128-Bit Block, 256-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (word_1_out_128_256=64x"8a263dcc5da3122") report "128-Bit Block, 256-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"d9af4fe25cc0d2a4") report "128-Bit Block, 256-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"bd4fcf9c644aab5e") report "128-Bit Block, 256-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"983d9fbf79bc0c46") report "128-Bit Block, 256-Bit Key, Encryption Test 32 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b0b57120de6ef52f") report "128-Bit Block, 256-Bit Key, Encryption Round Test 32 Failed!" severity error;
            wait until falling_edge(clk);
    
            assert (word_0_out_128_256=64x"d0dd6256e124047b") report "128-Bit Block, 256-Bit Key, Encryption Test 33 Failed!" severity error;
            assert (word_1_out_128_256=64x"619fb369e026eaaf") report "128-Bit Block, 256-Bit Key, Encryption Test 33 Failed!" severity error;
            assert (subkey_0_out_128_256=64x"f516e0a31f238848") report "128-Bit Block, 256-Bit Key, Encryption Test 33 Failed!" severity error;
            assert (subkey_1_out_128_256=64x"386c9fb1f9251d6e") report "128-Bit Block, 256-Bit Key, Encryption Test 33 Failed!" severity error;
            assert (subkey_2_out_128_256=64x"983d9fbf79bc0c46") report "128-Bit Block, 256-Bit Key, Encryption Test 33 Failed!" severity error;
            assert (subkey_3_out_128_256=64x"b0b57120de6ef52f") report "128-Bit Block, 256-Bit Key, Encryption Round Test 33 Failed!" severity error;
    
            report "128-Bit Block, 256-Bit Key, Encryption Round Test Done." severity note;
        end process;
      
end Behavioral;
