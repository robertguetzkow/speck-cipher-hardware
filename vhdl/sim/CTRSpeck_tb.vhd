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
-- Create Date: 01.02.2019 18:49:26
-- Module Name: CTRSpeck_tb - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Testbench for CTR mode using the Speck cipher.
-- 
-- Dependencies: CTRSpeck.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity CTRSpeck_tb is
end CTRSpeck_tb;

architecture Behavioral of CTRSpeck_tb is
    signal data_in_32_64: UNSIGNED(32 - 1 downto 0);
    signal key_32_64: UNSIGNED(64 - 1 downto 0);
    signal nonce_32_64: UNSIGNED(16 - 1 downto 0);
    signal reset_32_64: std_logic := '0';
    signal data_out_32_64: UNSIGNED(32 - 1 downto 0);
    signal ready_32_64: std_logic;
    signal ctr_wrap_32_64: std_logic;
    
    signal data_in_48_72: UNSIGNED(48 - 1 downto 0);
    signal key_48_72: UNSIGNED(72 - 1 downto 0);
    signal nonce_48_72: UNSIGNED(24 - 1 downto 0);
    signal reset_48_72: std_logic := '0';
    signal data_out_48_72: UNSIGNED(48 - 1 downto 0);
    signal ready_48_72: std_logic;
    signal ctr_wrap_48_72: std_logic;
    
    signal data_in_48_96: UNSIGNED(48 - 1 downto 0);
    signal key_48_96: UNSIGNED(96 - 1 downto 0);
    signal nonce_48_96: UNSIGNED(24 - 1 downto 0);
    signal reset_48_96: std_logic := '0';
    signal data_out_48_96: UNSIGNED(48 - 1 downto 0);
    signal ready_48_96: std_logic;
    signal ctr_wrap_48_96: std_logic;
    
    signal data_in_64_96: UNSIGNED(64 - 1 downto 0);
    signal key_64_96: UNSIGNED(96 - 1 downto 0);
    signal nonce_64_96: UNSIGNED(32 - 1 downto 0);
    signal reset_64_96: std_logic := '0';
    signal data_out_64_96: UNSIGNED(64 - 1 downto 0);
    signal ready_64_96: std_logic;
    signal ctr_wrap_64_96: std_logic;
    
    signal data_in_64_128: UNSIGNED(64 - 1 downto 0);
    signal key_64_128: UNSIGNED(128 - 1 downto 0);
    signal nonce_64_128: UNSIGNED(32 - 1 downto 0);
    signal reset_64_128: std_logic := '0';
    signal data_out_64_128: UNSIGNED(64 - 1 downto 0);
    signal ready_64_128: std_logic;
    signal ctr_wrap_64_128: std_logic;
    
    signal data_in_96_96: UNSIGNED(96 - 1 downto 0);
    signal key_96_96: UNSIGNED(96 - 1 downto 0);
    signal nonce_96_96: UNSIGNED(48 - 1 downto 0);
    signal reset_96_96: std_logic := '0';
    signal data_out_96_96: UNSIGNED(96 - 1 downto 0);
    signal ready_96_96: std_logic;
    signal ctr_wrap_96_96: std_logic;  
    
    signal data_in_96_144: UNSIGNED(96 - 1 downto 0);
    signal key_96_144: UNSIGNED(144 - 1 downto 0);
    signal nonce_96_144: UNSIGNED(48 - 1 downto 0);
    signal reset_96_144: std_logic := '0';
    signal data_out_96_144: UNSIGNED(96 - 1 downto 0);
    signal ready_96_144: std_logic;
    signal ctr_wrap_96_144: std_logic;
    
    signal data_in_128_128: UNSIGNED(128 - 1 downto 0);
    signal key_128_128: UNSIGNED(128 - 1 downto 0);
    signal nonce_128_128: UNSIGNED(64 - 1 downto 0);
    signal reset_128_128: std_logic := '0';
    signal data_out_128_128: UNSIGNED(128 - 1 downto 0);
    signal ready_128_128: std_logic;
    signal ctr_wrap_128_128: std_logic;
    
    signal data_in_128_192: UNSIGNED(128 - 1 downto 0);
    signal key_128_192: UNSIGNED(192 - 1 downto 0);
    signal nonce_128_192: UNSIGNED(64 - 1 downto 0);
    signal reset_128_192: std_logic := '0';
    signal data_out_128_192: UNSIGNED(128 - 1 downto 0);
    signal ready_128_192: std_logic;
    signal ctr_wrap_128_192: std_logic;
        
    signal data_in_128_256: UNSIGNED(128 - 1 downto 0);
    signal key_128_256: UNSIGNED(256 - 1 downto 0);
    signal nonce_128_256: UNSIGNED(64 - 1 downto 0);
    signal reset_128_256: std_logic := '0';
    signal data_out_128_256: UNSIGNED(128 - 1 downto 0);
    signal ready_128_256: std_logic;
    signal ctr_wrap_128_256: std_logic;   
    

    signal clk : std_logic := '0';
    constant CLK_HALF_PERIOD: TIME := 5 ns;
begin

clock: process
	begin
        wait for CLK_HALF_PERIOD;
        clk <= not clk; 
	end process;

CTRSpeck_32_64: entity work.CTRSpeck
    generic map (32, 64)
    port map (
        data_in => data_in_32_64,
        key => key_32_64,
        nonce => nonce_32_64,
        clk => clk,
        reset => reset_32_64,
        data_out => data_out_32_64, 
        ready => ready_32_64,
        ctr_wrap => ctr_wrap_32_64
    );
    
CTRSpeck_48_72: entity work.CTRSpeck
    generic map (48, 72)
    port map (
        data_in => data_in_48_72,
        key => key_48_72,
        nonce => nonce_48_72,
        clk => clk,
        reset => reset_48_72,
        data_out => data_out_48_72, 
        ready => ready_48_72,
        ctr_wrap => ctr_wrap_48_72
    );

CTRSpeck_48_96: entity work.CTRSpeck
    generic map (48, 96)
    port map (
        data_in => data_in_48_96,
        key => key_48_96,
        nonce => nonce_48_96,
        clk => clk,
        reset => reset_48_96,
        data_out => data_out_48_96, 
        ready => ready_48_96,
        ctr_wrap => ctr_wrap_48_96
    );
    
CTRSpeck_64_96: entity work.CTRSpeck
    generic map (64, 96)
    port map (
        data_in => data_in_64_96,
        key => key_64_96,
        nonce => nonce_64_96,
        clk => clk,
        reset => reset_64_96,
        data_out => data_out_64_96, 
        ready => ready_64_96,
        ctr_wrap => ctr_wrap_64_96
    );
        
CTRSpeck_64_128: entity work.CTRSpeck
    generic map (64, 128)
    port map (
        data_in => data_in_64_128,
        key => key_64_128,
        nonce => nonce_64_128,
        clk => clk,
        reset => reset_64_128,
        data_out => data_out_64_128, 
        ready => ready_64_128,
        ctr_wrap => ctr_wrap_64_128
    );

CTRSpeck_96_96: entity work.CTRSpeck
    generic map (96, 96)
    port map (
        data_in => data_in_96_96,
        key => key_96_96,
        nonce => nonce_96_96,
        clk => clk,
        reset => reset_96_96,
        data_out => data_out_96_96, 
        ready => ready_96_96,
        ctr_wrap => ctr_wrap_96_96
    );
    
CTRSpeck_96_144: entity work.CTRSpeck
    generic map (96, 144)
    port map (
        data_in => data_in_96_144,
        key => key_96_144,
        nonce => nonce_96_144,
        clk => clk,
        reset => reset_96_144,
        data_out => data_out_96_144, 
        ready => ready_96_144,
        ctr_wrap => ctr_wrap_96_144
    );

CTRSpeck_128_128: entity work.CTRSpeck
    generic map (128, 128)
    port map (
        data_in => data_in_128_128,
        key => key_128_128,
        nonce => nonce_128_128,
        clk => clk,
        reset => reset_128_128,
        data_out => data_out_128_128, 
        ready => ready_128_128,
        ctr_wrap => ctr_wrap_128_128
    );
    
CTRSpeck_128_192: entity work.CTRSpeck
    generic map (128, 192)
    port map (
        data_in => data_in_128_192,
        key => key_128_192,
        nonce => nonce_128_192,
        clk => clk,
        reset => reset_128_192,
        data_out => data_out_128_192, 
        ready => ready_128_192,
        ctr_wrap => ctr_wrap_128_192
    );
        
CTRSpeck_128_256: entity work.CTRSpeck
    generic map (128, 256)
    port map (
        data_in => data_in_128_256,
        key => key_128_256,
        nonce => nonce_128_256,
        clk => clk,
        reset => reset_128_256,
        data_out => data_out_128_256, 
        ready => ready_128_256,
        ctr_wrap => ctr_wrap_128_256
    );

tb_ctr_set_32_64: process
    begin
        -- Encryption test
        reset_32_64 <= '1';

        wait until rising_edge(clk);

        reset_32_64 <= '0';

        data_in_32_64 <= 32x"40212ef7";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fcbd04c3";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e8e5216a";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"88561712";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fb97d435";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"b4862b21";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"cf6a659e";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9a164106";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e6f4590b";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"259f4329";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4f65d4d9";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"19488dec";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"bad640fb";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"12e0c8b2";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e61a441c";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"d9b8a714";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"af19922a";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"5487ce1e";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"78de5857";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"8f4ff31e";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"19c78df4";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"5a921187";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 22 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_32_64 <= '1';

        wait until rising_edge(clk);

        reset_32_64 <= '0';

        data_in_32_64 <= 32x"26358c07";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"a5aa0d1e";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"7bad82ce";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"b172b9e1";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"eeac6d47";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fc2cb7c1";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9f54e1d1";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"b9173518";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4ef48286";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e8dc27a2";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"c17ca211";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"915f5cdd";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fbe88def";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"c3979b92";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"45d8f47b";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4929a0c2";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"20dd2092";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"749559fd";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"a4f8efa2";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fe283321";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"757f9588";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"6f4327fb";
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 22 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_32_64: process
    begin
        wait until falling_edge(clk) and ready_32_64 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"26358c07") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"a5aa0d1e") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"7bad82ce") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"b172b9e1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"eeac6d47") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"fc2cb7c1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"9f54e1d1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"b9173518") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"4ef48286") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"e8dc27a2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"c17ca211") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"915f5cdd") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"fbe88def") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"c3979b92") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"45d8f47b") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"4929a0c2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"20dd2092") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"749559fd") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"a4f8efa2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"fe283321") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"757f9588") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"6f4327fb") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_32_64 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_32_64=32x"40212ef7") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"fcbd04c3") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"e8e5216a") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"88561712") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"fb97d435") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"b4862b21") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"cf6a659e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"9a164106") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"e6f4590b") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"259f4329") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"4f65d4d9") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"19488dec") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"bad640fb") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"12e0c8b2") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"e61a441c") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"d9b8a714") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"af19922a") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"5487ce1e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"78de5857") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"8f4ff31e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"19c78df4") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_32_64=32x"5a921187") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "32-Bit Block, 64-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_48_72: process
    begin
        -- Encryption test
        reset_48_72 <= '1';

        wait until rising_edge(clk);

        reset_48_72 <= '0';

        data_in_48_72 <= 48x"e1a5cc457821";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"5129fb7c6288";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"bc08935ddd72";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4a5308cc3dfa";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"f3262f120554";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d24bace4307b";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"e15c2fcd81b5";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"9cdeb3e60870";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d477fb3675b8";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"42930b33a81a";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"923d79fdef7c";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"16febaa011af";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"54b8adc0da7a";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"215663abc1f2";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"ee38e07405eb";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"ec62b2c82648";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"792809e469e6";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"148b2758d7ab";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d1a8e5eeac76";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"ec4f217bb306";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"c1b9d450fe4a";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"aef9c00b8a64";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 22 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_48_72 <= '1';

        wait until rising_edge(clk);

        reset_48_72 <= '0';

        data_in_48_72 <= 48x"a0358fa85c38";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"1388f385c26a";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"1ec932a12924";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"5a241b0ac607";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"869c9e59c8ea";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"82531bb9c5bc";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"24990c0c5917";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"9de9c45daf3c";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"63c938711ba6";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"6ae0022bb38";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"b0a57b778ad4";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"2bd3b0a5ae19";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4749d52bfa77";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d67090400c70";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"90f31f77f9d3";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"43a1ca86e615";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"a5f1d80d9a0b";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"c537f50bb0a6";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"5b2e570bd1e0";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"ca7d04410ab7";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"36e11947fa29";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"ffa772f11e14";
        key_48_72 <= 72x"e27a1d50068d723104";
        nonce_48_72 <= 24x"855f3f";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 22 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_48_72: process
    begin
        wait until falling_edge(clk) and ready_48_72 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"a0358fa85c38") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"1388f385c26a") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"1ec932a12924") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"5a241b0ac607") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"869c9e59c8ea") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"82531bb9c5bc") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"24990c0c5917") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"9de9c45daf3c") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"63c938711ba6") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"6ae0022bb38") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"b0a57b778ad4") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"2bd3b0a5ae19") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"4749d52bfa77") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"d67090400c70") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"90f31f77f9d3") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"43a1ca86e615") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"a5f1d80d9a0b") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"c537f50bb0a6") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"5b2e570bd1e0") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"ca7d04410ab7") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"36e11947fa29") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"ffa772f11e14") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_48_72 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_48_72=48x"e1a5cc457821") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"5129fb7c6288") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"bc08935ddd72") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"4a5308cc3dfa") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"f3262f120554") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"d24bace4307b") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"e15c2fcd81b5") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"9cdeb3e60870") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"d477fb3675b8") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"42930b33a81a") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"923d79fdef7c") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"16febaa011af") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"54b8adc0da7a") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"215663abc1f2") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"ee38e07405eb") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"ec62b2c82648") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"792809e469e6") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"148b2758d7ab") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"d1a8e5eeac76") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"ec4f217bb306") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"c1b9d450fe4a") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_72=48x"aef9c00b8a64") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "48-Bit Block, 72-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_48_96: process
    begin
        -- Encryption test
        reset_48_96 <= '1';

        wait until rising_edge(clk);

        reset_48_96 <= '0';

        data_in_48_96 <= 48x"6e84d977e993";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"e52146063717";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"35d0adf20806";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"d344749096fd";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"5241f323ca74";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"9466e4726b5f";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"1a8146743741";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"7e1ea9c57358";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"799aa905d750";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"ff0ac0f1a425";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"a8d0b341facd";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"fb82860deabc";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"709acb175a5a";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"151665705b7c";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"5a865306f3f5";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"1d878f9f9cdf";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"870c7c879b74";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"a1515607964a";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"10255d44936";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"30bcab0ed857";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"465e3e37952d";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"bb42e0b20426";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"3bf94562be7f";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_48_96 <= '1';

        wait until rising_edge(clk);

        reset_48_96 <= '0';

        data_in_48_96 <= 48x"9e6b67debc87";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"48bce9909437";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"2226637c71ec";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"42dbcde2623f";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"4439bf0771f2";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"7420de27f46a";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"5bbd0504189b";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"b3ef9966b292";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"e3e776ea3daf";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"d2f9681d1dc1";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"83a43db58ddf";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"3dff8a402649";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"868d2b25604";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"cc5c6fc2a85b";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8f130c21de67";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"7413589b0e92";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"35bd5846f0c5";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"255517af9e45";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8a0d3372a299";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"3f4b77c540da";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"cc375687240e";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"47e20d780a9";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"a7a90e6c4adf";
        key_48_96 <= 96x"864a7a50b48d73f1d67e55fd";
        nonce_48_96 <= 24x"7893ae";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_48_96: process
    begin
        wait until falling_edge(clk) and ready_48_96 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"9e6b67debc87") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"48bce9909437") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"2226637c71ec") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"42dbcde2623f") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"4439bf0771f2") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"7420de27f46a") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"5bbd0504189b") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"b3ef9966b292") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"e3e776ea3daf") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"d2f9681d1dc1") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"83a43db58ddf") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"3dff8a402649") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"868d2b25604") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"cc5c6fc2a85b") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"8f130c21de67") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"7413589b0e92") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"35bd5846f0c5") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"255517af9e45") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"8a0d3372a299") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"3f4b77c540da") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"cc375687240e") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"47e20d780a9") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"a7a90e6c4adf") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_48_96 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_48_96=48x"6e84d977e993") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"e52146063717") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"35d0adf20806") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"d344749096fd") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"5241f323ca74") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"9466e4726b5f") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"1a8146743741") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"7e1ea9c57358") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"799aa905d750") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"ff0ac0f1a425") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"a8d0b341facd") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"fb82860deabc") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"709acb175a5a") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"151665705b7c") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"5a865306f3f5") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"1d878f9f9cdf") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"870c7c879b74") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"a1515607964a") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"10255d44936") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"30bcab0ed857") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"465e3e37952d") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"bb42e0b20426") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_48_96=48x"3bf94562be7f") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "48-Bit Block, 96-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_64_96: process
    begin
        -- Encryption test
        reset_64_96 <= '1';

        wait until rising_edge(clk);

        reset_64_96 <= '0';

        data_in_64_96 <= 64x"92e8e269d12ecbc4";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e8f6cf32a25b59fd";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"88c132adefbfc19e";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"ae3b16ec9a27d858";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6d599e812f175ff";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a28f5ab01fdb8b32";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"9b38fe803042e325";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"9371a71fd480865f";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"64264cd51ea45cd6";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5ec17dbe176ea1b1";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"fb0323a1d576d415";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"950fd131db53334";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"589f8779b025244";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f606254131d0b664";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"2f5a522af87f43fd";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"1fb797fab7d6467b";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"35e8579a7aaf0e89";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"ccfdba9bba26d851";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"efdd35f80fa34266";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5d51433ade9b2b4";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6cf55b158b53031d";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"19fbeb1d9edfa3da";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"428a1c22d5fdb76a";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"3888447911ebcd49";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a59cec98126cbc8f";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"59acdd984d125e7f";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 26 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_64_96 <= '1';

        wait until rising_edge(clk);

        reset_64_96 <= '0';

        data_in_64_96 <= 64x"b51e3b56801887a";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4298270233e42b04";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5eeb2b01538bda62";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"27c4fc3d1b4820c3";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"9112ef669f69d2ac";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f110116d0064470b";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"73b256381b07bedd";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"281cac71239c7b2";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"83319e38fe189dc2";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5788a47bb20bc3ed";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"cd2f9fa419fc05f8";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"8e99cea475971938";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4aefe36aaf14a3fb";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"556a699734666015";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b0ef63d2bcf878a4";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c7193089decf7cb0";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"175d826956aec7ae";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"755ba7fe094463b5";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5202a07761836bb";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5ca05d768ffefa9d";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"8b6a2c1886b216a0";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6cb61528f1be01c5";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"7cbbfc4f9845e1ba";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"47f61ee4ebf9390";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"94fec7f5ad652685";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e42ec0c02574067c";
        key_64_96 <= 96x"c87a746319c16a0d0febd845";
        nonce_64_96 <= 32x"38018b47";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 26 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_64_96: process
    begin
        wait until falling_edge(clk) and ready_64_96 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"b51e3b56801887a") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"4298270233e42b04") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"5eeb2b01538bda62") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"27c4fc3d1b4820c3") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"9112ef669f69d2ac") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"f110116d0064470b") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"73b256381b07bedd") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"281cac71239c7b2") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"83319e38fe189dc2") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"5788a47bb20bc3ed") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"cd2f9fa419fc05f8") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"8e99cea475971938") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"4aefe36aaf14a3fb") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"556a699734666015") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"b0ef63d2bcf878a4") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"c7193089decf7cb0") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"175d826956aec7ae") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"755ba7fe094463b5") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"5202a07761836bb") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"5ca05d768ffefa9d") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"8b6a2c1886b216a0") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"6cb61528f1be01c5") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"7cbbfc4f9845e1ba") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"47f61ee4ebf9390") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"94fec7f5ad652685") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"e42ec0c02574067c") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_64_96 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_64_96=64x"92e8e269d12ecbc4") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"e8f6cf32a25b59fd") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"88c132adefbfc19e") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"ae3b16ec9a27d858") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"6d599e812f175ff") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"a28f5ab01fdb8b32") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"9b38fe803042e325") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"9371a71fd480865f") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"64264cd51ea45cd6") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"5ec17dbe176ea1b1") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"fb0323a1d576d415") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"950fd131db53334") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"589f8779b025244") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"f606254131d0b664") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"2f5a522af87f43fd") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"1fb797fab7d6467b") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"35e8579a7aaf0e89") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"ccfdba9bba26d851") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"efdd35f80fa34266") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"5d51433ade9b2b4") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"6cf55b158b53031d") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"19fbeb1d9edfa3da") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"428a1c22d5fdb76a") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"3888447911ebcd49") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"a59cec98126cbc8f") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_96=64x"59acdd984d125e7f") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "64-Bit Block, 96-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_64_128: process
    begin
        -- Encryption test
        reset_64_128 <= '1';

        wait until rising_edge(clk);

        reset_64_128 <= '0';

        data_in_64_128 <= 64x"fcfcfa81b306d700";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"3308fb2e642aad48";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"5bca47be429817c5";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"bb4a06cbe786ab37";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d69c91c278601602";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"eb21a3f6e6fd68e8";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"2b5f693291dc59ef";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ac322c12b29c467d";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"f76fbfb83412fc12";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"edc6d2bc470f0e7";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ad1b8f60c9e4dab2";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d86dbf1128805c5d";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"57a1cb712975d279";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"402d0baf878b9f6b";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"98c752051e01a934";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"713b7e05ebe21368";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"2cc0f859aa6524ab";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"78bc71750361524c";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"68ef8f5fae68690a";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"91b15f5de66cd36e";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"82339e23dff3334b";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4fbaecc0eae2025e";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"5b6e4ae7a6208143";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d670f668637e0edc";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"403d1f83a859890c";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"8f837ef727460f22";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"32f06cab0d9c2aa";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 27 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_64_128 <= '1';

        wait until rising_edge(clk);

        reset_64_128 <= '0';

        data_in_64_128 <= 64x"4cca881b63720907";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4d31881b00d9fbd3";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"25a143e1f92bebb7";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d885fa0541807a7f";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"32395e24afd55ebc";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"7e9beff3a9fa627b";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"b0beae63dbc0c739";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"59948f9c908ee98";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"195f80dda8626724";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"176e5f02031f24a";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"1d8f8756cf0cc08b";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"5c07993d8c34cd2b";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"3f64dfd66e49f498";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"e821f1929c29ecdd";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"93667aae39d20a6f";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d2d095bd0c55c0b1";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"3b9a47ebe66e30b5";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"df6ee985842bffcc";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"528065a905221525";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"8cf281869b419b74";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"43c4dce60e2a7868";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"7f673de83b14fdcd";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d822f35bf2f1d8d2";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"e28e6d1c88682101";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d870a506b974095c";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"434a60f15d05ca48";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"fe751d63fafb2ea9";
        key_64_128 <= 128x"7795e98680ee526e0fa07a3f2e295065";
        nonce_64_128 <= 32x"98b33c6e";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 27 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_64_128: process
    begin
        wait until falling_edge(clk) and ready_64_128 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"4cca881b63720907") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"4d31881b00d9fbd3") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"25a143e1f92bebb7") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d885fa0541807a7f") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"32395e24afd55ebc") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"7e9beff3a9fa627b") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"b0beae63dbc0c739") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"59948f9c908ee98") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"195f80dda8626724") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"176e5f02031f24a") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"1d8f8756cf0cc08b") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"5c07993d8c34cd2b") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"3f64dfd66e49f498") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"e821f1929c29ecdd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"93667aae39d20a6f") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d2d095bd0c55c0b1") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"3b9a47ebe66e30b5") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"df6ee985842bffcc") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"528065a905221525") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"8cf281869b419b74") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"43c4dce60e2a7868") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"7f673de83b14fdcd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d822f35bf2f1d8d2") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"e28e6d1c88682101") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d870a506b974095c") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"434a60f15d05ca48") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"fe751d63fafb2ea9") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_64_128 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_64_128=64x"fcfcfa81b306d700") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"3308fb2e642aad48") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"5bca47be429817c5") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"bb4a06cbe786ab37") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d69c91c278601602") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"eb21a3f6e6fd68e8") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"2b5f693291dc59ef") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"ac322c12b29c467d") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"f76fbfb83412fc12") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"edc6d2bc470f0e7") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"ad1b8f60c9e4dab2") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d86dbf1128805c5d") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"57a1cb712975d279") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"402d0baf878b9f6b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"98c752051e01a934") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"713b7e05ebe21368") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"2cc0f859aa6524ab") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"78bc71750361524c") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"68ef8f5fae68690a") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"91b15f5de66cd36e") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"82339e23dff3334b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"4fbaecc0eae2025e") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"5b6e4ae7a6208143") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"d670f668637e0edc") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"403d1f83a859890c") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"8f837ef727460f22") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_64_128=64x"32f06cab0d9c2aa") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "64-Bit Block, 128-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_96_96: process
    begin
        -- Encryption test
        reset_96_96 <= '1';

        wait until rising_edge(clk);

        reset_96_96 <= '0';

        data_in_96_96 <= 96x"3c54c71fca055362169df82";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"adb328cbf3158c0c66dd7794";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"de59f550f0fc2b6ae04d52";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b7a28e0a03a8987936a98d74";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"faf1501b009a815bc1378be5";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8741ae91acfebb4bd29e8693";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"30c1fb6a190865159cb017c1";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a636425c9bbd750d1e707c52";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4d6b234fdfa7c6ed32d1f81b";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"fa7ff8bfb044284a47acf2f6";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"79c147c719a5711b2ea60b99";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"658de17eec3aa314da9bb017";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"597aab614d30dbca0acf4c9";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"73f660d8e9f41cc04653a560";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"1da3b7e2cad6e514ccc14d51";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2227d96d41a93f90dc821527";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d138d1508557716aa7502a81";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"58d87776a51ad4f3a699bae0";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"27896389df3277fd1d77ce40";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4c14982d9ead9264745dd9e";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"34ab18fd0a68e88e0ad40415";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8ef066d44279b14dae55cdff";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"5decc06af24dfdd850910bdc";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"e8ec01b3914591aef03d866a";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d8ab0b300ac0cf0dd974c146";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b38a05fbf61164cebfc74ca9";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"7e969cf3a7c5cb879b8b71a1";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"e7180322a4e695c9b65d1226";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 28 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_96_96 <= '1';

        wait until rising_edge(clk);

        reset_96_96 <= '0';

        data_in_96_96 <= 96x"97fb8f1b8a2c780bdbe92679";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4f6b9e97778ffdd44e2b8f1f";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"73db8c75eb2ba4648050a8f4";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"aab830dddec7409e3c939888";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c50c47e352e21167d2c0ab01";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"200886ff8ab663bf08611493";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"1a0a1f98599b38283fefc5ae";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"fdec2fd520311ba18ca7b33e";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"59ffd7d37dc1689eb3e8e59a";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"1b539b66a67743ae0c08181d";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8f16310d75298afd10763e07";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"5530a61a46fe1b6538f332bf";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"3ae4883041653aa8a5939051";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2b3a62f3b9bd16db94ca5b06";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8ab4ae7a2929a7d577789e2a";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"dffacc30378a2106881307bc";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a89ac9fd339198b56e6887fe";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"1cc81111ff1ae165799b6e9a";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9c287c0fa214fd8ec5324fa4";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c00772ba5d75d0333109b9c1";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"fe36b860b8ff11e10241fbe1";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"482496c4e2ccd058860ce815";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2839a3e45975192b21425f4f";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"168ba4ebe1657399cfa26f36";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"5b166dd08b5341a34e6bdb2d";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"95db0991b283f21d75f7561e";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"bf405248fba1422e3eb6f810";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"575db10c75d13fb3effe0831";
        key_96_96 <= 96x"47e7f5938b5885ca0bb2c3f0";
        nonce_96_96 <= 48x"f6b2f40048d7";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 28 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_96_96: process
    begin
        wait until falling_edge(clk) and ready_96_96 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"97fb8f1b8a2c780bdbe92679") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"4f6b9e97778ffdd44e2b8f1f") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"73db8c75eb2ba4648050a8f4") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"aab830dddec7409e3c939888") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"c50c47e352e21167d2c0ab01") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"200886ff8ab663bf08611493") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"1a0a1f98599b38283fefc5ae") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"fdec2fd520311ba18ca7b33e") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"59ffd7d37dc1689eb3e8e59a") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"1b539b66a67743ae0c08181d") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"8f16310d75298afd10763e07") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"5530a61a46fe1b6538f332bf") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"3ae4883041653aa8a5939051") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"2b3a62f3b9bd16db94ca5b06") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"8ab4ae7a2929a7d577789e2a") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"dffacc30378a2106881307bc") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"a89ac9fd339198b56e6887fe") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"1cc81111ff1ae165799b6e9a") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"9c287c0fa214fd8ec5324fa4") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"c00772ba5d75d0333109b9c1") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"fe36b860b8ff11e10241fbe1") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"482496c4e2ccd058860ce815") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"2839a3e45975192b21425f4f") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"168ba4ebe1657399cfa26f36") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"5b166dd08b5341a34e6bdb2d") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"95db0991b283f21d75f7561e") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"bf405248fba1422e3eb6f810") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"575db10c75d13fb3effe0831") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_96_96 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_96_96=96x"3c54c71fca055362169df82") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"adb328cbf3158c0c66dd7794") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"de59f550f0fc2b6ae04d52") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"b7a28e0a03a8987936a98d74") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"faf1501b009a815bc1378be5") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"8741ae91acfebb4bd29e8693") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"30c1fb6a190865159cb017c1") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"a636425c9bbd750d1e707c52") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"4d6b234fdfa7c6ed32d1f81b") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"fa7ff8bfb044284a47acf2f6") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"79c147c719a5711b2ea60b99") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"658de17eec3aa314da9bb017") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"597aab614d30dbca0acf4c9") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"73f660d8e9f41cc04653a560") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"1da3b7e2cad6e514ccc14d51") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"2227d96d41a93f90dc821527") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"d138d1508557716aa7502a81") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"58d87776a51ad4f3a699bae0") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"27896389df3277fd1d77ce40") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"4c14982d9ead9264745dd9e") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"34ab18fd0a68e88e0ad40415") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"8ef066d44279b14dae55cdff") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"5decc06af24dfdd850910bdc") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"e8ec01b3914591aef03d866a") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"d8ab0b300ac0cf0dd974c146") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"b38a05fbf61164cebfc74ca9") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"7e969cf3a7c5cb879b8b71a1") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_96=96x"e7180322a4e695c9b65d1226") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "96-Bit Block, 96-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_96_144: process
    begin
        -- Encryption test
        reset_96_144 <= '1';

        wait until rising_edge(clk);

        reset_96_144 <= '0';

        data_in_96_144 <= 96x"555a40854578bab326a97465";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5e00ea6dca24be4d56672017";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5697f17c17fd3736b7ef941c";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"9215f4f9edb95f2c787ddfb";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"29f2c3c74505f4f60a8c46c7";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"955d0e77fb5eb8662640211e";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"651116565c6460364a1eb1b7";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"2130260c8c69778ffd42f697";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7a62722e1d69d9fc4b1cb8bd";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ef0a81ed3d5d60bcbb0378eb";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"2df967474ed135530c5a876f";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ba8982dd85e69ea9db66bfda";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"673617d94d7bd307122411e6";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4c9a0ae15419eefcd5e73e3f";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"19724ce31bd094486a2b3200";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7b2e1b82e89dc8158f928dc5";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"d741d609564ae90979585e69";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"cff4c56bf9ea2c64cc417e7c";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7aa56a181fd3c01757f98d1e";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7f6b8793b318ad4c1db2b452";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4d4985dc09aedbd06d316b4a";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"afe6790abc18a40b55c7ed9d";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"eb70ba6527d99a23e4f7625e";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"90823edaa0722aa02aa36cf7";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"f97ccc57ce5dc80760257199";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"16408169a38d8afcfdd2ed7a";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"15ace7a1ceca2ee310da8a95";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"38974df5bff773ce32b2c492";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"202861c628308690fa7ee05";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 29 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_96_144 <= '1';

        wait until rising_edge(clk);

        reset_96_144 <= '0';

        data_in_96_144 <= 96x"36f466c533e3bd51ac06ca6b";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"f402e43153a7036f11a3207b";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"3252a589175cab05aac372dd";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"fc94cad4e9b6e1c3d7a1f7ca";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"fe6138423b88cccfdbe545cb";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"49dc1a7346c8c5d3591274f2";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"304cd38368c9f1308436240d";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6796313bec70ef99c3809b5b";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"9653963ddfaae0adeb710a68";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4228f674e5a69c8da3aa3866";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"8b2350b9d42857bb1c47d1d4";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"9932fede512ea2a1f47b2df1";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c66cbabc2da3439c197ad1e8";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1d3f632055be21f034c46cd0";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"bbbcfcb3472a072f2cb263bf";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"2bf062456bc821c6251e15e5";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"3e8f82de8c6ec7fbb1fe9a6c";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"a09d3230017e81e428f998f3";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"fca3b600f1ef5c22de69809d";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"a650c78dc9be810c4f3c7615";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"a98a2b7a78abeb74841b4158";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7885929b4c0ff2d73aec9ea4";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"f6ca914ba6bbdeb544a2275c";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"34fb359551c224fa7453155b";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c0cbb03974db5581724a3471";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"a601fb2c178225af965a9bf3";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"757bb471085858f6991457d8";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"679acb28f9b0d2cfdac31a4c";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"dde8b400f943920cee547874";
        key_96_144 <= 144x"9502964ddb776025f0ae353545792da44da1";
        nonce_96_144 <= 48x"46e30247145f";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 29 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_96_144: process
    begin
        wait until falling_edge(clk) and ready_96_144 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"36f466c533e3bd51ac06ca6b") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"f402e43153a7036f11a3207b") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"3252a589175cab05aac372dd") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"fc94cad4e9b6e1c3d7a1f7ca") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"fe6138423b88cccfdbe545cb") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"49dc1a7346c8c5d3591274f2") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"304cd38368c9f1308436240d") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"6796313bec70ef99c3809b5b") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"9653963ddfaae0adeb710a68") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"4228f674e5a69c8da3aa3866") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"8b2350b9d42857bb1c47d1d4") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"9932fede512ea2a1f47b2df1") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"c66cbabc2da3439c197ad1e8") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"1d3f632055be21f034c46cd0") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"bbbcfcb3472a072f2cb263bf") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"2bf062456bc821c6251e15e5") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"3e8f82de8c6ec7fbb1fe9a6c") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"a09d3230017e81e428f998f3") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"fca3b600f1ef5c22de69809d") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"a650c78dc9be810c4f3c7615") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"a98a2b7a78abeb74841b4158") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"7885929b4c0ff2d73aec9ea4") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"f6ca914ba6bbdeb544a2275c") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"34fb359551c224fa7453155b") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"c0cbb03974db5581724a3471") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"a601fb2c178225af965a9bf3") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"757bb471085858f6991457d8") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"679acb28f9b0d2cfdac31a4c") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"dde8b400f943920cee547874") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_96_144 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_96_144=96x"555a40854578bab326a97465") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"5e00ea6dca24be4d56672017") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"5697f17c17fd3736b7ef941c") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"9215f4f9edb95f2c787ddfb") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"29f2c3c74505f4f60a8c46c7") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"955d0e77fb5eb8662640211e") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"651116565c6460364a1eb1b7") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"2130260c8c69778ffd42f697") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"7a62722e1d69d9fc4b1cb8bd") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"ef0a81ed3d5d60bcbb0378eb") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"2df967474ed135530c5a876f") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"ba8982dd85e69ea9db66bfda") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"673617d94d7bd307122411e6") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"4c9a0ae15419eefcd5e73e3f") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"19724ce31bd094486a2b3200") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"7b2e1b82e89dc8158f928dc5") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"d741d609564ae90979585e69") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"cff4c56bf9ea2c64cc417e7c") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"7aa56a181fd3c01757f98d1e") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"7f6b8793b318ad4c1db2b452") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"4d4985dc09aedbd06d316b4a") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"afe6790abc18a40b55c7ed9d") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"eb70ba6527d99a23e4f7625e") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"90823edaa0722aa02aa36cf7") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"f97ccc57ce5dc80760257199") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"16408169a38d8afcfdd2ed7a") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"15ace7a1ceca2ee310da8a95") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"38974df5bff773ce32b2c492") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_96_144=96x"202861c628308690fa7ee05") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "96-Bit Block, 144-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_128_128: process
    begin
        -- Encryption test
        reset_128_128 <= '1';

        wait until rising_edge(clk);

        reset_128_128 <= '0';

        data_in_128_128 <= 128x"4bdffa7d9f3dd894b6af98b2aeba42d0";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f55e3aa2208a393ed960af85c9df7e44";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4b36b545cca1a034633cbf79e96aa1af";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f521ca9fdf5e6f78beebb4eaeab9221b";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"1f1e0ee9cf6c9992fbbff9e0ae56702a";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"feef71cbc915d113dc45488d84dda9b9";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"645bd776c838a14509c67417306aa871";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"30c32323c1b199c45f1ff97c71cff814";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a1cba182ca20854d5b471c437499b28c";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e6e4b8df0b6d9611f4dd05d51349747a";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4160ff927c7550f20a3c2c6fef2d9a38";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8522dc4ef1dd50bf06d2ed7ce6ac9d8a";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e0397e67926146de91bacf80aaa07996";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c6be643217ee0eb03acaaf82374a6cc9";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a09f1aede38690e7e27ac8e9d1c3d1bc";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8611f583b2d10e3d809e2109c7867a38";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f20b575d4e28e67481d1bf066b8c66f2";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e44fc3a96d0c62c3254bf7ae1d0ab994";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"15831feeec41e6f66c0be55c90e639e1";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"101bb5fa6a6776231ad1daaaef8d9ff0";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"27f9e728c618fc1e6a4805421965e435";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ca9571e407dc02b1f45da406bbf9bb01";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"6ac1ca75afb918c86e5bac20725c2675";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"dd32e231eb5616997f22cd1207b6e08e";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"40a978bfb8f8903b53125ffdf655860b";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"1f12a0e912011caa5a3da367141b1a1b";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"586f1721078548d7b1182d235bf80676";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"d48c93f3028d042b2d8b5b41590e83da";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"5da53b38d1aa6c5e3b019fcbf96d4403";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"24aeba79e4b8298798ba0f0e120d7126";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a8b56f85346d2b7e00d3d1af353e0c86";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e6a1a40bf031f4b9bb6b0095ac7b7ab2";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 32 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_128_128 <= '1';

        wait until rising_edge(clk);

        reset_128_128 <= '0';

        data_in_128_128 <= 128x"a4c6764f6e9a1ea756bf4274e3b33bed";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"47dd836458dc05000c1de54cc92b91e0";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"455b0bd075be485121c68e5684720ca9";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4dbb508b3a5402fab3141c22a5b70b2c";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"35202de21f8866bd22e1171f21cd7c91";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"26360dbd57a2ad339e24047802f7c8d7";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"6569e211ecf55c01a5a511fd16cb88de";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b9df02e542b2d1926b9544376ac6cde4";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"1e65456263672aa0aee3fe69b49fb0a7";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"91f239ebb77ae16004a9d6da4f88bcfe";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"bd1d66c9276405d5adb604d88e48371";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2f3a794a16ad57634bb07705c968f58c";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"6f14fb9175ed4dbc5574dc4cda7596b0";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fa14f4ad8a84772147c1488beb2d3fed";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f3253eed10e13aaeedd7b717be2195a4";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4905244b644856dac8b9b92e8d2df5a6";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2a97242a3f25e3fb81229a9232d90a78";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"664c9ea842b56576d03c7a485676f89a";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ecc7ed566077492092b8a2881e41b017";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"75226bfc25b8e6bbde6ca0213e2e1de0";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f9184334b80026c522e54b832994d11f";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8bb78405fcd6cb562b33ef96ecc9d890";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"9bc6fcdaec2552e10ea4a844a7012355";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fa9fb17819b818e7cf0b89415f85a3c8";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"31c2b0655ae8540d00903894abf12298";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2e2bb5fef5f40229640e0cb63c90bee2";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"9fb5470ff254f9a58b271b96d5c31eb3";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"d6655b7d39c5244a9a5da524469d459e";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"732071ab1c2c68a4d1689fb2ffa59c7f";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"7aa38c53e1c575c81b67341d40e05331";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fa339d60a175a954ef73eafa529eed07";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"736600dc5631c4da87d23c8be569e475";
        key_128_128 <= 128x"4a31b24384dd6da68e751eb764d09913";
        nonce_128_128 <= 64x"6c4c3935379deda1";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 32 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_128_128: process
    begin
        wait until falling_edge(clk) and ready_128_128 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"a4c6764f6e9a1ea756bf4274e3b33bed") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"47dd836458dc05000c1de54cc92b91e0") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"455b0bd075be485121c68e5684720ca9") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"4dbb508b3a5402fab3141c22a5b70b2c") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"35202de21f8866bd22e1171f21cd7c91") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"26360dbd57a2ad339e24047802f7c8d7") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"6569e211ecf55c01a5a511fd16cb88de") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"b9df02e542b2d1926b9544376ac6cde4") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"1e65456263672aa0aee3fe69b49fb0a7") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"91f239ebb77ae16004a9d6da4f88bcfe") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"bd1d66c9276405d5adb604d88e48371") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"2f3a794a16ad57634bb07705c968f58c") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"6f14fb9175ed4dbc5574dc4cda7596b0") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"fa14f4ad8a84772147c1488beb2d3fed") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"f3253eed10e13aaeedd7b717be2195a4") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"4905244b644856dac8b9b92e8d2df5a6") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"2a97242a3f25e3fb81229a9232d90a78") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"664c9ea842b56576d03c7a485676f89a") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"ecc7ed566077492092b8a2881e41b017") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"75226bfc25b8e6bbde6ca0213e2e1de0") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"f9184334b80026c522e54b832994d11f") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"8bb78405fcd6cb562b33ef96ecc9d890") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"9bc6fcdaec2552e10ea4a844a7012355") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"fa9fb17819b818e7cf0b89415f85a3c8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"31c2b0655ae8540d00903894abf12298") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"2e2bb5fef5f40229640e0cb63c90bee2") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"9fb5470ff254f9a58b271b96d5c31eb3") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"d6655b7d39c5244a9a5da524469d459e") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"732071ab1c2c68a4d1689fb2ffa59c7f") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"7aa38c53e1c575c81b67341d40e05331") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 29 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"fa339d60a175a954ef73eafa529eed07") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 30 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"736600dc5631c4da87d23c8be569e475") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 31 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_128_128 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_128_128=128x"4bdffa7d9f3dd894b6af98b2aeba42d0") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"f55e3aa2208a393ed960af85c9df7e44") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"4b36b545cca1a034633cbf79e96aa1af") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"f521ca9fdf5e6f78beebb4eaeab9221b") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"1f1e0ee9cf6c9992fbbff9e0ae56702a") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"feef71cbc915d113dc45488d84dda9b9") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"645bd776c838a14509c67417306aa871") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"30c32323c1b199c45f1ff97c71cff814") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"a1cba182ca20854d5b471c437499b28c") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"e6e4b8df0b6d9611f4dd05d51349747a") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"4160ff927c7550f20a3c2c6fef2d9a38") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"8522dc4ef1dd50bf06d2ed7ce6ac9d8a") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"e0397e67926146de91bacf80aaa07996") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"c6be643217ee0eb03acaaf82374a6cc9") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"a09f1aede38690e7e27ac8e9d1c3d1bc") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"8611f583b2d10e3d809e2109c7867a38") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"f20b575d4e28e67481d1bf066b8c66f2") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"e44fc3a96d0c62c3254bf7ae1d0ab994") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"15831feeec41e6f66c0be55c90e639e1") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"101bb5fa6a6776231ad1daaaef8d9ff0") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"27f9e728c618fc1e6a4805421965e435") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"ca9571e407dc02b1f45da406bbf9bb01") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"6ac1ca75afb918c86e5bac20725c2675") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"dd32e231eb5616997f22cd1207b6e08e") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"40a978bfb8f8903b53125ffdf655860b") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"1f12a0e912011caa5a3da367141b1a1b") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"586f1721078548d7b1182d235bf80676") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"d48c93f3028d042b2d8b5b41590e83da") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"5da53b38d1aa6c5e3b019fcbf96d4403") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"24aeba79e4b8298798ba0f0e120d7126") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 29 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"a8b56f85346d2b7e00d3d1af353e0c86") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 30 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_128=128x"e6a1a40bf031f4b9bb6b0095ac7b7ab2") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 31 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "128-Bit Block, 128-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_128_192: process
    begin
        -- Encryption test
        reset_128_192 <= '1';

        wait until rising_edge(clk);

        reset_128_192 <= '0';

        data_in_128_192 <= 128x"5cbbc08035475c5ef76dce6e0726d44a";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4ae9ee11f5fe0213792ecd7555c36c3d";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f5492e22e0df7f74efe78b604bdd5f99";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"2f1d9bef53b53b92a2cb5f388d9ecfb9";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1a42b62914afe646fe3216bd97d01e70";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"280a07ee4ec985ff94b28b9d88819f42";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f217faac259cff81e5ce0ca6606821d6";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"50de4292390a9016cdec85da200f7753";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c13e66af3c9590d33e2aad3e82221345";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6b770df15f59aa2c4a82e06a2f16fb50";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"21da132cdc68d4fd0bd7696fa9c72e7b";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"13f2a37c64d027590542bd7599e8c828";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6b944e0921cc14b312bdf75fb3c161c3";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bdaa3bfa6ab015638cffbbb14ca49aaf";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6c148fc69750ca7e246cb09ced28508d";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"15a5712c5ac4b6c7a31034dd4c4b91fe";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"5e87905aa1fdcdf171df24d93f80c31f";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ecfb95b877a2133f2ed33e1a3155940";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6acf49eb02284fd9689bba65605dd4d6";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"52177eb7e6b920daba6a098ff642c8f3";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4b1678e45f20f4063438b4e470f8dd99";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f344c911174f7a54788c161ef3cc9d8a";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"46e785ad1bce35d8cbe88a3f2f7a304f";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b02de52c9b050db28ee4fd021cb66f67";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7237d420b3dd77e1cbb02fe927649a62";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c4841a8d2f751bde66163e5beda2fc4c";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"3f7a27482cbb93c26e84f8ea6bf4d047";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"efe6171b5723a95974151accf5a3e893";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"766229cc5af95c78247f4d9785fa2d5c";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7bb8c2f11624d318a32652e8a1ab17c0";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"78cb124b7350d13421beafc149fa8e";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"9e65736c72f774b1b2f11ef9d4864482";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4c6e6fbb37fef6b501fda698764657ca";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 33 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_128_192 <= '1';

        wait until rising_edge(clk);

        reset_128_192 <= '0';

        data_in_128_192 <= 128x"33420c67ce1e9895288f93f719b11aae";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6374def8c2c8b263023b610dbaf10cc3";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1ea134b0baec4b292daaa54ef00dbc28";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"17e47fe7a0a9fe523c65e9a8ba4118cd";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"326c6c2657f696fa49d5fd204a797ff9";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f441ea71149b338b69aaebbdabbbb1da";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"62d0863992c8abd93a6ffff068218a70";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bd554f5ffdc19233f6036c5658a99167";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d159ee1f1403dc06b75b9627d9bb9441";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1d5b1e34e917a586fff7e9a50da42ba2";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f58a6a079224a7c3a784d35d0b016e18";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6ab3634c23de132bd86bf69a6eff5704";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"601b4c1e7f8cb56275a863ff85ca891";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d4012d4bb46ad59c183c0749fa863772";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"24ea2c34df40c0285973b23e0252e644";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bb385256698918b14c72f647fd9128ca";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"9e7d60f1525e8c372809ed3282a45750";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c7117088fc52c0f1a96b1ac033b9b593";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4c023869e6f038a742d82acc0b124ff5";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c33359bfa959548e142ab58b6c7f2877";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"960ca3d8e5da90ffd8d0b7532f15b50e";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"8373764d9c4fb62ed033892761fb0916";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4d6e4388a85cb519fe76c45404c86429";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"9af68fe07f85b428d47534371a712237";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d9f0d8825aa3cfb59e6835d2f6f42939";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"22bbaa5d1d960a28f89a058f9e8bf4a7";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"fd657c8ae0ff67cffe554400d161b95e";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"94229bd42c54c6911e7ab88b449977c5";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"70c3e6dd3e2cd094eff731192792305e";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"db1dd489d2b6c48b71af004c2ae8a08f";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"45d30acfcba0a417dbca059acb2c61ec";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"e6002ab2ee397c38fcd092072efa811e";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ed0f3f5c5da2578480c4e5c65309b115";
        key_128_192 <= 192x"743c7e9d2fdeb0352452bc39dbf2eed13b9cea959ad7558f";
        nonce_128_192 <= 64x"421aa15ef58c43ce";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 33 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_128_192: process
    begin
        wait until falling_edge(clk) and ready_128_192 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"33420c67ce1e9895288f93f719b11aae") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"6374def8c2c8b263023b610dbaf10cc3") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"1ea134b0baec4b292daaa54ef00dbc28") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"17e47fe7a0a9fe523c65e9a8ba4118cd") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"326c6c2657f696fa49d5fd204a797ff9") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"f441ea71149b338b69aaebbdabbbb1da") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"62d0863992c8abd93a6ffff068218a70") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"bd554f5ffdc19233f6036c5658a99167") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"d159ee1f1403dc06b75b9627d9bb9441") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"1d5b1e34e917a586fff7e9a50da42ba2") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"f58a6a079224a7c3a784d35d0b016e18") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"6ab3634c23de132bd86bf69a6eff5704") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"601b4c1e7f8cb56275a863ff85ca891") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"d4012d4bb46ad59c183c0749fa863772") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"24ea2c34df40c0285973b23e0252e644") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"bb385256698918b14c72f647fd9128ca") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"9e7d60f1525e8c372809ed3282a45750") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"c7117088fc52c0f1a96b1ac033b9b593") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"4c023869e6f038a742d82acc0b124ff5") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"c33359bfa959548e142ab58b6c7f2877") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"960ca3d8e5da90ffd8d0b7532f15b50e") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"8373764d9c4fb62ed033892761fb0916") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"4d6e4388a85cb519fe76c45404c86429") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"9af68fe07f85b428d47534371a712237") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"d9f0d8825aa3cfb59e6835d2f6f42939") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"22bbaa5d1d960a28f89a058f9e8bf4a7") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"fd657c8ae0ff67cffe554400d161b95e") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"94229bd42c54c6911e7ab88b449977c5") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"70c3e6dd3e2cd094eff731192792305e") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"db1dd489d2b6c48b71af004c2ae8a08f") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 29 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"45d30acfcba0a417dbca059acb2c61ec") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 30 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"e6002ab2ee397c38fcd092072efa811e") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 31 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"ed0f3f5c5da2578480c4e5c65309b115") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 32 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_128_192 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_128_192=128x"5cbbc08035475c5ef76dce6e0726d44a") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"4ae9ee11f5fe0213792ecd7555c36c3d") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"f5492e22e0df7f74efe78b604bdd5f99") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"2f1d9bef53b53b92a2cb5f388d9ecfb9") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"1a42b62914afe646fe3216bd97d01e70") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"280a07ee4ec985ff94b28b9d88819f42") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"f217faac259cff81e5ce0ca6606821d6") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"50de4292390a9016cdec85da200f7753") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"c13e66af3c9590d33e2aad3e82221345") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"6b770df15f59aa2c4a82e06a2f16fb50") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"21da132cdc68d4fd0bd7696fa9c72e7b") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"13f2a37c64d027590542bd7599e8c828") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"6b944e0921cc14b312bdf75fb3c161c3") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"bdaa3bfa6ab015638cffbbb14ca49aaf") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"6c148fc69750ca7e246cb09ced28508d") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"15a5712c5ac4b6c7a31034dd4c4b91fe") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"5e87905aa1fdcdf171df24d93f80c31f") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"ecfb95b877a2133f2ed33e1a3155940") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"6acf49eb02284fd9689bba65605dd4d6") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"52177eb7e6b920daba6a098ff642c8f3") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"4b1678e45f20f4063438b4e470f8dd99") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"f344c911174f7a54788c161ef3cc9d8a") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"46e785ad1bce35d8cbe88a3f2f7a304f") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"b02de52c9b050db28ee4fd021cb66f67") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"7237d420b3dd77e1cbb02fe927649a62") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"c4841a8d2f751bde66163e5beda2fc4c") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"3f7a27482cbb93c26e84f8ea6bf4d047") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"efe6171b5723a95974151accf5a3e893") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"766229cc5af95c78247f4d9785fa2d5c") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"7bb8c2f11624d318a32652e8a1ab17c0") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 29 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"78cb124b7350d13421beafc149fa8e") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 30 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"9e65736c72f774b1b2f11ef9d4864482") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 31 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_192=128x"4c6e6fbb37fef6b501fda698764657ca") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 32 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "128-Bit Block, 192-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_128_256: process
    begin
        -- Encryption test
        reset_128_256 <= '1';

        wait until rising_edge(clk);

        reset_128_256 <= '0';

        data_in_128_256 <= 128x"3fc18c00dc0520a487ba3b901e415c4e";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"29deb984c31277fdeb83af16e404d808";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"4a294067dc66a27b6a325333116e8a64";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"92f078b8226962278513d91e48622a67";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"88083ebc35d4cd35a08c3a0085e74250";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"a274c0d7f4a5cc36692a7bce1af55c26";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c74f11cdbdce29ef674610eb8b279c29";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"4ad12b4c47534952c9c5fef1e76f8a76";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"a0f9c0749177b6d45f2e9167713eceb1";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"b270af551f9078d52835bcdb2347b24f";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"974fdedc66b6208761a53fdd1eda4209";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ab12fb538f42cebe23b870f377cb1a27";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"79009c61a1d20ebc5aa3892a4c88b9d8";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7a0a02ba37cf80256a447a90be0a5a56";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"517830328066b49bb1d792a07d25cefb";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f6ab75bf55b2e5ca6ed0ac07e22e1b7";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"bec60ffe248f4a254cd8ef2471a8c9c6";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"9f032cdce32866d30d6a78b07eda9ab9";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"78b61daf5afb9565068a3c383739076a";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2969326fe2d9d1de377b008641659c0";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"11035083fa999f9b86de3365d8a230de";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"afb120f414d4dad6ddfae808afd86432";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ab4414aeecb3d561bdf0b015f305ee95";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"a8aa1e45c7cbc6201a4f7a165264961";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ffeb5d5f00f520f49ef1c8461dbc24fd";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"b31e9be8a3ef802edf8693ce453432cd";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3a082921e695f8baba2338fe4ae302f3";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"49b564fb92a651d7c069c54224039721";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"75fd35376f1bdd071aff71ae30f2c485";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2b12c92c62565a955487b5c3b7626f49";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e5aef699a5e3a7196bf52dfd54a8762b";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7281b8a925e4979d6f6ddf79affe2554";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"862f78e125c29b6ab575bc6eeee84bcb";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e90f79f835783f662114c2d650ea1324";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 34 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_128_256 <= '1';

        wait until rising_edge(clk);

        reset_128_256 <= '0';

        data_in_128_256 <= 128x"d4388a8eb4ede3e0ce0c0265eaca02e";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"6860eb601210a28dbf17183db30b1f92";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"9375275c7decd6d7e051349610713971";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3c93e44b7f09a03a63ad916ef7b56f54";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c5a68f88f4dcd4360045b0b7283eb767";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7331fa985a5684940c5a7eb9599d4195";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"89ce54ef4af5157afdba01bfc0e411f2";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"67b0e75f42df412c92aea7362fc106fd";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"5f5ba9f55ba982a20dc713747a2f9047";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"9ff162c70bdfd84134572626864d0e15";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"742893522b4a37afa2a3dce0c50dfea4";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"cb24a87c8ef531f5d176c1661f071acf";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"fb419bd6fc51d34ee7957ff1989a98dc";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e8718fd7c59f97fe6bd9bb8fa76c8345";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"31ee9c2f5fa8d3dc104ff4e5519926d6";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"10e03471b6f22e77f1e4827cb319a108";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"29931f60267ccfdba4c1a0e917807f77";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ee6961e737c8ca922adcf57228d98785";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e3f3547d004a755b4640740800c92d3f";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f4652ca45aa8770831759078b963ed0b";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e6b49065c4b449010b7fd97fd027fb56";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e4f88e9882d73df7f0aa6753531973d0";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ed34ba549c7eda001556c662a7117cb9";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d795e93b67d9c2fd1770d1c7cba4b034";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c63475653899467b12e3c462d7ee733d";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"8a22f7f3b7c4049790145293384117a9";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"fa3eceb48f30bca6b92018419c2352bc";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d33a6b81b6de6066d79a77d998cc4cd8";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"585807a36700a707c83dfd469e9505f8";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"b96d3a5341d2bd62166c62a8f6b7c692";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d106a9cf8ebc0b3b0a3a06e7b472c33f";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2a4643aba4ecb90d5c461827ebb89570";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"41b54be9b455f5c9f9b03ee45a4838df";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"91438d76ab35531ffd80ba5221212993";
        key_128_256 <= 256x"cad00273120961ea0913508715d38ca9986cc8d5322f1499e8a56f31ac2c10d0";
        nonce_128_256 <= 64x"889c8ae24e3c0f2d";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 34 loop
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_128_256: process
    begin
        wait until falling_edge(clk) and ready_128_256 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"d4388a8eb4ede3e0ce0c0265eaca02e") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"6860eb601210a28dbf17183db30b1f92") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"9375275c7decd6d7e051349610713971") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"3c93e44b7f09a03a63ad916ef7b56f54") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"c5a68f88f4dcd4360045b0b7283eb767") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"7331fa985a5684940c5a7eb9599d4195") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"89ce54ef4af5157afdba01bfc0e411f2") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"67b0e75f42df412c92aea7362fc106fd") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"5f5ba9f55ba982a20dc713747a2f9047") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"9ff162c70bdfd84134572626864d0e15") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"742893522b4a37afa2a3dce0c50dfea4") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"cb24a87c8ef531f5d176c1661f071acf") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"fb419bd6fc51d34ee7957ff1989a98dc") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"e8718fd7c59f97fe6bd9bb8fa76c8345") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"31ee9c2f5fa8d3dc104ff4e5519926d6") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"10e03471b6f22e77f1e4827cb319a108") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"29931f60267ccfdba4c1a0e917807f77") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"ee6961e737c8ca922adcf57228d98785") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"e3f3547d004a755b4640740800c92d3f") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"f4652ca45aa8770831759078b963ed0b") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"e6b49065c4b449010b7fd97fd027fb56") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"e4f88e9882d73df7f0aa6753531973d0") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"ed34ba549c7eda001556c662a7117cb9") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"d795e93b67d9c2fd1770d1c7cba4b034") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"c63475653899467b12e3c462d7ee733d") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"8a22f7f3b7c4049790145293384117a9") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"fa3eceb48f30bca6b92018419c2352bc") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"d33a6b81b6de6066d79a77d998cc4cd8") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"585807a36700a707c83dfd469e9505f8") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"b96d3a5341d2bd62166c62a8f6b7c692") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 29 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"d106a9cf8ebc0b3b0a3a06e7b472c33f") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 30 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"2a4643aba4ecb90d5c461827ebb89570") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 31 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"41b54be9b455f5c9f9b03ee45a4838df") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 32 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"91438d76ab35531ffd80ba5221212993") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 33 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        wait until falling_edge(clk) and ready_128_256 = '1'; -- Calculation is triggered on rising edge and needs a bit of time.
        assert (data_out_128_256=128x"3fc18c00dc0520a487ba3b901e415c4e") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 0 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"29deb984c31277fdeb83af16e404d808") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 1 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"4a294067dc66a27b6a325333116e8a64") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 2 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"92f078b8226962278513d91e48622a67") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 3 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"88083ebc35d4cd35a08c3a0085e74250") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 4 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"a274c0d7f4a5cc36692a7bce1af55c26") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 5 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"c74f11cdbdce29ef674610eb8b279c29") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 6 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"4ad12b4c47534952c9c5fef1e76f8a76") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 7 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"a0f9c0749177b6d45f2e9167713eceb1") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 8 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"b270af551f9078d52835bcdb2347b24f") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 9 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"974fdedc66b6208761a53fdd1eda4209") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 10 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"ab12fb538f42cebe23b870f377cb1a27") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 11 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"79009c61a1d20ebc5aa3892a4c88b9d8") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 12 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"7a0a02ba37cf80256a447a90be0a5a56") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 13 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"517830328066b49bb1d792a07d25cefb") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 14 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"f6ab75bf55b2e5ca6ed0ac07e22e1b7") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 15 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"bec60ffe248f4a254cd8ef2471a8c9c6") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 16 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"9f032cdce32866d30d6a78b07eda9ab9") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 17 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"78b61daf5afb9565068a3c383739076a") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 18 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"2969326fe2d9d1de377b008641659c0") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 19 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"11035083fa999f9b86de3365d8a230de") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 20 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"afb120f414d4dad6ddfae808afd86432") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 21 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"ab4414aeecb3d561bdf0b015f305ee95") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 22 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"a8aa1e45c7cbc6201a4f7a165264961") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 23 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"ffeb5d5f00f520f49ef1c8461dbc24fd") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 24 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"b31e9be8a3ef802edf8693ce453432cd") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 25 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"3a082921e695f8baba2338fe4ae302f3") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 26 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"49b564fb92a651d7c069c54224039721") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 27 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"75fd35376f1bdd071aff71ae30f2c485") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 28 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"2b12c92c62565a955487b5c3b7626f49") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 29 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"e5aef699a5e3a7196bf52dfd54a8762b") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 30 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"7281b8a925e4979d6f6ddf79affe2554") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 31 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"862f78e125c29b6ab575bc6eeee84bcb") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 32 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        assert (data_out_128_256=128x"e90f79f835783f662114c2d650ea1324") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 33 Failed!" severity error;
        wait until falling_edge(clk); -- Calculation is triggered on rising edge and needs a bit of time.

        report "128-Bit Block, 256-Bit Key, CTR Test Done." severity note;
    end process;

end Behavioral;
