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
    signal valid_32_64: std_logic := '0';
    signal reset_32_64: std_logic := '0';
    signal data_out_32_64: UNSIGNED(32 - 1 downto 0);
    signal reset_valid_32_64: std_logic;
    signal ready_32_64: std_logic;
    signal ctr_wrap_32_64: std_logic;
    
    signal data_in_48_72: UNSIGNED(48 - 1 downto 0);
    signal key_48_72: UNSIGNED(72 - 1 downto 0);
    signal nonce_48_72: UNSIGNED(24 - 1 downto 0);
    signal valid_48_72: std_logic := '0';
    signal reset_48_72: std_logic := '0';
    signal data_out_48_72: UNSIGNED(48 - 1 downto 0);
    signal reset_valid_48_72: std_logic;
    signal ready_48_72: std_logic;
    signal ctr_wrap_48_72: std_logic;
    
    signal data_in_48_96: UNSIGNED(48 - 1 downto 0);
    signal key_48_96: UNSIGNED(96 - 1 downto 0);
    signal nonce_48_96: UNSIGNED(24 - 1 downto 0);
    signal valid_48_96: std_logic := '0';
    signal reset_48_96: std_logic := '0';
    signal data_out_48_96: UNSIGNED(48 - 1 downto 0);
    signal reset_valid_48_96: std_logic;
    signal ready_48_96: std_logic;
    signal ctr_wrap_48_96: std_logic;
    
    signal data_in_64_96: UNSIGNED(64 - 1 downto 0);
    signal key_64_96: UNSIGNED(96 - 1 downto 0);
    signal nonce_64_96: UNSIGNED(32 - 1 downto 0);
    signal valid_64_96: std_logic := '0';
    signal reset_64_96: std_logic := '0';
    signal data_out_64_96: UNSIGNED(64 - 1 downto 0);
    signal reset_valid_64_96: std_logic;
    signal ready_64_96: std_logic;
    signal ctr_wrap_64_96: std_logic;
    
    signal data_in_64_128: UNSIGNED(64 - 1 downto 0);
    signal key_64_128: UNSIGNED(128 - 1 downto 0);
    signal nonce_64_128: UNSIGNED(32 - 1 downto 0);
    signal valid_64_128: std_logic := '0';
    signal reset_64_128: std_logic := '0';
    signal data_out_64_128: UNSIGNED(64 - 1 downto 0);
    signal reset_valid_64_128: std_logic;
    signal ready_64_128: std_logic;
    signal ctr_wrap_64_128: std_logic;
    
    signal data_in_96_96: UNSIGNED(96 - 1 downto 0);
    signal key_96_96: UNSIGNED(96 - 1 downto 0);
    signal nonce_96_96: UNSIGNED(48 - 1 downto 0);
    signal valid_96_96: std_logic := '0';
    signal reset_96_96: std_logic := '0';
    signal data_out_96_96: UNSIGNED(96 - 1 downto 0);
    signal reset_valid_96_96: std_logic;
    signal ready_96_96: std_logic;
    signal ctr_wrap_96_96: std_logic;  
    
    signal data_in_96_144: UNSIGNED(96 - 1 downto 0);
    signal key_96_144: UNSIGNED(144 - 1 downto 0);
    signal nonce_96_144: UNSIGNED(48 - 1 downto 0);
    signal valid_96_144: std_logic := '0';
    signal reset_96_144: std_logic := '0';
    signal data_out_96_144: UNSIGNED(96 - 1 downto 0);
    signal reset_valid_96_144: std_logic;
    signal ready_96_144: std_logic;
    signal ctr_wrap_96_144: std_logic;
    
    signal data_in_128_128: UNSIGNED(128 - 1 downto 0);
    signal key_128_128: UNSIGNED(128 - 1 downto 0);
    signal nonce_128_128: UNSIGNED(64 - 1 downto 0);
    signal valid_128_128: std_logic := '0';
    signal reset_128_128: std_logic := '0';
    signal data_out_128_128: UNSIGNED(128 - 1 downto 0);
    signal reset_valid_128_128: std_logic;
    signal ready_128_128: std_logic;
    signal ctr_wrap_128_128: std_logic;
    
    signal data_in_128_192: UNSIGNED(128 - 1 downto 0);
    signal key_128_192: UNSIGNED(192 - 1 downto 0);
    signal nonce_128_192: UNSIGNED(64 - 1 downto 0);
    signal valid_128_192: std_logic := '0';
    signal reset_128_192: std_logic := '0';
    signal data_out_128_192: UNSIGNED(128 - 1 downto 0);
    signal reset_valid_128_192: std_logic;
    signal ready_128_192: std_logic;
    signal ctr_wrap_128_192: std_logic;
        
    signal data_in_128_256: UNSIGNED(128 - 1 downto 0);
    signal key_128_256: UNSIGNED(256 - 1 downto 0);
    signal nonce_128_256: UNSIGNED(64 - 1 downto 0);
    signal valid_128_256: std_logic := '0';
    signal reset_128_256: std_logic := '0';
    signal data_out_128_256: UNSIGNED(128 - 1 downto 0);
    signal reset_valid_128_256: std_logic;
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
        valid => valid_32_64,
        clk => clk,
        reset => reset_32_64,
        data_out => data_out_32_64,
        reset_valid => reset_valid_32_64, 
        ready => ready_32_64,
        ctr_wrap => ctr_wrap_32_64
    );
    
CTRSpeck_48_72: entity work.CTRSpeck
    generic map (48, 72)
    port map (
        data_in => data_in_48_72,
        key => key_48_72,
        nonce => nonce_48_72,
        valid => valid_48_72,
        clk => clk,
        reset => reset_48_72,
        data_out => data_out_48_72,
        reset_valid => reset_valid_48_72, 
        ready => ready_48_72,
        ctr_wrap => ctr_wrap_48_72
    );

CTRSpeck_48_96: entity work.CTRSpeck
    generic map (48, 96)
    port map (
        data_in => data_in_48_96,
        key => key_48_96,
        nonce => nonce_48_96,
        valid => valid_48_96,
        clk => clk,
        reset => reset_48_96,
        data_out => data_out_48_96,
        reset_valid => reset_valid_48_96,
        ready => ready_48_96,
        ctr_wrap => ctr_wrap_48_96
    );
    
CTRSpeck_64_96: entity work.CTRSpeck
    generic map (64, 96)
    port map (
        data_in => data_in_64_96,
        key => key_64_96,
        nonce => nonce_64_96,
        valid => valid_64_96,
        clk => clk,
        reset => reset_64_96,
        data_out => data_out_64_96,
        reset_valid => reset_valid_64_96,
        ready => ready_64_96,
        ctr_wrap => ctr_wrap_64_96
    );
        
CTRSpeck_64_128: entity work.CTRSpeck
    generic map (64, 128)
    port map (
        data_in => data_in_64_128,
        key => key_64_128,
        nonce => nonce_64_128,
        valid => valid_64_128,
        clk => clk,
        reset => reset_64_128,
        data_out => data_out_64_128,
        reset_valid => reset_valid_64_128,
        ready => ready_64_128,
        ctr_wrap => ctr_wrap_64_128
    );

CTRSpeck_96_96: entity work.CTRSpeck
    generic map (96, 96)
    port map (
        data_in => data_in_96_96,
        key => key_96_96,
        nonce => nonce_96_96,
        valid => valid_96_96,
        clk => clk,
        reset => reset_96_96,
        data_out => data_out_96_96,
        reset_valid => reset_valid_96_96,
        ready => ready_96_96,
        ctr_wrap => ctr_wrap_96_96
    );
    
CTRSpeck_96_144: entity work.CTRSpeck
    generic map (96, 144)
    port map (
        data_in => data_in_96_144,
        key => key_96_144,
        nonce => nonce_96_144,
        valid => valid_96_144,
        clk => clk,
        reset => reset_96_144,
        data_out => data_out_96_144,
        reset_valid => reset_valid_96_144,
        ready => ready_96_144,
        ctr_wrap => ctr_wrap_96_144
    );

CTRSpeck_128_128: entity work.CTRSpeck
    generic map (128, 128)
    port map (
        data_in => data_in_128_128,
        key => key_128_128,
        nonce => nonce_128_128,
        valid => valid_128_128,
        clk => clk,
        reset => reset_128_128,
        data_out => data_out_128_128,
        reset_valid => reset_valid_128_128,
        ready => ready_128_128,
        ctr_wrap => ctr_wrap_128_128
    );
    
CTRSpeck_128_192: entity work.CTRSpeck
    generic map (128, 192)
    port map (
        data_in => data_in_128_192,
        key => key_128_192,
        nonce => nonce_128_192,
        valid => valid_128_192,
        clk => clk,
        reset => reset_128_192,
        data_out => data_out_128_192,
        reset_valid => reset_valid_128_192,
        ready => ready_128_192,
        ctr_wrap => ctr_wrap_128_192
    );
        
CTRSpeck_128_256: entity work.CTRSpeck
    generic map (128, 256)
    port map (
        data_in => data_in_128_256,
        key => key_128_256,
        nonce => nonce_128_256,
        valid => valid_128_256,
        clk => clk,
        reset => reset_128_256,
        data_out => data_out_128_256,
        reset_valid => reset_valid_128_256,
        ready => ready_128_256,
        ctr_wrap => ctr_wrap_128_256
    );

tb_ctr_set_32_64: process
    begin
        -- Encryption test
        reset_32_64 <= '1';

        wait until rising_edge(clk);

        reset_32_64 <= '0';
        valid_32_64 <= '1';
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";

        data_in_32_64 <= 32x"40212ef7";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fcbd04c3";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e8e5216a";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"88561712";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fb97d435";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"b4862b21";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"cf6a659e";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9a164106";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e6f4590b";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"259f4329";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4f65d4d9";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"19488dec";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"bad640fb";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"12e0c8b2";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e61a441c";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"d9b8a714";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"af19922a";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"5487ce1e";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"78de5857";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"8f4ff31e";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"19c78df4";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"5a921187";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_32_64 <= '1';

        wait until rising_edge(clk);

        reset_32_64 <= '0';
        valid_32_64 <= '1';
        key_32_64 <= 64x"6baa9455e3e70682";
        nonce_32_64 <= 16x"8490";

        data_in_32_64 <= 32x"26358c07";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"a5aa0d1e";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"7bad82ce";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"b172b9e1";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"eeac6d47";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fc2cb7c1";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9f54e1d1";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"b9173518";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4ef48286";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e8dc27a2";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"c17ca211";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"915f5cdd";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fbe88def";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"c3979b92";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"45d8f47b";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4929a0c2";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"20dd2092";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"749559fd";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"a4f8efa2";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fe283321";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"757f9588";
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"6f4327fb";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_32_64 <= '1';

        wait until rising_edge(clk);

        reset_32_64 <= '0';
        key_32_64 <= 64x"7a1d50068d723104";
        nonce_32_64 <= 16x"855f";

        data_in_32_64 <= 32x"92e8e269";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"9b025244";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"a25b59fd";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"f87f43fd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"e8f6cf32";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"b7d6467b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"efbfc19e";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"7aaf0e89";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"88c132ad";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"ade9b2b4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9a27d858";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"8b53031d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"ae3b16ec";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"9edfa3da";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"12f175ff";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"d5fdb76a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"6d599e8";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"11ebcd49";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"1fdb8b32";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"4d125e7f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"a28f5ab0";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"6fa231e9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"3042e325";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"7795e986";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9b38fe80";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"98b33c6e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"d480865f";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"642aad48";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"9371a71f";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"429817c5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"1ea45cd6";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"91dc59ef";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"64264cd5";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"c470f0e7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"176ea1b1";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"2975d279";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"5ec17dbe";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"878b9f6b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"d576d415";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"ebe21368";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"fb0323a1";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"aa6524ab";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"1db53334";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"361524c";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_32_64 <= '1';

        wait until rising_edge(clk);

        reset_32_64 <= '0';
        key_32_64 <= 64x"7a1d50068d723104";
        nonce_32_64 <= 16x"855f";

        data_in_32_64 <= 32x"9e08d2a2";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"ae68690a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"36ebdfe5";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"eae2025e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"79f74276";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"a6208143";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"91c75bc1";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"a859890c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"4fc631b6";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"b0d9c2aa";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"f58bb53f";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"143e2e04";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"139e5f89";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"bd30291a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"845b4cb4";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"8b5885ca";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"8040d0ac";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"2284b7a4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"86c3ee5a";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"7b59051b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"957bafd5";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"9c31d9b2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"16bfe805";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"ac642b4c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"d18d8091";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"4f6fa985";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"cbff7723";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"bf9cc545";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"ad4eed7c";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"14aa451c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"81accd1b";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"98363189";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"52e656ee";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"b2d650af";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"cbaff0f3";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"28fafd04";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"93555625";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"72b8ff39";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"6bc34e64";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"dfe1b307";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"6bde3e48";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"8135d58";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_32_64 <= 32x"c23a2854";
        valid_32_64 <= '1';
        wait until rising_edge(clk);
        valid_32_64 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_32_64 <= 32x"9145de05";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_32_64: process
    begin

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"26358c07") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"a5aa0d1e") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"7bad82ce") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"b172b9e1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"eeac6d47") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"fc2cb7c1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"9f54e1d1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"b9173518") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"4ef48286") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"e8dc27a2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"c17ca211") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"915f5cdd") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"fbe88def") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"c3979b92") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"45d8f47b") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"4929a0c2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"20dd2092") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"749559fd") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"a4f8efa2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"fe283321") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"757f9588") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"6f4327fb") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"40212ef7") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"fcbd04c3") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"e8e5216a") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"88561712") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"fb97d435") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"b4862b21") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"cf6a659e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"9a164106") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"e6f4590b") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"259f4329") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"4f65d4d9") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"19488dec") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"bad640fb") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"12e0c8b2") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"e61a441c") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"d9b8a714") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"af19922a") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"5487ce1e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"78de5857") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"8f4ff31e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"19c78df4") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"5a921187") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 21 Failed!" severity error;


        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"9e08d2a2") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"36ebdfe5") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"79f74276") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"91c75bc1") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"4fc631b6") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"f58bb53f") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"139e5f89") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"845b4cb4") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"8040d0ac") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"86c3ee5a") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"957bafd5") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"16bfe805") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"d18d8091") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"cbff7723") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"ad4eed7c") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"81accd1b") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"52e656ee") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"cbaff0f3") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"93555625") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"6bc34e64") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"6bde3e48") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"c23a2854") report "32-Bit Block, 64-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"92e8e269") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"a25b59fd") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"e8f6cf32") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"efbfc19e") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"88c132ad") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"9a27d858") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"ae3b16ec") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"12f175ff") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"6d599e8") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"1fdb8b32") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"a28f5ab0") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"3042e325") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"9b38fe80") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"d480865f") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"9371a71f") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"1ea45cd6") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"64264cd5") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"176ea1b1") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"5ec17dbe") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"d576d415") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"fb0323a1") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_32_64 = '1';
        assert (data_out_32_64=32x"1db53334") report "32-Bit Block, 64-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        report "32-Bit Block, 64-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_48_72: process
    begin
        -- Encryption test
        reset_48_72 <= '1';

        wait until rising_edge(clk);

        reset_48_72 <= '0';
        valid_48_72 <= '1';
        key_48_72 <= 72x"e42a69acc70bf9c0ef";
        nonce_48_72 <= 24x"20b5b4";

        data_in_48_72 <= 48x"df82b9bdee2d";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"fca055362169";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"779403c54c71";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"f3158c0c66dd";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4d52adb328cb";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"50f0fc2b6ae0";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"8d7400de59f5";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"3a8987936a9";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"8be5b7a28e0a";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"9a815bc137";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"8693faf1501b";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"acfebb4bd29e";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"17c18741ae91";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"190865159cb0";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"7c5230c1fb6a";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"9bbd750d1e70";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"f81ba636425c";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"dfa7c6ed32d1";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"f2f64d6b234f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"b044284a47ac";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"b99fa7ff8bf";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"19a5711b2ea6";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_48_72 <= '1';

        wait until rising_edge(clk);

        reset_48_72 <= '0';
        valid_48_72 <= '1';
        key_48_72 <= 72x"e42a69acc70bf9c0ef";
        nonce_48_72 <= 24x"20b5b4";

        data_in_48_72 <= 48x"13d59a8526";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"26cb6286a70c";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"2cec310001df";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"866478043189";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"538f73ca9c43";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"88e8150309a9";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"17e83313ece8";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"dff8a8293b66";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"a7b92911473b";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"8c0a726a19f6";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"5a5c2be94f32";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"be8fa5911e94";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d80f0dbe9dd";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"2dffa2c0d863";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"7d230874f35f";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4cbdb42991b8";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"34da6f7663c0";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"c833afa36873";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"dc68e5b2377d";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"3b1cf8d9a56d";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"96622d955d16";
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"43041cc72c94";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_48_72 <= '1';

        wait until rising_edge(clk);

        reset_48_72 <= '0';
        key_48_72 <= 72x"cbec3aa314da9bb017";
        nonce_48_72 <= 24x"29a61b";

        data_in_48_72 <= 48x"cf0dd974c146";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"151809215f4f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d8ab0b300ac0";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"53e54505f4f6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"64cebfc74ca9";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"943d955d0e77";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"b38a05fbf611";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"ca225c646036";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"cb879b8b71a1";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"96392130260c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"7e969cf3a7c5";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"f4c41d69d9fc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"95c9b65d1226";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"7ababb0378eb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"e7180322a4e6";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"18b5ef0a81ed";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4b3b756b0715";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"5bf24ed13553";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"6f790959a3e0";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"2448ba8982dd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"c6125f58d5b5";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"ce6c4d7bd307";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"89b5b368df14";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"a833d5e73e3f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"45792da44da1";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"d4564c9a0ae1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"6025f0ae3535";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"32e41bd09448";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4d53964ddb77";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"f2b07b2e1b82";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"247145f4a81";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"aff3cff4c56b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"74652371ea2c";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"f54a1fd3c017";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"4578bab326a9";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"da627f6b8793";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"2017555a4085";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"9a9309aedbd0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"ca24be4d5667";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"c04a90823eda";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"941c5e00ea6d";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"21b516408169";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"17fd3736b7ef";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"2b59ceca2ee3";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_48_72 <= '1';

        wait until rising_edge(clk);

        reset_48_72 <= '0';
        key_48_72 <= 72x"cbec3aa314da9bb017";
        nonce_48_72 <= 24x"29a61b";

        data_in_48_72 <= 48x"168adac76777";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"1f4f38974df5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"6debc70481b5";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"40562830869";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"c859b72a445d";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"c9a1191b8adf";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"e3fa76739b56";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"e5a74a31b243";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"265164ba7475";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"fa2ceb8f2056";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"30c5b91b2269";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"d898379deda1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"78d25cd16b0";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"bc95156af458";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"bad737a44b48";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"8596ffc573d5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"89b691955e66";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"dcc92aa50f4e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"a4d5a90f1a29";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"b78f31234efe";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"88989e6a2c6b";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"20b11d7173e5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"9243c2ebe61";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"e739869bdbd2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"b8febacc61f8";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"3ce133a1d1c2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"1d2bc5f00132";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"cbc07f411fed";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"9f5f54b93bc6";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"6a1a41a8a6e1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"2c6c106ae0d6";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"158ea41865bf";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"14768a8e5586";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"6e89cc249558";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"fe221e309db1";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"4aee9f982188";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"a3ea3cd071da";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"655c1ac902ee";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"f25e033f86c6";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"c18d755a3ac1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"d88adbec315d";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"4d7bd3b564b0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_72 <= 48x"64d66c697a96";
        valid_48_72 <= '1';
        wait until rising_edge(clk);
        valid_48_72 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_72 <= 48x"4bfb7ce71b48";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 23 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_48_72: process
    begin

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"13d59a8526") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"26cb6286a70c") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"2cec310001df") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"866478043189") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"538f73ca9c43") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"88e8150309a9") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"17e83313ece8") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"dff8a8293b66") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"a7b92911473b") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"8c0a726a19f6") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"5a5c2be94f32") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"be8fa5911e94") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"d80f0dbe9dd") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"2dffa2c0d863") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"7d230874f35f") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"4cbdb42991b8") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"34da6f7663c0") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"c833afa36873") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"dc68e5b2377d") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"3b1cf8d9a56d") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"96622d955d16") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"43041cc72c94") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"df82b9bdee2d") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"fca055362169") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"779403c54c71") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"f3158c0c66dd") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"4d52adb328cb") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"50f0fc2b6ae0") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"8d7400de59f5") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"3a8987936a9") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"8be5b7a28e0a") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"9a815bc137") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"8693faf1501b") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"acfebb4bd29e") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"17c18741ae91") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"190865159cb0") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"7c5230c1fb6a") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"9bbd750d1e70") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"f81ba636425c") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"dfa7c6ed32d1") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"f2f64d6b234f") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"b044284a47ac") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"b99fa7ff8bf") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"19a5711b2ea6") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 21 Failed!" severity error;


        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"168adac76777") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"6debc70481b5") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"c859b72a445d") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"e3fa76739b56") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"265164ba7475") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"30c5b91b2269") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"78d25cd16b0") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"bad737a44b48") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"89b691955e66") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"a4d5a90f1a29") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"88989e6a2c6b") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"9243c2ebe61") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"b8febacc61f8") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"1d2bc5f00132") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"9f5f54b93bc6") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"2c6c106ae0d6") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"14768a8e5586") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"fe221e309db1") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"a3ea3cd071da") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"f25e033f86c6") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"d88adbec315d") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"64d66c697a96") report "48-Bit Block, 72-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"cf0dd974c146") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"d8ab0b300ac0") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"64cebfc74ca9") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"b38a05fbf611") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"cb879b8b71a1") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"7e969cf3a7c5") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"95c9b65d1226") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"e7180322a4e6") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"4b3b756b0715") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"6f790959a3e0") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"c6125f58d5b5") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"89b5b368df14") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"45792da44da1") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"6025f0ae3535") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"4d53964ddb77") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"247145f4a81") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"74652371ea2c") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"4578bab326a9") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"2017555a4085") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"ca24be4d5667") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"941c5e00ea6d") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_72 = '1';
        assert (data_out_48_72=48x"17fd3736b7ef") report "48-Bit Block, 72-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        report "48-Bit Block, 72-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_48_96: process
    begin
        -- Encryption test
        reset_48_96 <= '1';

        wait until rising_edge(clk);

        reset_48_96 <= '0';
        valid_48_96 <= '1';
        key_48_96 <= 96x"856f3d95e0ae1a1b6c596216";
        nonce_48_96 <= 24x"a51984";

        data_in_48_96 <= 48x"7da2000fc63d";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"2e9583eabda1";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"6e984d6cd782";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"91fcfe8881c1";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"e5ca4124405b";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"10cc8711552a";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"51e17e56ac3d";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"4312ece2dc21";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"886ff164f9d8";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"4d849ec5d334";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"7babc5c14262";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"62584ab36877";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"d0a0cf5e9ea3";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"ff030b86238";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"956f29ee7f3d";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"ef7e85eca417";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"f042209818d1";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"497e9f1a3d2b";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"fe38babd4745";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"5582a3bdd476";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"dff70e370526";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"932f5b6f11d";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"d5f27b38785b";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 24 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_48_96 <= '1';

        wait until rising_edge(clk);

        reset_48_96 <= '0';
        valid_48_96 <= '1';
        key_48_96 <= 96x"856f3d95e0ae1a1b6c596216";
        nonce_48_96 <= 24x"a51984";

        data_in_48_96 <= 48x"ff7222b13819";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"20b1510d3437";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8e478c2fb968";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"a1b3ae9e8c64";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"759183ca5b2d";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"82f179d00832";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"fe4564d32f36";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"5b95f998eada";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"e56d8f12de3a";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"58561050a2ac";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"5085ec80fc02";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"82f86530821a";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"f262449a9af3";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"7d1a8e576edd";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"72e752fb37c2";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"eb399e97357d";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"c1b3e632e242";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"90d6922ba974";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8af5c55e3787";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"541ef4d474b0";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"9495cb77c27b";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"47deed165d02";
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"38a38ca17740";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 24 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_48_96 <= '1';

        wait until rising_edge(clk);

        reset_48_96 <= '0';
        key_48_96 <= 96x"7579501a62fda854775e0ec3";
        nonce_48_96 <= 24x"33f540";

        data_in_48_96 <= 48x"5d51349747a";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"d4ce1ad1daaa";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"b6d9611f4dd";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"32cb101bb5fa";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"9a38e6e4b8df";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"fb8f45da406";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"a3c2c6fef2d";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"e4b8ca9571e4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"ff927c7550f2";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"f6d6ac1ca75";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"e6ac9d8a4160";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"283640a978bf";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"50bf06d2ed7c";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"24025a3da367";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8522dc4ef1dd";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"b7f01f12a0e9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"cf80aaa07996";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"f0ab1182d23";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"926146de91ba";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"b21d586f1721";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"6cc9e0397e67";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"51a2d8b5b41";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"3acaaf82374a";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"241a5da53b38";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"643217ee0eb0";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"6a7c24aeba79";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"d1c3d1bcc6be";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"68da00d3d1af";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"90e7e27ac8e9";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"3f12e6a1a40b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"a09f1aede386";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"3adbf7b68ae";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"2109c7867a38";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"bcfe4b1347f6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"b2d10e3d809e";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"c9eb080e003";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"66f28611f583";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"5fbd2452bc39";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"81d1bf066b8c";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"398b743c7e9d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"575d4e28e674";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"b05b7a089ca8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"1d0ab994f20b";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"42a4421aa15e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"da18254bf7ae";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"b97735475c5e";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 24 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_48_96 <= '1';

        wait until rising_edge(clk);

        reset_48_96 <= '0';
        key_48_96 <= 96x"7579501a62fda854775e0ec3";
        nonce_48_96 <= 24x"33f540";

        data_in_48_96 <= 48x"acfe482113b7";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"f25d55c36c3d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"941f7194f78";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"95d3f5fe0213";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8d39210e1b51";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"5e3b53b53b92";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"6b58eb4a83fe";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"348514afe646";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"d7457978f92a";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"50144ec985ff";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"6c7925b39cd3";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"a1bc390a9016";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"73adaba6512e";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"7c5582221345";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"c81721f07020";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"95052f16fb50";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"b1447c942ab7";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"d6ee5f59aa2c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"dee93810fba5";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"17aea9c72e7b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"8b7446ecb175";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"43b4dc68d4fd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"748193f6e761";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"a8599e8c828";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"6644d495ac72";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"27e564d02759";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"6fb796958aa9";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"257bb3c161c3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"dee4c37593c8";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"d72821cc14b3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"7fca55242012";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"48d9ed28508d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"cf60f51fb96a";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"d8299750ca7e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"c65560f44be2";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"2b4a5ac4b6c7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"92899d4370a0";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"e3be3f80c31f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"814cda651591";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"bd0fa1fdcdf1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"f81f0b83ffc0";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"1d9f877a2133";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"b3ce25b6a314";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"d137605dd4d6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_48_96 <= 48x"ffa8305581a2";
        valid_48_96 <= '1';
        wait until rising_edge(clk);
        valid_48_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_48_96 <= 48x"d59e02284fd9";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 24 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_48_96: process
    begin

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"ff7222b13819") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"20b1510d3437") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"8e478c2fb968") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"a1b3ae9e8c64") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"759183ca5b2d") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"82f179d00832") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"fe4564d32f36") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"5b95f998eada") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"e56d8f12de3a") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"58561050a2ac") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"5085ec80fc02") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"82f86530821a") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"f262449a9af3") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"7d1a8e576edd") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"72e752fb37c2") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"eb399e97357d") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"c1b3e632e242") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"90d6922ba974") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"8af5c55e3787") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"541ef4d474b0") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"9495cb77c27b") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"47deed165d02") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"38a38ca17740") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"7da2000fc63d") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"2e9583eabda1") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"6e984d6cd782") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"91fcfe8881c1") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"e5ca4124405b") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"10cc8711552a") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"51e17e56ac3d") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"4312ece2dc21") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"886ff164f9d8") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"4d849ec5d334") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"7babc5c14262") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"62584ab36877") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"d0a0cf5e9ea3") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"ff030b86238") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"956f29ee7f3d") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"ef7e85eca417") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"f042209818d1") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"497e9f1a3d2b") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"fe38babd4745") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"5582a3bdd476") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"dff70e370526") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"932f5b6f11d") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"d5f27b38785b") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 22 Failed!" severity error;


        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"acfe482113b7") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"941f7194f78") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"8d39210e1b51") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"6b58eb4a83fe") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"d7457978f92a") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"6c7925b39cd3") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"73adaba6512e") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"c81721f07020") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"b1447c942ab7") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"dee93810fba5") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"8b7446ecb175") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"748193f6e761") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"6644d495ac72") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"6fb796958aa9") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"dee4c37593c8") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"7fca55242012") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"cf60f51fb96a") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"c65560f44be2") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"92899d4370a0") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"814cda651591") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"f81f0b83ffc0") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"b3ce25b6a314") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"ffa8305581a2") report "48-Bit Block, 96-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"5d51349747a") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"b6d9611f4dd") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"9a38e6e4b8df") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"a3c2c6fef2d") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"ff927c7550f2") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"e6ac9d8a4160") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"50bf06d2ed7c") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"8522dc4ef1dd") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"cf80aaa07996") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"926146de91ba") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"6cc9e0397e67") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"3acaaf82374a") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"643217ee0eb0") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"d1c3d1bcc6be") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"90e7e27ac8e9") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"a09f1aede386") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"2109c7867a38") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"b2d10e3d809e") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"66f28611f583") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"81d1bf066b8c") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"575d4e28e674") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"1d0ab994f20b") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_48_96 = '1';
        assert (data_out_48_96=48x"da18254bf7ae") report "48-Bit Block, 96-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        report "48-Bit Block, 96-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_64_96: process
    begin
        -- Encryption test
        reset_64_96 <= '1';

        wait until rising_edge(clk);

        reset_64_96 <= '0';
        valid_64_96 <= '1';
        key_64_96 <= 96x"e6b920daba6a098ff642c8f3";
        nonce_64_96 <= 32x"70f8dd99";

        data_in_64_96 <= 64x"4d18c103a100ed14";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"9bf1f1d18b92c247";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6c98f73d27fe1b4b";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c058a332b4cfafa8";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"17b18e6e78aff58e";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"7f67ee1aad9d1f42";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f5feba5ec2953f51";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"8b32992a3b7c1f9a";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"67c21355c3121af6";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a1cf0d1d47b3df41";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"588d91dfbe86a8e";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4523dbbb1eeed219";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"ab2212c9e23b580e";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"1098240a614be3";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"65ff6adc41aef3f7";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e3fbdbda86ae9d5c";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b5c03f6f94e4cc44";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"71d04b0f656fa7e6";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"bf1df6871a1ec042";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5a9414b840aaec7a";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"df0d6301488cac4e";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"ac2c10d0c15648ff";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"322f1499e8a56f31";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"15d38ca9986cc8d5";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"120961ea09135087";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4332559dcad00273";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 27 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_64_96 <= '1';

        wait until rising_edge(clk);

        reset_64_96 <= '0';
        valid_64_96 <= '1';
        key_64_96 <= 96x"e6b920daba6a098ff642c8f3";
        nonce_64_96 <= 32x"70f8dd99";

        data_in_64_96 <= 64x"1b690e99e8fab421";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"bf74f32febd13c59";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e2d9bc04e0af7dbd";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"78d480a1b818cf56";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6d37374f31c17d6a";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"52febbebb78be9f1";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"15f39be4274a8247";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a487c1b3ce450f6d";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"9e5e51477322fc9b";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6940a6f1103b0d66";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"644ddef7ffae5514";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"af8a723473fcabcf";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"98b461fa4692956c";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"640c81b32022d90e";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e889710a26507100";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"8847d7b65622fd0d";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e2ec38db68dfb6e7";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b47273980d0d1e5f";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"67bf6ba024d73b58";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f9b0be01237fb3d";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"3530e69d399f2ea";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4664e8e2d4cc8e37";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"10fb66befb604e12";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c9ee58a56ab610af";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"15e8dfb23bb33906";
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"cc5972351e33a37b";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 27 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_64_96 <= '1';

        wait until rising_edge(clk);

        reset_64_96 <= '0';
        key_64_96 <= 96x"116e8a6429deb984c31277fd";
        nonce_64_96 <= 32x"dc66a27b";

        data_in_64_96 <= 64x"8513d91e48622a67";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"3739076a9f032cdc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"92f078b822696227";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"78b61daf5afb9565";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a08c3a0085e74250";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"fe2d9d1de377b008";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"88083ebc35d4cd35";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"1a4f7a165264961";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"692a7bce1af55c26";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"ffeb5d5f00f520f4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a274c0d7f4a5cc36";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"49b564fb92a651d7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"674610eb8b279c29";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"6f1bdd071aff71ae";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c74f11cdbdce29ef";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"5487b5c3b7626f49";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c9c5fef1e76f8a76";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"54a8762b2b12c92c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4ad12b4c47534952";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"25e4979d6f6ddf79";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5f2e9167713eceb1";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"b575bc6eeee84bcb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a0f9c0749177b6d4";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"50ea1324862f78e1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"2835bcdb2347b24f";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"e90f79f835783f66";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b270af551f9078d5";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"638d521afbc59e92";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"61a53fdd1eda4209";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"7df0fe6bce8d75f2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"974fdedc66b62087";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"e7e3f52c0cbf404d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"23b870f377cb1a27";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"defa786415ac15c3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"ab12fb538f42cebe";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"ad7027cfa358cb1d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"5aa3892a4c88b9d8";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"9c5c11eb3baa17f9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"79009c61a1d20ebc";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"5a62ddc4e2091f49";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6a447a90be0a5a56";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"7d7de1f57460d20d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"7a0a02ba37cf8025";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"79c45c38b440ffe0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b1d792a07d25cefb";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"441030ae56525ce0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"517830328066b49b";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"d7422560b36f3cd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a6ed0ac07e22e1b7";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"fdec23598ca3b4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f6ab75bf55b2e5c";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"1d34690a795ac54";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 27 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_64_96 <= '1';

        wait until rising_edge(clk);

        reset_64_96 <= '0';
        key_64_96 <= 96x"116e8a6429deb984c31277fd";
        nonce_64_96 <= 32x"dc66a27b";

        data_in_64_96 <= 64x"83006e2a81689cd5";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"c963d148104dff66";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"2502c7426d23791c";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"3891aef5ebe0572c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c24899c68421a82e";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"cb775e2415eb3a3d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"62d91d250918053d";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"8930d17952ab793f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"3978a67c91211f09";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"533c9a31e4bacd78";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"3077100040712bab";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"85a1282a0761585b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"6553e15bc62430ad";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"5e6364c630ac79dd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b32644b76406fba7";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"bc5074acbaa172ac";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"17d3f8f9436723ac";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"413008796279d944";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"85f724b80323c2ef";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"b648acd3d6e2667";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b5e47dfb74e51cee";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"8d4e2753ef26a5b7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"46fa3424145ab674";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"75ff93f0025b7c5f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"b01851aac803c93";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"702dc88ab97fb3bb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"1c2fea625d3e5492";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"cf1accc1eaca3811";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"59f6cb1d0e50cba8";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"7e5b637dfa98c115";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"c9cd2cab55bc1143";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"1e3d59d070aaf525";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"e8b26c84ded00b48";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"3dbba3af14dbad22";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"a68da7f0e52c1f84";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"c3f3f74dd3861b58";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"981b6ef4de55d8a4";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"d16903f213bfa9fe";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"865db44c6d190620";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"64fc0dbad44f85e7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f2d061e745b1430c";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"2e2dffdff57b8a92";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"2f1b7ac8aaf2fac4";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"38553ac87d718591";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"f3ad153b40c2779e";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"deffed7ad7285256";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"4891c9c6c2c3a25c";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"5a23754bef38d426";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"8919a29034854722";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"6f51ea78fea2a33a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_96 <= 64x"8078161eeb8eed00";
        valid_64_96 <= '1';
        wait until rising_edge(clk);
        valid_64_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_96 <= 64x"e64ddd918e9b185e";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 27 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_64_96: process
    begin

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"1b690e99e8fab421") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"bf74f32febd13c59") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"e2d9bc04e0af7dbd") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"78d480a1b818cf56") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"6d37374f31c17d6a") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"52febbebb78be9f1") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"15f39be4274a8247") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a487c1b3ce450f6d") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"9e5e51477322fc9b") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"6940a6f1103b0d66") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"644ddef7ffae5514") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"af8a723473fcabcf") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"98b461fa4692956c") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"640c81b32022d90e") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"e889710a26507100") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"8847d7b65622fd0d") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"e2ec38db68dfb6e7") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b47273980d0d1e5f") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"67bf6ba024d73b58") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"f9b0be01237fb3d") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"3530e69d399f2ea") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"4664e8e2d4cc8e37") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"10fb66befb604e12") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"c9ee58a56ab610af") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"15e8dfb23bb33906") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"cc5972351e33a37b") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"4d18c103a100ed14") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"9bf1f1d18b92c247") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"6c98f73d27fe1b4b") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"c058a332b4cfafa8") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"17b18e6e78aff58e") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"7f67ee1aad9d1f42") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"f5feba5ec2953f51") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"8b32992a3b7c1f9a") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"67c21355c3121af6") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a1cf0d1d47b3df41") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"588d91dfbe86a8e") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"4523dbbb1eeed219") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"ab2212c9e23b580e") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"1098240a614be3") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"65ff6adc41aef3f7") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"e3fbdbda86ae9d5c") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b5c03f6f94e4cc44") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"71d04b0f656fa7e6") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"bf1df6871a1ec042") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"5a9414b840aaec7a") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"df0d6301488cac4e") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"ac2c10d0c15648ff") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"322f1499e8a56f31") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"15d38ca9986cc8d5") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"120961ea09135087") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"4332559dcad00273") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 25 Failed!" severity error;


        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"83006e2a81689cd5") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"2502c7426d23791c") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"c24899c68421a82e") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"62d91d250918053d") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"3978a67c91211f09") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"3077100040712bab") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"6553e15bc62430ad") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b32644b76406fba7") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"17d3f8f9436723ac") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"85f724b80323c2ef") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b5e47dfb74e51cee") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"46fa3424145ab674") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b01851aac803c93") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"1c2fea625d3e5492") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"59f6cb1d0e50cba8") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"c9cd2cab55bc1143") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"e8b26c84ded00b48") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a68da7f0e52c1f84") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"981b6ef4de55d8a4") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"865db44c6d190620") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"f2d061e745b1430c") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"2f1b7ac8aaf2fac4") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"f3ad153b40c2779e") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"4891c9c6c2c3a25c") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"8919a29034854722") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"8078161eeb8eed00") report "64-Bit Block, 96-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"8513d91e48622a67") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"92f078b822696227") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a08c3a0085e74250") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"88083ebc35d4cd35") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"692a7bce1af55c26") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a274c0d7f4a5cc36") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"674610eb8b279c29") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"c74f11cdbdce29ef") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"c9c5fef1e76f8a76") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"4ad12b4c47534952") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"5f2e9167713eceb1") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a0f9c0749177b6d4") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"2835bcdb2347b24f") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b270af551f9078d5") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"61a53fdd1eda4209") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"974fdedc66b62087") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"23b870f377cb1a27") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"ab12fb538f42cebe") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"5aa3892a4c88b9d8") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"79009c61a1d20ebc") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"6a447a90be0a5a56") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"7a0a02ba37cf8025") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"b1d792a07d25cefb") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"517830328066b49b") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"a6ed0ac07e22e1b7") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_96 = '1';
        assert (data_out_64_96=64x"f6ab75bf55b2e5c") report "64-Bit Block, 96-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        report "64-Bit Block, 96-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_64_128: process
    begin
        -- Encryption test
        reset_64_128 <= '1';

        wait until rising_edge(clk);

        reset_64_128 <= '0';
        valid_64_128 <= '1';
        key_64_128 <= 128x"42d01ba3a2652c9e89421c6d764ab510";
        nonce_64_128 <= 32x"3b56735e";

        data_in_64_128 <= 64x"9d683a9e1e651ac1";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"b63f83c6c89309e9";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"2c2df3c219518f87";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"6a27241fbb9e5a02";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"37d316a43fafa217";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"e139d15d48d8b9ef";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ff4533febc6ff6ac";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"1a6009ea8dce886";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"89181ba3bdee9231";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"6da313e783e9973b";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"cbdc014dbedb42e";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"627b585f1f2de275";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"45c190a8a52ba0ce";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"f89d3fda1e454241";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"908e0372bcbe9a42";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"3ac49efa5be12d09";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"b76fc5b2acc512df";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"8bf06f64b4178592";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"483c1a4ea91da2cd";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"bd6817b638b80611";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"e6cd3595d4f0d65d";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"1095e4973d798f0b";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4eb9876884a5b1c3";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"53ca8c05acb5959f";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"5f89d54d3bcd6aec";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"7af2f402a0e624f1";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"9501e917496dc27b";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 28 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_64_128 <= '1';

        wait until rising_edge(clk);

        reset_64_128 <= '0';
        valid_64_128 <= '1';
        key_64_128 <= 128x"42d01ba3a2652c9e89421c6d764ab510";
        nonce_64_128 <= 32x"3b56735e";

        data_in_64_128 <= 64x"84c3e22820ca2658";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4e1218a5697b956f";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"70359c995579ebd1";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"515c1d9a9becd8ac";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"1b6405419eb21a44";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"45168d61ebef7736";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"d799abd4afd6cd6a";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"e02d8006b7b0740";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"288e89ec891229f8";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"6f37c5b242bf9d9";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"68171afb91fc90dd";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a3d16ef1562022e7";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a7ef806f388f89df";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"afbfc863ce5d23f5";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"448d403378ed73de";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"b519a05d1411f0a8";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"27861cc8e436000f";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ef487053838363f6";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"2da758c95ef16fe5";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"2a5a2915f188fe48";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"7866a51e140de7d1";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"405ca9c40fa52077";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"67f8119731626fea";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"61936f0b6feb2b04";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4ec1a637173930da";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"db60ab6bf1bcbbfd";
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"c80c60eb5e6d6c8b";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 28 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_64_128 <= '1';

        wait until rising_edge(clk);

        reset_64_128 <= '0';
        key_64_128 <= 128x"a283453695decd6e5df2e07353f04099";
        nonce_64_128 <= 32x"cfdef303";

        data_in_64_128 <= 64x"bcc4616df40d2a37";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"b82b61c3dd0c866";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"8bc88bcf7b1d4049";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"6c32faffa9fa4ea6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"b4480761505e9c9b";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"ec071cf1e47638ec";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"142a6c95d9082a42";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"6f6a219672ef7dce";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"232f8c5b425832c0";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"4fdc13515ba830dc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"66dfeb1e9ab3cc27";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"61f68c6e689c0559";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"30e9be17b4134208";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"e413961f68c6dd5e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"5100f186d25ab049";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"2bdb572063eaa07f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4aaeb212c90ded29";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"1463c5f825ee54ab";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"f19b43da6253dfe3";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"2d20481ad216ad53";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"356af7370f2670d2";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"e575ae93ce749e8a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"50ae265209cd3bdf";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"8fb87c76af044a8d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"bf401e04b9f94ec6";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"1417d4f9b7c144fb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"3fe65f90f631681e";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"b5c99b49751f7e54";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"dceb201357d9af8d";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"9a1ab3579d6c84af";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ab1e679470f2297a";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"bb937826bcee9d29";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a8e6a772b9cde60c";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"94c0230e3b4df81";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"39d5b552a867a0f0";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"5bbdd1f416f14aad";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"581ba30742965873";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"269b6c3babf0f4bd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"298e9a79abecfc0b";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"81e774de3c740119";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"45892c14e0e15d3";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"566ff3ec679b29e8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"92d6ff735b3a4595";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"3c8e1046480fdc0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ee5144d8a1d8b42";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"e689e5e887c47eb8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a1645f58bb78eb2d";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"8d56206d920c3de9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"5a79b46a26b61b06";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"afd4fc7bef208346";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"7db931ce05a0f421";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"675e0c521eb95739";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"fb2de1ea0b976c2";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"d18533e7efa2faf";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 28 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_64_128 <= '1';

        wait until rising_edge(clk);

        reset_64_128 <= '0';
        key_64_128 <= 128x"a283453695decd6e5df2e07353f04099";
        nonce_64_128 <= 32x"cfdef303";

        data_in_64_128 <= 64x"ceca7f6acb4c886d";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"eddb0263c6a2894d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"2b42a45f7097cb2b";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"571c9d788429aeae";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"cc3481807d1a92dd";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"357f0a64402988fd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"f1475e2555b7aced";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"fb52451d90e7e1a1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a93555731e52f2e6";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"e02a35e9ae6b4c8e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"da6275e602b589a1";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"272eaa36e642965c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"78df55c10122f370";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"909b471c0d1f0a7f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a62127e9323aa068";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"583678eef3ca5f64";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"38cc5d2b23d23bbe";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"a02ebb764a8b77da";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"c56636c5723fc26c";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"99c7abea6756264d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"61643e73431878e2";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"2b8771dffccae6b8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"9e858753641050cd";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"711fa10a0b2975c6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a9d02826c83ee6cd";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"edec31ef57627626";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"6a8cd6dc3414bd6e";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"b8bc6621f2d7fe55";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"af3835c4262859af";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"6c835975efa2ce12";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"4610973efcc626e";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"d48457dff3254f2d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"ca37f023b9536d0f";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"2b7bde99878f40ed";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"71fb9fb4b5c42e24";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"a3af11d0a8ab29f1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"189054637d7b1c5d";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"9ae445e08b1dc2f8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"f381d2b9584eb80d";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"6f446806c1378e75";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"479046c3ced30764";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"48f3531c4fb7c3bb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"b690aba4ceedbd5c";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"b7c97da8d1db32f8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"a99690fd85813d4c";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"8df7a26786fadb0e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"3341075ddb059b9a";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"579e9a46fd768f63";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"e9c7df9b5e14561d";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"c857d8c3b4a06976";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"893064b5d6710ce6";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"62574c5a903374bf";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_64_128 <= 64x"cd1a354432ff7cdf";
        valid_64_128 <= '1';
        wait until rising_edge(clk);
        valid_64_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_64_128 <= 64x"f313c0b076d142d0";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 28 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_64_128: process
    begin

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"84c3e22820ca2658") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"4e1218a5697b956f") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"70359c995579ebd1") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"515c1d9a9becd8ac") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"1b6405419eb21a44") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"45168d61ebef7736") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"d799abd4afd6cd6a") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"e02d8006b7b0740") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"288e89ec891229f8") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"6f37c5b242bf9d9") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"68171afb91fc90dd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a3d16ef1562022e7") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a7ef806f388f89df") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"afbfc863ce5d23f5") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"448d403378ed73de") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"b519a05d1411f0a8") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"27861cc8e436000f") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"ef487053838363f6") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"2da758c95ef16fe5") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"2a5a2915f188fe48") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"7866a51e140de7d1") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"405ca9c40fa52077") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"67f8119731626fea") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"61936f0b6feb2b04") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"4ec1a637173930da") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"db60ab6bf1bcbbfd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"c80c60eb5e6d6c8b") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"9d683a9e1e651ac1") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"b63f83c6c89309e9") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"2c2df3c219518f87") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"6a27241fbb9e5a02") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"37d316a43fafa217") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"e139d15d48d8b9ef") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"ff4533febc6ff6ac") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"1a6009ea8dce886") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"89181ba3bdee9231") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"6da313e783e9973b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"cbdc014dbedb42e") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"627b585f1f2de275") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"45c190a8a52ba0ce") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"f89d3fda1e454241") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"908e0372bcbe9a42") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"3ac49efa5be12d09") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"b76fc5b2acc512df") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"8bf06f64b4178592") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"483c1a4ea91da2cd") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"bd6817b638b80611") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"e6cd3595d4f0d65d") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"1095e4973d798f0b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"4eb9876884a5b1c3") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"53ca8c05acb5959f") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"5f89d54d3bcd6aec") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"7af2f402a0e624f1") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"9501e917496dc27b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 26 Failed!" severity error;


        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"ceca7f6acb4c886d") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"2b42a45f7097cb2b") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"cc3481807d1a92dd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"f1475e2555b7aced") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a93555731e52f2e6") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"da6275e602b589a1") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"78df55c10122f370") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a62127e9323aa068") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"38cc5d2b23d23bbe") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"c56636c5723fc26c") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"61643e73431878e2") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"9e858753641050cd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a9d02826c83ee6cd") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"6a8cd6dc3414bd6e") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"af3835c4262859af") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"4610973efcc626e") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"ca37f023b9536d0f") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"71fb9fb4b5c42e24") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"189054637d7b1c5d") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"f381d2b9584eb80d") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"479046c3ced30764") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"b690aba4ceedbd5c") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a99690fd85813d4c") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"3341075ddb059b9a") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"e9c7df9b5e14561d") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"893064b5d6710ce6") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"cd1a354432ff7cdf") report "64-Bit Block, 128-Bit Key, CTR Encryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"bcc4616df40d2a37") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"8bc88bcf7b1d4049") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"b4480761505e9c9b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"142a6c95d9082a42") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"232f8c5b425832c0") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"66dfeb1e9ab3cc27") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"30e9be17b4134208") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"5100f186d25ab049") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"4aaeb212c90ded29") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"f19b43da6253dfe3") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"356af7370f2670d2") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"50ae265209cd3bdf") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"bf401e04b9f94ec6") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"3fe65f90f631681e") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"dceb201357d9af8d") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"ab1e679470f2297a") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a8e6a772b9cde60c") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"39d5b552a867a0f0") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"581ba30742965873") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"298e9a79abecfc0b") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"45892c14e0e15d3") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"92d6ff735b3a4595") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"ee5144d8a1d8b42") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"a1645f58bb78eb2d") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"5a79b46a26b61b06") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"7db931ce05a0f421") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_64_128 = '1';
        assert (data_out_64_128=64x"fb2de1ea0b976c2") report "64-Bit Block, 128-Bit Key, CTR Decryption Test 26 With Pause Failed!" severity error;

        report "64-Bit Block, 128-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_96_96: process
    begin
        -- Encryption test
        reset_96_96 <= '1';

        wait until rising_edge(clk);

        reset_96_96 <= '0';
        valid_96_96 <= '1';
        key_96_96 <= 96x"40464c0e65a3ae43a72017d";
        nonce_96_96 <= 48x"5129f0fcccc6";

        data_in_96_96 <= 96x"a1832fdb31cb5e8eae2562ca";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b3390a6ea0b87e455abec113";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"bb1d867704e6748a7f3ab7dc";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9251ad083fcb34fabc39e1b3";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4643d7053df8eeefe44a01f6";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c2112edaf1e7ea9b2f6570d7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"13f2dc866b83f00fed2ee36f";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"3c9a923672bbe7b392b95731";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"731c877ab6bca2a2be792965";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"e51c0cdb824734dfdd1f8e30";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b47a5dcecf709452ce8c037e";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"30331476f53fc3dd19b53b7f";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"ec6e61bd70c455a92a1bc112";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"6d3f4b37ed9081c110b2e6e5";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"f0bd7405650dd400a27ee80d";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"6fed6cc540b000a44598244b";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c602bd20c1fa924ee1bccfb2";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"53e836639c14940d5b2d81cc";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"7b6e28f4e98ce2517337a7c";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c334f55802cee5817e15aa2c";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c329870a33e9e55e402492a3";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"6f84439262f9dbb265dcac6c";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a02a1b21a2a7d0fcc683ad33";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b27516ea63a6aae9ac4ebce0";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9d5b64fd2928f4be1514a0d";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"5ac5f4f0771ec087952b1ee1";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2076d932919c21edd47133e7";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4741ee56b5e2834d907d8532";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 29 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_96_96 <= '1';

        wait until rising_edge(clk);

        reset_96_96 <= '0';
        valid_96_96 <= '1';
        key_96_96 <= 96x"40464c0e65a3ae43a72017d";
        nonce_96_96 <= 48x"5129f0fcccc6";

        data_in_96_96 <= 96x"157ebd4c06f2966f626eb6e6";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"82733ee1a1e061bc0ffd1615";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4ecce9a705b53d322261c6f2";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2d6531f1c9b35bee15808ee4";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d02736dd48b49e157b4c3bf4";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"3f912a91eb7aab3760e8007e";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"949ec2a5392fc0791e1505dd";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"6780884ff0707674fecc79aa";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9c82dae58ee5ab756e5b8f23";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"19c8cfc14ba87c1cf01c4f76";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"93758cb91c04bb6bfcada665";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"3818ff34693bd4c374ebf3fb";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"41a61d737eb7553e493ecf0c";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"39e2ce7895ce641f173c5364";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"ae4bd047cd9d19939771ec1";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b705ac020b69c744440bb20c";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c9a0eac56e8f49c201ccfda5";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4cfc5d4899108ad117b38f";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d3a7a872c310dcc50e562554";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"67e01b3b7fa97ee6a40e10d0";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"1e599445b91909376cee07b0";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"cd04a68a3c77e8f2081c4040";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d61b02a1c37741e21fc9bef3";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9228d660d8972f3f40f129c4";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4d0aa69d712c02cdabb32cca";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"fb2a62d8ec7324813f20c64c";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"167e25010bc62ff1fc2642f3";
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"33546cf68e97ff62f4e9edc8";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 29 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_96_96 <= '1';

        wait until rising_edge(clk);

        reset_96_96 <= '0';
        key_96_96 <= 96x"65e9675306389bd3d26eeeba";
        nonce_96_96 <= 48x"154a22a5a421";

        data_in_96_96 <= 96x"ffa0841974dbcc40ef7dee1a";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"e963544a63b74101cbf8e26a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c1b5468a27bb1580e8f58c5d";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"688181a813d1ea49ed469bf4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8d7f7ba572e6316ee6710ad2";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"2e4025346987b05274219d3e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a1ee691a09e1c3b0271f2772";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"439f4b86cd6a5e0c74279656";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a43c991d2d4da4ef95e38180";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"106861d3633d9c54f30459cc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"e55e44b808a6d5b483210210";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"6b42b6f1f94e3c818a77594";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d15b598550eaa1d2c1f8190b";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"e5a1bdaea747795eb0c952af";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"31610b3d1257363cf25dcb50";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"b1e186d7df254e5dbefa9c47";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"74e04bbbca8033a7a5fd89c8";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"dba45b5e1498665b79fe0a1b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"cff0c8ac3d1cd68c9c63765b";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"eceb9505dbc33e56c8a17945";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"28cdc38a85b303d3756b6c0d";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"840fbb0ba5e327af071dade6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"e9a4a856556b20fab5a3cece";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"1480f037d39a4bb0d62b68d4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"79faf5012287401ba7bbaa76";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"19365f61f484878d5bc9e889";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"ea255e08e50c79ac5826444";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"ce03a34da022dfee843fb606";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d21276c21519401c8b1f1137";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"2f9cc4096bfafff5b7751f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a1402e57e7ef7b848610cf";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"291a58af259a2b28b22b8974";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"147a08acc65d8e4ed01e488b";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"65ea29d1adae7e45a036e74b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9b87cc5e6d7fe9b21a9e8547";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"a2bb62833d83ad7c39f706d4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"739ac9e291fd7d4a5a31a6a6";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"f75a7e6f2b863694541d1a81";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"60c8e5a0d560e64c55f7792a";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"afdb4e0b01716f1d956a2f20";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"fcbc32295cafa108832c9b79";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"f2460382951fe052c553b5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a2f62516dc88b09cd7604342";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"ecf150e6c6f149c70c15a575";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"511fcda922d801701e6cbd83";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"c96ef1a5ac7074642734f9bb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2ebed37d05d156b6eceec38d";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"6b325d4806c4e109c9a6e611";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4ea581d20068c1cbbd743b3";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"afb9f3a8e9e7e1ba916b51ee";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"9b83acd5e2ccddd8567fec5e";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"ec2b5e213f7a38e0b6118bd6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"69f12ccd0b4cba0a317eeb1d";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"213a6ad812b34a24667fceeb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"b2e74e770fe1cedfa5387901";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"e54ce0de6e797a9218b7f1a2";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 29 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_96_96 <= '1';

        wait until rising_edge(clk);

        reset_96_96 <= '0';
        key_96_96 <= 96x"65e9675306389bd3d26eeeba";
        nonce_96_96 <= 48x"154a22a5a421";

        data_in_96_96 <= 96x"26f5f1b7df75ebc6c05c4af8";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"61bafa39789c3c723ee29e68";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c7462559b11d80df46cb5bde";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"86ce563de291f5e1469fc269";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"7b281aa22a28c5b0cace6048";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"e072caae797c27bfc7938520";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"992d97c31d83bdff25c9f51a";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"9c684df10a515e8746ba6855";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"538012a89e21e6b3c630823e";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"c48ae37406dc1579647640a1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"1183943576ded3aa7da3f401";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"f9fb4010dec772b7bb22fa31";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a2b518037e405417c11890c0";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"7644d1839aabd22d75ef8aab";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"5c0c3aa9714ed0b0de5b2d74";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"796f9881572abb532b6b7b42";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"278a773bdf0a745fe41e2331";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"5e47c2a0eef671391ccdd340";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8c2e531ae2420a55d1b0421";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"8d2ad9744a8636550a9d499c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"5a5ea557ada5bef4aee9f21f";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"69199a8aaea6231508ef444a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"d3cc4a20fa13cfd59382dcf7";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"354af1bdba5612f7600aa45e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"c1296ebe58ffbfdba7408c92";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"7fe6a4e2a6f1e475b61f92b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"66d5f173cee0ef9fdd1f6fa0";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"76a933cf65fd5f6993a25c9b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2767a562b72b77e70167925b";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"2367ad9e8dcd7d64b9e8e4ee";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"350e48b8eb436343c0f0c947";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"2a1ace85351c5aac2728ec95";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2234b39f8b5aea5deac02e41";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"af273f4055cdd72ecb10cf68";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"7f017a240c5a0c2cdb285d13";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"2887a3a9e63317c3430342c7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2d3237ed0daa61505abd4d42";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"f7f1bb2780665563a0c30ce9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"2021c654d470861a851d81cb";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"60e9bd79fe1c51e5ea31e67a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"143c5813204b8767a03a5e24";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"25cc2478276d7e19f924e06a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"222f1a07ea60bb32db76aa29";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"83719849fb5214d99a66d48d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"a51aee4e9990c6988da123ea";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"b8f35c26d13ec39c5cb6f1f0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"8961422b235dd1417a24d2d5";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"ad0cabfc1baf01f1517fa07e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"aa24ed10c1ca38c3e93c6f0b";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"b259a6a0959199005e7cfaad";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"3eccbf3981cc1f853d2a314f";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"e5098f9ad3c61e058d37aebb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"4956e384feb1fcd445d73f03";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"439ddd7467af36d9af04ef81";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_96 <= 96x"819e98bdfbd8dd0c4af86434";
        valid_96_96 <= '1';
        wait until rising_edge(clk);
        valid_96_96 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_96 <= 96x"eb6ec9e0225f545796625aa1";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 29 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_96_96: process
    begin

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"157ebd4c06f2966f626eb6e6") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"82733ee1a1e061bc0ffd1615") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4ecce9a705b53d322261c6f2") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2d6531f1c9b35bee15808ee4") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"d02736dd48b49e157b4c3bf4") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"3f912a91eb7aab3760e8007e") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"949ec2a5392fc0791e1505dd") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"6780884ff0707674fecc79aa") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"9c82dae58ee5ab756e5b8f23") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"19c8cfc14ba87c1cf01c4f76") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"93758cb91c04bb6bfcada665") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"3818ff34693bd4c374ebf3fb") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"41a61d737eb7553e493ecf0c") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"39e2ce7895ce641f173c5364") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"ae4bd047cd9d19939771ec1") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"b705ac020b69c744440bb20c") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c9a0eac56e8f49c201ccfda5") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4cfc5d4899108ad117b38f") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"d3a7a872c310dcc50e562554") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"67e01b3b7fa97ee6a40e10d0") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"1e599445b91909376cee07b0") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"cd04a68a3c77e8f2081c4040") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"d61b02a1c37741e21fc9bef3") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"9228d660d8972f3f40f129c4") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4d0aa69d712c02cdabb32cca") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"fb2a62d8ec7324813f20c64c") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"167e25010bc62ff1fc2642f3") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"33546cf68e97ff62f4e9edc8") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a1832fdb31cb5e8eae2562ca") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"b3390a6ea0b87e455abec113") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"bb1d867704e6748a7f3ab7dc") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"9251ad083fcb34fabc39e1b3") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4643d7053df8eeefe44a01f6") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c2112edaf1e7ea9b2f6570d7") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"13f2dc866b83f00fed2ee36f") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"3c9a923672bbe7b392b95731") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"731c877ab6bca2a2be792965") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"e51c0cdb824734dfdd1f8e30") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"b47a5dcecf709452ce8c037e") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"30331476f53fc3dd19b53b7f") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"ec6e61bd70c455a92a1bc112") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"6d3f4b37ed9081c110b2e6e5") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"f0bd7405650dd400a27ee80d") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"6fed6cc540b000a44598244b") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c602bd20c1fa924ee1bccfb2") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"53e836639c14940d5b2d81cc") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"7b6e28f4e98ce2517337a7c") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c334f55802cee5817e15aa2c") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c329870a33e9e55e402492a3") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"6f84439262f9dbb265dcac6c") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a02a1b21a2a7d0fcc683ad33") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"b27516ea63a6aae9ac4ebce0") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"9d5b64fd2928f4be1514a0d") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"5ac5f4f0771ec087952b1ee1") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2076d932919c21edd47133e7") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4741ee56b5e2834d907d8532") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 27 Failed!" severity error;


        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"26f5f1b7df75ebc6c05c4af8") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c7462559b11d80df46cb5bde") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"7b281aa22a28c5b0cace6048") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"992d97c31d83bdff25c9f51a") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"538012a89e21e6b3c630823e") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"1183943576ded3aa7da3f401") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a2b518037e405417c11890c0") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"5c0c3aa9714ed0b0de5b2d74") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"278a773bdf0a745fe41e2331") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"8c2e531ae2420a55d1b0421") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"5a5ea557ada5bef4aee9f21f") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"d3cc4a20fa13cfd59382dcf7") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c1296ebe58ffbfdba7408c92") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"66d5f173cee0ef9fdd1f6fa0") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2767a562b72b77e70167925b") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"350e48b8eb436343c0f0c947") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2234b39f8b5aea5deac02e41") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"7f017a240c5a0c2cdb285d13") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2d3237ed0daa61505abd4d42") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2021c654d470861a851d81cb") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"143c5813204b8767a03a5e24") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"222f1a07ea60bb32db76aa29") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a51aee4e9990c6988da123ea") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"8961422b235dd1417a24d2d5") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"aa24ed10c1ca38c3e93c6f0b") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"3eccbf3981cc1f853d2a314f") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4956e384feb1fcd445d73f03") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"819e98bdfbd8dd0c4af86434") report "96-Bit Block, 96-Bit Key, CTR Encryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"ffa0841974dbcc40ef7dee1a") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"c1b5468a27bb1580e8f58c5d") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"8d7f7ba572e6316ee6710ad2") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a1ee691a09e1c3b0271f2772") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a43c991d2d4da4ef95e38180") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"e55e44b808a6d5b483210210") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"d15b598550eaa1d2c1f8190b") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"31610b3d1257363cf25dcb50") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"74e04bbbca8033a7a5fd89c8") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"cff0c8ac3d1cd68c9c63765b") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"28cdc38a85b303d3756b6c0d") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"e9a4a856556b20fab5a3cece") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"79faf5012287401ba7bbaa76") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"ea255e08e50c79ac5826444") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"d21276c21519401c8b1f1137") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a1402e57e7ef7b848610cf") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"147a08acc65d8e4ed01e488b") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"9b87cc5e6d7fe9b21a9e8547") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"739ac9e291fd7d4a5a31a6a6") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"60c8e5a0d560e64c55f7792a") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"fcbc32295cafa108832c9b79") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"a2f62516dc88b09cd7604342") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"511fcda922d801701e6cbd83") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"2ebed37d05d156b6eceec38d") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"4ea581d20068c1cbbd743b3") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"9b83acd5e2ccddd8567fec5e") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"69f12ccd0b4cba0a317eeb1d") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_96 = '1';
        assert (data_out_96_96=96x"b2e74e770fe1cedfa5387901") report "96-Bit Block, 96-Bit Key, CTR Decryption Test 27 With Pause Failed!" severity error;

        report "96-Bit Block, 96-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_96_144: process
    begin
        -- Encryption test
        reset_96_144 <= '1';

        wait until rising_edge(clk);

        reset_96_144 <= '0';
        valid_96_144 <= '1';
        key_96_144 <= 144x"1b7890a00ee170e2ee61e29b24d72bdc9c10";
        nonce_96_144 <= 48x"c006ea8fd23d";

        data_in_96_144 <= 96x"3a05c0b73ddf55b2015128db";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"fbf70946d6ada0667f6bf51b";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"398071b14642cddb4fbe2aae";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5ad8712d7ee1a2a3024bfe48";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"824c6948f474b1a4f2684ee1";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"17776c3a57435d9ced3032ed";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"92dbd6134e051eea13d72846";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"bd2cdb8d39ebfa326c1b6811";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6193db51f6aca9b45e146c30";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"253df737c2185e77dc58ea6a";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ef96a21449b3fe663b4c0730";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c6b7e7cbbe0d24ed33061611";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e166c6aba8f614bd7b2aa677";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"486c0adf5bf26ec8c814ed3c";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"211e55c39cc753ad6264190f";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1e94eb4bc74f73cad4c667bb";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"801095005ae5253066b48fc6";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"3a88a4ab78916712de5fe0ee";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5fba6dc2b594b706a7fb881e";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5bd71dc6ea75e34da1d53402";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5bf572794704768e6e927501";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c46f5825669ff1b9f902d6c0";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"fe38f4ebb6e0eac2c42bf4c4";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1af4321addd3e7794879996d";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4a9686a4e75241027acf6bcc";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"277dfc7b722c353d1ee1723b";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"3e581dd5eed1536858116722";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"edfda2912fdb5c0dbe4a565e";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7fd2770a568d6f3ef4b445aa";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 30 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_96_144 <= '1';

        wait until rising_edge(clk);

        reset_96_144 <= '0';
        valid_96_144 <= '1';
        key_96_144 <= 144x"1b7890a00ee170e2ee61e29b24d72bdc9c10";
        nonce_96_144 <= 48x"c006ea8fd23d";

        data_in_96_144 <= 96x"3ccc31d3fb74ece484cb87fe";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7750a550061e39717db08372";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1d9087f9443e31a497fe971a";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"10ec360d65e103e03c3abec9";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"11fdf87fb3b8fe83181f9c4b";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1aa8c220a86cd61866a798a";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1ac1fe37f4c715196701d7e4";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"546fb4d7bc94ba52e80eb92d";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"dadc79ec385023132233facc";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4771219c003d287585c1aa5c";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c85e0f40605be8fac3217292";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7444e1fc106dee775dd76156";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5dcfb683dadf41b097146276";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"2a241ae5d3936aa150ce35bd";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"71242862dc37c51a7b47efb6";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"36655adcd2004fd1ce28dbb0";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e6f15db2fc17dac012166c15";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1cd85607b04fa2c59f82d481";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"5a507c0c375f866f03ca7044";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"83e8d6ba7e191ce636d97d7c";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"28791cebd2fb34385849115e";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7eb5ce50dce68bb7cb4c2c2d";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4ae0b1f006fde1ba111fd2eb";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"9d2a565aa0ff96997d9a6dbf";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6d92883dd0ff54dd951aaa1b";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6bcdddb24386cf240d8abc81";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"d17ba6989c68ed95c33742d";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"64e3390299c32337991cd266";
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6a2af57792283ba02fe06f66";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 30 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_96_144 <= '1';

        wait until rising_edge(clk);

        reset_96_144 <= '0';
        key_96_144 <= 144x"c705f9adf8c56247b40dae5ceb3d1c275035";
        nonce_96_144 <= 48x"f92d4fab2ad8";

        data_in_96_144 <= 96x"26184c80edf6b1e0ee8f0e09";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"9c272c51ac98a368dfc8b87a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"85bab545d4e26a5bf807cdd9";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"840658d1c1da8d39f7350626";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"3006ff85166a1a98af3b5a91";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"aedab7b5e2aa55a7495103ed";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"848edc98eec9fa674cc672fc";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"31307e46af7975467e5168dc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1f6ceec1ac546740a182e35f";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"d7de701d8eafb3235f653800";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"27b51ee70f1a6c44f239fbb0";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"640ca20c702a5b67b7ae7758";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"559de20409642b3157c2747f";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"113c183677f4531bfde9d47d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ce1f40819f2d5db8debaa89f";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"efb80c63f42f338f27e08e2f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e668bb6ec408143f290d07e4";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"67f8ab5705727bb50bee2ebd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ad83095163eaa00577f63854";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"ca6cb87cdfb8770891d2125a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7f00625769560c063008a519";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"a225183835e1392e8a74bec5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"64119d382ae201c0312a4c3c";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"ab341860fefd320bf5efaa99";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"f2b72bd2c97be2af0c10ef01";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"e80bb7eba49999cf87e51bbc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"f60ce881c5ac7520cd4668fe";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"c095e0997e240205bb00d206";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c284e0bee33e270a56c6544d";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"cef980cec471e21a05f2b928";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"855a7d8dd46e34aaae9d1797";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"dd9539fcf7cd0b759d263e76";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"53fb2ed1b9534807300961c3";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"773b83502743e0df5e15428a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ec4f449084eaf9432ee66e21";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"72789d7597f0bfcf1c351dc9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"d9efbb41b66b6b0b8af37d72";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"fb2323e7d6a2c379e0c6a8a7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6f1d5baf952b750d9830349d";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"ef82c4d6438dc8b1971964f8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"b050eb01a22fc81826f33244";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"7c2b940d9045a445958cd60e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e61b4dc67e525e4f9e203161";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"86fe0dedfe38784bf489362c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"edc641cd921bc646a9c7ae92";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"1dd95d4c0637fdcadf4630ad";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"70fe3cfc991ab513369fe284";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"b49b93d51e709e1907f79ee0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7cddb4cc3e332f35086c9768";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"a11b26b008236adf3f7512c5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"d7f14ec29a9dadd2e7aad070";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"1d8cca3b6261479043a061c4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"bb2966398e4a295d5153f737";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"f424ffa8abb572c8aae0c3a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"b2591c40021b6323246b7d9";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"39279358d5f52c083f0ba77";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"3e2b66532258edf30ff0952a";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"d1cae1937ed61f4ee8751766";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 30 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_96_144 <= '1';

        wait until rising_edge(clk);

        reset_96_144 <= '0';
        key_96_144 <= 144x"c705f9adf8c56247b40dae5ceb3d1c275035";
        nonce_96_144 <= 48x"f92d4fab2ad8";

        data_in_96_144 <= 96x"bd07bf6460d5e1710726d25f";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"4202faf9dcebef56a31ca36b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1f0cb94fa21fdae36dffb7e2";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"8fad725d9d0b6f5e196d362d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"25d78585be62bdfdbfd4978e";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"c20166e3ca687a98f48ef9a8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"f4921f711e1435b21a2531ed";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"393031a6c82a6c15d733f669";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"fe46612b57227570aeadf663";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"3aeb5bc0f63d307ca9d21bf8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e082b6db8b27ba7948885707";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"28702bb15931c9b4706146ff";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e63f479a642d28c85c89af56";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"e5039055f90b9724b883a8ea";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"9c803cd74917525809e5f96f";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"20e30a4dfbcefcd05050f32c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7f41e6eeb6f6af96d98385fd";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"52c1b3c7f33c4233c833b07e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4fbd8fead4a47d6f5e3fd161";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"39d60ba9c99373515a652a7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"6ef558e08c6b9bfb29701411";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"dd7516f558aa03838dff06d2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7488b0380f5f63e1b554264";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"1f69cd4368bfbf7ed4dc2301";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"16c6943ba11277c7edb0a121";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"4bebcf4f2c94151d52fa3935";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"2eb22b0013a2a029d067f5be";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"d87d3afca3705e8a021ac45b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4c66b748bbdfd7af54737526";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"49954cf1faaf500ca74b3d20";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"31acfe502639d09b9d32e332";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"84403b37b13bad4ee368f7d2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"51dfb1077e26b7baefd8a8ab";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"f367dbe240e3469f39b66d71";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"c33638ea08d1bc7d6b6c195f";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"88653e42cefe73ece9184b9f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"ca3832708483d14ab7554e6e";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"b550f22172e55360e3aeb12e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"d7ada6f4a1098c513ef5fb6a";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"7d5e121623a35ae7a31a27c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"122c724bce7d6ccdf94941f8";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"69f5a74186861f295cb76bb9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"4a475fd76de45c5003cbc9ea";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"7ff5101d3f1cd31b86ff76d1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"12c1ca507223ba876da828a8";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"6e771359677abeb744bfc434";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"8e57e9bb0e35e7573501fdf";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"ed4879e7efd164eeb287c440";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"7883283c2f0a6ddff56c06b4";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"33d4a0965b7801ea86343347";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"bf899b5085c2a2022f77090c";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"cc869dea38a7ac5426b1caba";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"1a3ab826584bd15fbf70a463";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"8b4eb003401a2e8afba0fd45";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"e29117a6751dba96eab0f1a9";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"2826ef27f190cb53b489f5c7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_96_144 <= 96x"12de9359adca9bf509d3be82";
        valid_96_144 <= '1';
        wait until rising_edge(clk);
        valid_96_144 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_96_144 <= 96x"ae63ad3a94d7f681d5511e14";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 30 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_96_144: process
    begin

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"3ccc31d3fb74ece484cb87fe") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7750a550061e39717db08372") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1d9087f9443e31a497fe971a") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"10ec360d65e103e03c3abec9") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"11fdf87fb3b8fe83181f9c4b") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1aa8c220a86cd61866a798a") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1ac1fe37f4c715196701d7e4") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"546fb4d7bc94ba52e80eb92d") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"dadc79ec385023132233facc") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"4771219c003d287585c1aa5c") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"c85e0f40605be8fac3217292") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7444e1fc106dee775dd76156") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"5dcfb683dadf41b097146276") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"2a241ae5d3936aa150ce35bd") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"71242862dc37c51a7b47efb6") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"36655adcd2004fd1ce28dbb0") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e6f15db2fc17dac012166c15") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1cd85607b04fa2c59f82d481") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"5a507c0c375f866f03ca7044") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"83e8d6ba7e191ce636d97d7c") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"28791cebd2fb34385849115e") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7eb5ce50dce68bb7cb4c2c2d") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"4ae0b1f006fde1ba111fd2eb") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"9d2a565aa0ff96997d9a6dbf") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"6d92883dd0ff54dd951aaa1b") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"6bcdddb24386cf240d8abc81") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"d17ba6989c68ed95c33742d") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"64e3390299c32337991cd266") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"6a2af57792283ba02fe06f66") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"3a05c0b73ddf55b2015128db") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"fbf70946d6ada0667f6bf51b") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"398071b14642cddb4fbe2aae") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"5ad8712d7ee1a2a3024bfe48") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"824c6948f474b1a4f2684ee1") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"17776c3a57435d9ced3032ed") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"92dbd6134e051eea13d72846") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"bd2cdb8d39ebfa326c1b6811") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"6193db51f6aca9b45e146c30") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"253df737c2185e77dc58ea6a") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"ef96a21449b3fe663b4c0730") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"c6b7e7cbbe0d24ed33061611") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e166c6aba8f614bd7b2aa677") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"486c0adf5bf26ec8c814ed3c") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"211e55c39cc753ad6264190f") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1e94eb4bc74f73cad4c667bb") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"801095005ae5253066b48fc6") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"3a88a4ab78916712de5fe0ee") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"5fba6dc2b594b706a7fb881e") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"5bd71dc6ea75e34da1d53402") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"5bf572794704768e6e927501") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"c46f5825669ff1b9f902d6c0") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"fe38f4ebb6e0eac2c42bf4c4") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1af4321addd3e7794879996d") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"4a9686a4e75241027acf6bcc") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"277dfc7b722c353d1ee1723b") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"3e581dd5eed1536858116722") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"edfda2912fdb5c0dbe4a565e") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7fd2770a568d6f3ef4b445aa") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 28 Failed!" severity error;


        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"bd07bf6460d5e1710726d25f") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1f0cb94fa21fdae36dffb7e2") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"25d78585be62bdfdbfd4978e") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"f4921f711e1435b21a2531ed") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"fe46612b57227570aeadf663") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e082b6db8b27ba7948885707") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e63f479a642d28c85c89af56") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"9c803cd74917525809e5f96f") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7f41e6eeb6f6af96d98385fd") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"4fbd8fead4a47d6f5e3fd161") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"6ef558e08c6b9bfb29701411") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7488b0380f5f63e1b554264") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"16c6943ba11277c7edb0a121") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"2eb22b0013a2a029d067f5be") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"4c66b748bbdfd7af54737526") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"31acfe502639d09b9d32e332") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"51dfb1077e26b7baefd8a8ab") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"c33638ea08d1bc7d6b6c195f") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"ca3832708483d14ab7554e6e") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"d7ada6f4a1098c513ef5fb6a") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"122c724bce7d6ccdf94941f8") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"4a475fd76de45c5003cbc9ea") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"12c1ca507223ba876da828a8") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"8e57e9bb0e35e7573501fdf") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7883283c2f0a6ddff56c06b4") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"bf899b5085c2a2022f77090c") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1a3ab826584bd15fbf70a463") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e29117a6751dba96eab0f1a9") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"12de9359adca9bf509d3be82") report "96-Bit Block, 144-Bit Key, CTR Encryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"26184c80edf6b1e0ee8f0e09") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"85bab545d4e26a5bf807cdd9") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"3006ff85166a1a98af3b5a91") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"848edc98eec9fa674cc672fc") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"1f6ceec1ac546740a182e35f") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"27b51ee70f1a6c44f239fbb0") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"559de20409642b3157c2747f") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"ce1f40819f2d5db8debaa89f") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e668bb6ec408143f290d07e4") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"ad83095163eaa00577f63854") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7f00625769560c063008a519") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"64119d382ae201c0312a4c3c") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"f2b72bd2c97be2af0c10ef01") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"f60ce881c5ac7520cd4668fe") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"c284e0bee33e270a56c6544d") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"855a7d8dd46e34aaae9d1797") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"53fb2ed1b9534807300961c3") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"ec4f449084eaf9432ee66e21") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"d9efbb41b66b6b0b8af37d72") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"6f1d5baf952b750d9830349d") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"b050eb01a22fc81826f33244") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"e61b4dc67e525e4f9e203161") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"edc641cd921bc646a9c7ae92") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"70fe3cfc991ab513369fe284") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"7cddb4cc3e332f35086c9768") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"d7f14ec29a9dadd2e7aad070") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"bb2966398e4a295d5153f737") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"b2591c40021b6323246b7d9") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_96_144 = '1';
        assert (data_out_96_144=96x"3e2b66532258edf30ff0952a") report "96-Bit Block, 144-Bit Key, CTR Decryption Test 28 With Pause Failed!" severity error;

        report "96-Bit Block, 144-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_128_128: process
    begin
        -- Encryption test
        reset_128_128 <= '1';

        wait until rising_edge(clk);

        reset_128_128 <= '0';
        valid_128_128 <= '1';
        key_128_128 <= 128x"b8d1353905628912bdf2b5a1b57a5c03";
        nonce_128_128 <= 64x"ff73f2533251c76";

        data_in_128_128 <= 128x"15d0db4380a1717622b34047ee4b0498";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a20847d854ed1b3b4f7070e66b58996c";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"d38b8f29ed0c5245a0536c6cea8713d2";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fbc0318b6e4d16e30668cc99e7f0271";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"50ed6af2235f6be1f8b55fb556d1079c";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"bf3cfe56a83299e9fae46529fa9fcece";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"7b33241efa2225d77c6d8ae1463e4336";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4502d7f854a1396ce9abfb0d9be57401";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"756aa13d13f1484aa55dc720e5540022";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e5e6190b28da2b89c1308a09cddd03bb";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8f15c995424a2898832e9e1e1b908d6d";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"72a2761a9ba66e98679140e0b6fece9a";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"9b83a43728b7405babc2ded76bd8e65f";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"205bf9e7c42b43fa6b4de9deec7b009c";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f02dd043d01acef6a8294aabafaf2b68";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"95a37efe1cc7e2b6c99d5f9ec634effd";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2f9f5bf9d6b6b5d01c87284dc5fa8ac9";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4b511edb7b768615f6b1465dbf2b6442";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"af405e52199a1949ba9d82b8afbae6c3";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"46b0163043215bf46cff30a0c3ac232c";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"5b0eec4ba2a1fa451c52d51ec8fe0b2d";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"cd43cfeb89386b90d34145328252f723";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"9b9a9bf50a78491f0211550313218ef7";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f4105d94c689f37bf94523fe03cb8f1e";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"68795e631f742e70e36b3a5f23746ddd";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"7b38a089fa4abdecc8a86e3a62937980";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a1c563425033b5a406ec9ad0e2cbef40";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b3f175d015c7a82023f3e5aed1de4fa8";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"bfdf8a9e9446d493a4d6ce54645cc176";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"3590a2e50c780f2f39a11816fc7aad95";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e70a26e9eb6b96ecea3a5bf369946c6d";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c83235cc995d767b0c1333ce07117e78";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 33 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_128_128 <= '1';

        wait until rising_edge(clk);

        reset_128_128 <= '0';
        valid_128_128 <= '1';
        key_128_128 <= 128x"b8d1353905628912bdf2b5a1b57a5c03";
        nonce_128_128 <= 64x"ff73f2533251c76";

        data_in_128_128 <= 128x"ea7ea8d18d89c90c7fe38d79df29654a";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f93c0e80af4eba3b8ab6fea8cf5cb8f5";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e46c584150ce5920a8ef9ef2fc3bcdea";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c1f2827fd80916bfcb63d51aaef754d8";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"87e2d5390a862c5fea708f1c9eb47cd4";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"1f0cb8001d8a177a35c7a66abecc5207";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a13962499728a42b90471e001374884e";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ae34c1a9d9080aeceb0a5f90dc3e1176";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"48a92678010e4dd58e9f9a470f72055b";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"656ca2b2d43fd3f40fe3211f24c67cca";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"139e083fffc6d2c157e34eab740517ef";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2ccd3b5d8b42dcf5c7235ccaa0e9618";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"dd1f2d80bb22187a07b2b137ee93fc79";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"63ba35def954b0e80cfd40e17f77e632";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4e4c4416ae7fd3b1a84cd69a55e76e7";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4e084dbf739da83f57df7c0e096281d5";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"aa1b55934b4c4b0e92997d1e0b62dbfc";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"393553de0d028fbcacb3cc5d9ab148bd";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b5d96fb8e82c71c7cc4b1676c719e9cc";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4fc5e5dca108d6d7966bbb3905b494a0";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b34c6ba48246d3914ada5874d949ed17";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fb8e62d1c9b967dc8ba9158f94a65587";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"be6e3822bfa860e581ea578a2f80ece8";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b5f28622520fbd45e07d188533af890d";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"d8a41f6990cf5930361c93491d9139bf";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c1e51f6d387dc7c837e7311202423c57";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e4be964161f50305fcf17f637892288d";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"20d05843e333122e14998e505a7096e7";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"7e91c630675a6630d107f8ff2086f21b";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ec1c17330f9c14168f07d4f291c015f3";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a79f6380e755804d31e5e43cfd256173";
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f6238a73229207baa52cf826a7b66aa3";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 33 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_128_128 <= '1';

        wait until rising_edge(clk);

        reset_128_128 <= '0';
        key_128_128 <= 128x"b40eb501bb2c2c428f6dc11721eaa1fa";
        nonce_128_128 <= 64x"8bdd4b9dfc2cd5c7";

        data_in_128_128 <= 128x"24d878a13e5aed8352722246257ea412";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"deccac5b968d4f41d0d65fdd176b2101";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8ce67bdc41b72448c2862234d81580dc";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"32a564ffe195f855dd4b2f7ef559ddc7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b5e16e19b4642bad895992982c481f98";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"c9d9db157efa4e9942045f8c3a72a669";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ec023a99e4c80a291d5f9dfc98b0b4d7";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"4574a37e9dbff93fbc031029253053ae";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b11bb2df346eba317ad5af8172678417";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"2e975c72f3c73944f95c46f7682e4002";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"9af08b9a5ba1cdb699aed9de2e7833c5";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"acea35a393d5e33bbd86931235069af5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"16bb4fb0cd59beceb5bcc5833fc34af1";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"f317930e51995cf180d9a24e0a833038";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"35d5870de79d1be27f29e86c8a730eaa";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"7d7a0bfa598c8a5c19b2b59530519f6a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8301c5b945ffa36b63c2523d4b32bc86";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"f812b02296b09e2989e4b9df5a45a717";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"681e5658d813a70f5a9c60b533b887d3";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"6478a3998d682a6149262a1337c67f46";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b177efd054f0566bb1a48e250b91e51";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"43db02351184d8fbbd335a642d79f3f6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"9a9a56bc326ea68df4e35152312cd434";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"830a2393604c83ca53b9a632f9675221";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8ea5e386d8ce8d9a29deb76ad4ce14b3";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"91b92f8b8a849529b662f7edb5b85fb3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"806094aa4037fffa14b8317e75555ded";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"9de0103a4e2e2c6e08e7a744a7f3c30f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"6b76911f7c8765b6b04a262049ab05a8";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"fd14f9d493510969c2ebbadc8428d344";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ac788719d9371f2a506e2fc6d05d2cb9";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"66f0f7698909c1ba18fa547216752b38";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"dfa69923b334ebbcef6ed981be23bd25";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"3ba685773396454308439ba12afd65c3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"dd07edc60df099c562a77dc7b27338fc";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"680fe5e260c36cdd9937f592185aeb98";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"f08502ee47e3d101d72e0feea289858";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"17426bd07de5b4a337ef373e32dec6d5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c34dfc6428e2f201fbb2242955ab42c5";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"836150061981f0d4dbf9a793ecb9cb39";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"8f0c417ab85f2ec49d6fe1b54420e63b";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"99cb37c76e7fbad29efb00b7a397b217";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e62a3fb58c46e2bc4f12b0d57028dab4";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"70c742d03295ba69f9873b5e08dfc975";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"7b51aca6ea8760aada4dda766a34bfb4";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"d35f581e3648431fae9e8d0384983111";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ad283c0df230400a386b01c05ffe6c11";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"78ca810e742863563c91e45824b27e83";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fed97f9e148680deb9e789c616f48941";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"a622053dd5ff789446ac32019ab1874e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"175bf448a0ce5b5fca563921f9422f1e";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"22d72fabdc786e743ae7ab54169e98ce";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"dac15a07047cd56efd6cc3648191cbeb";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"db5bf01f3d75489ae1289e96ebe3387b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"54b7e75b835875c3952049e4a8fcf210";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"ad5ac10cbd3ccd615ec2abf6a2237d40";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"98bc2c7ad112460cbba12642f4a8bcd3";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"fea4ca6a33423b60310dfbf4d7418ae8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"90425d14e6b0643c188417d8fe9f9ff6";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"91523be650f137560fc01e2bcd635cc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c9e8060c0a8f541d052ba0513c241ca5";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"95dd24bd27c4bf8d599490667d416588";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"bae8d99feee05fb7d2d6840d18711121";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"2864120ef118ac101de4ead3362b5eea";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 33 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_128_128 <= '1';

        wait until rising_edge(clk);

        reset_128_128 <= '0';
        key_128_128 <= 128x"b40eb501bb2c2c428f6dc11721eaa1fa";
        nonce_128_128 <= 64x"8bdd4b9dfc2cd5c7";

        data_in_128_128 <= 128x"4e0ef335272d885ddb3d71d751749976";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"8946352dd9535d1dea83986171027b03";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"6461cd804563613077273328e55e01d3";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"9cef0ead6cadf412df1fe3fefd9373e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"18922301d14933cd557539b0f3c3a986";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"1938d096ed3dffdfa5bb23895dde2c6a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"3d817365666a28a99a829c2ab543d76";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"af01e69853a91353ee2151b7e88c933";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"5b6a63517ea66fe2b89ee8b5c34df97c";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"a013e55e3cd2aad82997e8996059c8a9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"94be7eb00c8ffa6c609a24a6c760ccd8";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"f4634a8128ec7c65848d77e3c7975813";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e0f0785a7b701f7989b7b96f0a4d2090";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"3e41ca28a0c7bb90eef7133aa6728c5c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"e6e43b57687e9ee64437604b8e31441f";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"2d64584a9ee08eef978ff2cbd23a817d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2d19562b416b42116131dddc59dd9cf8";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"b54faf700a9ffe96fdf0d6056b7b2370";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"1d0ed297feceb8f49255ad2c53f05365";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"73961f8efaa83536d3d779d524301b87";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"7edfab8228eb70c825c4386bd223967d";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"a322e658410223b45536212a58d776da";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"be272657e2716e302c9b95203503392e";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"fbdc223305ad18a9e7d37bcc63f6ed2d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"fd1b026313e6eb4aee3db8b39452d4bc";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"c6b1b41f3659333f3deaf9a0a724dc8f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"211647d8f432e87e8598a75c2c752b89";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"401f8134c3e5382702bc0550dfeddf7e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a47211ad63cc06f0141b30eb2d0b46a4";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"faaad22c8c372aad84eefe22940795d0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"d06ea9234f156e2d22cca8b065a0c77f";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"ec8bd9786363a1f0fcfd32468884b81d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"4730c75cc60bb9506933c2a2dba48ee4";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"a5b466b4cd037e583ca581624509a7a7";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"185d229667510a63467b65fafcfb3d86";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"15ade79c4e681568c66456bfe73ce3cc";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c1314397f01946ecc27399b80e1336ea";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"d6fb22211b62d422444c3c0601ed02db";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"ea95098b033e6668b37bbb3064707de8";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"6776eb3783f07d7c43c5f2d378886792";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"6fa0dd1882fa89418458ddac4234077b";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"352f034103faa677b1a8e5c62c075d2c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"98ef9d02181d0758bb7c18f9a2ca230f";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"6fa2be1307fce776a85536f31bf8fbeb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"33368224b790b0f7e3ad6324feffbab8";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"eb9fc88eb8775b599f3da6ae5295dcaf";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"c185a84367a1dd1d4d69df3b5e29a14";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"ee68e406c784499d6909b2905496a305";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"a0c8e773c9beacc79eb15d0ccf31abc9";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"3ffd9bf21fb99669a416c71df64d977c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"2067ef73be9512adf993207bdd5a74a9";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"78edd1c6e98114a4b894cf22c2dc9456";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"897e380af3dbf33639daf5b529cf6ae";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"5aa2356bd67ca257afed8aae2c7bf199";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"bd4a2c750bbc7090fe26ecb4d71dda43";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"b3670f54dbd61b32865fd3cecdbe996e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"b97fc4b2a50d19236b63e83093955dbc";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"2ba08a2499ccda394bdc511ad7461872";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"33939544383ac6e3a694b99d091d6d7c";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"f80159870008cccf565e5ae7ad82e067";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"3e19a44542de4849a9b6c1480071607";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"c0ca3f4d56dc94eb17d9fa660063b5c9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_128 <= 128x"96d2843fe50eac2dd3c1f4eb54be3fc1";
        valid_128_128 <= '1';
        wait until rising_edge(clk);
        valid_128_128 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_128 <= 128x"3e2598d632ca1ebed8cd5da373cc3524";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 33 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_128_128: process
    begin

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ea7ea8d18d89c90c7fe38d79df29654a") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"f93c0e80af4eba3b8ab6fea8cf5cb8f5") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e46c584150ce5920a8ef9ef2fc3bcdea") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c1f2827fd80916bfcb63d51aaef754d8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"87e2d5390a862c5fea708f1c9eb47cd4") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"1f0cb8001d8a177a35c7a66abecc5207") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"a13962499728a42b90471e001374884e") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ae34c1a9d9080aeceb0a5f90dc3e1176") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"48a92678010e4dd58e9f9a470f72055b") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"656ca2b2d43fd3f40fe3211f24c67cca") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"139e083fffc6d2c157e34eab740517ef") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"2ccd3b5d8b42dcf5c7235ccaa0e9618") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"dd1f2d80bb22187a07b2b137ee93fc79") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"63ba35def954b0e80cfd40e17f77e632") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4e4c4416ae7fd3b1a84cd69a55e76e7") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4e084dbf739da83f57df7c0e096281d5") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"aa1b55934b4c4b0e92997d1e0b62dbfc") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"393553de0d028fbcacb3cc5d9ab148bd") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b5d96fb8e82c71c7cc4b1676c719e9cc") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4fc5e5dca108d6d7966bbb3905b494a0") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b34c6ba48246d3914ada5874d949ed17") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"fb8e62d1c9b967dc8ba9158f94a65587") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"be6e3822bfa860e581ea578a2f80ece8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b5f28622520fbd45e07d188533af890d") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"d8a41f6990cf5930361c93491d9139bf") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c1e51f6d387dc7c837e7311202423c57") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e4be964161f50305fcf17f637892288d") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"20d05843e333122e14998e505a7096e7") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"7e91c630675a6630d107f8ff2086f21b") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ec1c17330f9c14168f07d4f291c015f3") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 29 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"a79f6380e755804d31e5e43cfd256173") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 30 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"f6238a73229207baa52cf826a7b66aa3") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 31 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"15d0db4380a1717622b34047ee4b0498") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"a20847d854ed1b3b4f7070e66b58996c") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"d38b8f29ed0c5245a0536c6cea8713d2") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"fbc0318b6e4d16e30668cc99e7f0271") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"50ed6af2235f6be1f8b55fb556d1079c") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"bf3cfe56a83299e9fae46529fa9fcece") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"7b33241efa2225d77c6d8ae1463e4336") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4502d7f854a1396ce9abfb0d9be57401") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"756aa13d13f1484aa55dc720e5540022") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e5e6190b28da2b89c1308a09cddd03bb") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"8f15c995424a2898832e9e1e1b908d6d") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"72a2761a9ba66e98679140e0b6fece9a") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"9b83a43728b7405babc2ded76bd8e65f") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"205bf9e7c42b43fa6b4de9deec7b009c") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"f02dd043d01acef6a8294aabafaf2b68") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"95a37efe1cc7e2b6c99d5f9ec634effd") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"2f9f5bf9d6b6b5d01c87284dc5fa8ac9") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4b511edb7b768615f6b1465dbf2b6442") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"af405e52199a1949ba9d82b8afbae6c3") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"46b0163043215bf46cff30a0c3ac232c") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"5b0eec4ba2a1fa451c52d51ec8fe0b2d") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"cd43cfeb89386b90d34145328252f723") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"9b9a9bf50a78491f0211550313218ef7") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"f4105d94c689f37bf94523fe03cb8f1e") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"68795e631f742e70e36b3a5f23746ddd") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"7b38a089fa4abdecc8a86e3a62937980") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"a1c563425033b5a406ec9ad0e2cbef40") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b3f175d015c7a82023f3e5aed1de4fa8") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"bfdf8a9e9446d493a4d6ce54645cc176") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"3590a2e50c780f2f39a11816fc7aad95") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 29 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e70a26e9eb6b96ecea3a5bf369946c6d") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 30 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c83235cc995d767b0c1333ce07117e78") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 31 Failed!" severity error;


        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4e0ef335272d885ddb3d71d751749976") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"6461cd804563613077273328e55e01d3") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"18922301d14933cd557539b0f3c3a986") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"3d817365666a28a99a829c2ab543d76") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"5b6a63517ea66fe2b89ee8b5c34df97c") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"94be7eb00c8ffa6c609a24a6c760ccd8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e0f0785a7b701f7989b7b96f0a4d2090") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e6e43b57687e9ee64437604b8e31441f") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"2d19562b416b42116131dddc59dd9cf8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"1d0ed297feceb8f49255ad2c53f05365") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"7edfab8228eb70c825c4386bd223967d") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"be272657e2716e302c9b95203503392e") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"fd1b026313e6eb4aee3db8b39452d4bc") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"211647d8f432e87e8598a75c2c752b89") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"a47211ad63cc06f0141b30eb2d0b46a4") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"d06ea9234f156e2d22cca8b065a0c77f") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"4730c75cc60bb9506933c2a2dba48ee4") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"185d229667510a63467b65fafcfb3d86") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c1314397f01946ecc27399b80e1336ea") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ea95098b033e6668b37bbb3064707de8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"6fa0dd1882fa89418458ddac4234077b") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"98ef9d02181d0758bb7c18f9a2ca230f") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"33368224b790b0f7e3ad6324feffbab8") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c185a84367a1dd1d4d69df3b5e29a14") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"a0c8e773c9beacc79eb15d0ccf31abc9") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"2067ef73be9512adf993207bdd5a74a9") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"897e380af3dbf33639daf5b529cf6ae") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"bd4a2c750bbc7090fe26ecb4d71dda43") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b97fc4b2a50d19236b63e83093955dbc") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"33939544383ac6e3a694b99d091d6d7c") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 29 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"3e19a44542de4849a9b6c1480071607") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 30 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"96d2843fe50eac2dd3c1f4eb54be3fc1") report "128-Bit Block, 128-Bit Key, CTR Encryption Test 31 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"24d878a13e5aed8352722246257ea412") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"8ce67bdc41b72448c2862234d81580dc") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b5e16e19b4642bad895992982c481f98") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ec023a99e4c80a291d5f9dfc98b0b4d7") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b11bb2df346eba317ad5af8172678417") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"9af08b9a5ba1cdb699aed9de2e7833c5") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"16bb4fb0cd59beceb5bcc5833fc34af1") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"35d5870de79d1be27f29e86c8a730eaa") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"8301c5b945ffa36b63c2523d4b32bc86") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"681e5658d813a70f5a9c60b533b887d3") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"b177efd054f0566bb1a48e250b91e51") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"9a9a56bc326ea68df4e35152312cd434") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"8ea5e386d8ce8d9a29deb76ad4ce14b3") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"806094aa4037fffa14b8317e75555ded") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"6b76911f7c8765b6b04a262049ab05a8") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ac788719d9371f2a506e2fc6d05d2cb9") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"dfa69923b334ebbcef6ed981be23bd25") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"dd07edc60df099c562a77dc7b27338fc") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"f08502ee47e3d101d72e0feea289858") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c34dfc6428e2f201fbb2242955ab42c5") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"8f0c417ab85f2ec49d6fe1b54420e63b") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"e62a3fb58c46e2bc4f12b0d57028dab4") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"7b51aca6ea8760aada4dda766a34bfb4") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"ad283c0df230400a386b01c05ffe6c11") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"fed97f9e148680deb9e789c616f48941") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"175bf448a0ce5b5fca563921f9422f1e") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"dac15a07047cd56efd6cc3648191cbeb") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"54b7e75b835875c3952049e4a8fcf210") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"98bc2c7ad112460cbba12642f4a8bcd3") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"90425d14e6b0643c188417d8fe9f9ff6") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 29 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"c9e8060c0a8f541d052ba0513c241ca5") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 30 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_128 = '1';
        assert (data_out_128_128=128x"bae8d99feee05fb7d2d6840d18711121") report "128-Bit Block, 128-Bit Key, CTR Decryption Test 31 With Pause Failed!" severity error;

        report "128-Bit Block, 128-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_128_192: process
    begin
        -- Encryption test
        reset_128_192 <= '1';

        wait until rising_edge(clk);

        reset_128_192 <= '0';
        valid_128_192 <= '1';
        key_128_192 <= 192x"8bbd6b2f42f378f27612c7e8924dbea9ab616040e1abfa8b";
        nonce_128_192 <= 64x"73213530f0022e2e";

        data_in_128_192 <= 128x"e08aec96f4159113cac4b9e6778d028c";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"3288a67e030c98e85e2408fa70dc4769";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7d87d79311705ee3343b4fb0912d791d";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1677013ba8e19b8321ab9e3dfdf4ff09";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"abfa4f2cb188604884ddf869b8163f1a";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"9d0a4fac67aaa0688dcfb198f0e51f30";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6d9635ef1426a5dc3536763b4768a5c9";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b7aa3d917a282c8a8b67e0d305d79967";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ea264afbbd3ee93c57bd270bbe633c9d";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4b8ff2b49ddd6df0329b638600bc698b";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"e33725eeddf06a9dc3b9b3acd4efad3e";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"72e99ed16b3bc4cdcd4a30f2c5062250";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4896c62cb397b350838a325db4369152";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1608f0df09f49733fb813983106fa2ec";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"699a723fa4b2f62c610097fb589c2591";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b2105ccda51e0bdec816c4aa618701e8";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"3b71e722c579009ca3efb3dec2f27fc1";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6689ef79f8c3c4617c15b016487eb3df";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6f5714d7a0be4a1c002b2f928dc57bd9";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7c30634aac606a5d49dd3b0ea29d06e0";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d31470c8acb14314662a7671276d105c";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"65173d1cf7fc0bd9eafe0d1f6e793d5f";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"e4e7f883f9576ac4eb5d11e8b6d28ba9";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f84907a1d5810613c46cecaafdb61e50";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4d4e4e2999c5e64cb8c6773e9610c047";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4dd6862a5ea2fdfb8c33cf4d783d4a6d";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"95f7ad29e9daa8edd161387f6b32976c";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"58beb6672b8059d7c5bc8847a5743bd3";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f56962c2706c360e6ca992350989e9e2";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ae84f77810d9e38d4f73efb170dc9c84";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"3b2559fb54d6aa2dfd7fc7de3a0cc176";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"56bf5e579ff9b0f506274afb6071911e";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"e412eb0bd260a30d2edc5fdd27ef0967";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 34 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_128_192 <= '1';

        wait until rising_edge(clk);

        reset_128_192 <= '0';
        valid_128_192 <= '1';
        key_128_192 <= 192x"8bbd6b2f42f378f27612c7e8924dbea9ab616040e1abfa8b";
        nonce_128_192 <= 64x"73213530f0022e2e";

        data_in_128_192 <= 128x"3673249837e79b91b893d2621d8cd312";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"46278fe815ad6ec134007bf9f87fa1a4";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b3e952999db8adf43b364c084d8b076a";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"92a3cfd30c921041133b84799b5f0e4f";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4113e9708c7faa49f72e3e461fa0f493";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"58f812676e29b8c5de2ee1b1b49240a1";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"745fee71a56d56917a2c4888075289c7";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"fad1e6a3829825ffcb9639b9a35da454";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b646ba89f48edf66cb3c557af1cd7d16";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"8f2d9c0aa79c4b1db4019c8e0fc7b42a";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"38f42634ca8fa707ad6644d6f1897475";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d028241bd42cfecd08ca18761b7be5ff";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6707248d1bc6c3e1671fe147a9db89d3";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4833f67dfa6062975d26178a23128813";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d40adb72cff6528c6938ce07197eaeb0";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ba3d45f328987ae6359b1728cde0b5f9";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"2ac9c20a5e35766cdd2b5f0970418b70";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"a0d6742163f43c2f694e4153243e25cb";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7ca5cb1f8d7602abd2f8a35bc862c114";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"da51df2b93b3b735251ef9c0fcf4cdc2";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7e09fbd94e6dff1743db4bd433f6d1a8";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7656207f320f54b977cfb2316aacbc19";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c081cab6b4f01231125733228c9a0039";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bd960e1e57708d6e3933bc2f1618bed";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c0754fc8423b8c39d274f031af4d71ad";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"781fa9e7b19d8d5608b0d9071b83a337";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"141ee02dfe672b47b0db9b8c28b06b1";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"e1915b4d9f7633765087246885631869";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"e24cfd4e053281dd8690e295d6bd2351";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f5e1cf7dc5308341c90369402c1bc91b";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"3e0d0b3ff342b1e3e5a04c9de077b442";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"888836fe15466faeb33bfb17feb158c6";
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"5d7a91146b2acb385849cf5ef56519e2";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 34 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_128_192 <= '1';

        wait until rising_edge(clk);

        reset_128_192 <= '0';
        key_128_192 <= 192x"bba6ad3cd094d2af793dd40f1de16841a934abd11b4addce";
        nonce_128_192 <= 64x"cc4589b5bbd4b4ed";

        data_in_128_192 <= 128x"9602634b08453d3e6424d7ef4d433c1f";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"5fa7cb00816241bd5a57cde5f13fc40b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c2967bdf54f2206044672c65d1e0a50e";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"d4146a201da72b622fabcae12308d4fd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"c3e6652c0f5270a2115c3e9276181f28";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2034663baaa91ed47be1251abc125541";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4b3099ecd4364172b60b7264a69cfd32";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"a812c4d0eae128042c14c68f0a73a9a9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"746c8933eee69c71ee166b743841ed43";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"cb110ef8806dd8c51856d169a1fee9cf";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ed6fe79b8c56ab924f322470a2334974";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"52268c274056125ca1ddc5a325053d91";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"116b47e2e046054560ab75bf34b2a7da";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"5b5eea1f8eace752634ad5b9fd72a908";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"cb6228730aebe0870a5a61a06c87ecd1";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"64e26c6f3b48146954fe81bba3455904";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1cf7f935e6cc9e41768599decffd101";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"897e7d876bcf2a76c1d8f799f76077bb";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4cdaf00ed91a324f0fa9db4b6a3fea";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"eb76dbed28c432ffccbc2cbcc7439bed";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"27e4bbe60b08da959fee599a0878f6db";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"a607dc9d55bdbbf6fee99b49145e362c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"2b535d23de2d64b9980dda10dffd6f19";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"44444f7dada6b225c607fad901fe2e70";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"95e3f32914cca279a63cca7578405abf";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2de157ccb56ac802c76f432cdc5aa6c9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"be169d6bf290d831052d143c23a61526";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"7f571b982bc38de01d0820e0a24921ff";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1a0408e7cbabe5d7228c77158f8ac4cd";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"97e27d7a9c369f6d91219f59df240ae5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"9b86d80d10b8c060b580d3a313ab42c4";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"e40f2900db9029bfc0ca12168b088a26";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"33a70c3d1da5a563a939e190c6f1c3ad";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"a881692c8bf72e12e0305e2d74319877";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7cbb1bccef38123719a0f532d2197d93";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"5d1a74c36b35da2c04465ea7cabf5c57";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"793c8d791d793750148e9fb96ece0443";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"ee550e17de5dd6f9aabaa3a803c92eaa";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"fcb8f90c72187d18dc0ea928b7b61710";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"adc11d692762fbac29685a0e646e18a9";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"2b058a0ee3531771ba254533805c7d25";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"bfb84cdfa4978b1db87f0e55bc9b15ed";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"dae3c7202360db821a143f918a34065b";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"eec6c987b378e45d102bcf1640b0dc2a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6c10f97fd9836a1fbad8ae6a5f5ce777";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"65decf1a2d26904840131e33277b20ad";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"a0641fcb14abd4d22147c6f582ee1d86";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"6bd2729ba5160d17e71f767485883d44";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bafcd1c408fbfe11f54e888981acd529";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"7d90d1f86ca1c7a8ba71d93589d9a401";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"182165fc3f84747c8d943a55e11a4073";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"50abc4519af1b4564034dca41eb62178";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"60cdc9dbfea0eb70ca8b425cbaab6a44";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"33f78404808b20f6f281e24c8384841d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ea37651587543d515f2bf222e5782952";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"c2e4dc34a7f83cd9bb2332db45b259f2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"92659b42b2e120898fcb236252fb4fd4";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"584d26cf7243a0c0947bf82b8ed3aa4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4e84e106e8a743106473b9048beeb82c";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"cc5fbfe7f3be0a6c15ecb9108e383437";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"176f9018b18646ce90e494613dff332b";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"7814bf40683e8e1cfb99a06b6649e79";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d98d822467b41ee89ade0a942709483a";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"861ff6a278c499958c9ebc8a5984ae66";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bc3548c55d4609baf77740fcc70312b9";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"5b123a929b6f338a0665be98c138418d";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 34 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_128_192 <= '1';

        wait until rising_edge(clk);

        reset_128_192 <= '0';
        key_128_192 <= 192x"bba6ad3cd094d2af793dd40f1de16841a934abd11b4addce";
        nonce_128_192 <= 64x"cc4589b5bbd4b4ed";

        data_in_128_192 <= 128x"fecd9ade1c2116b150b549163da2827c";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"381dce21111244066e30d1ba4ed00818";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"bc491f65b16d6905c9acc7b59b23b44f";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"7f4265afef1a030cfba98e7520f37df2";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b3555dbd07e01fb6077940dc002c7b5f";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"82bca728ec2074955c5b6d490b7ffede";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"91e4c16c359a357846d7b401d6eae8fa";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"e4eb24a44e850ca118a03a93985cb514";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"75e744f3b4fcd67bc64de0ea61d03b95";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"6e800470b5560b631cef5445707f76c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"b920a330dc3b5782b15ca3f432ee7201";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"8606ebc492dbfdc913f60dff788afa15";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"6e207fc5058a917cbab58961e482652f";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"9028ad8677698480a0fdd91b23a83809";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"ab1611233e8ee792ffa2f76b5bb28e61";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"4d6e758b14b92ea4421f4828902a94ca";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d9d7d5cb2e76fd36fe6a1c57304d028a";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"1c2ca464ad5a14c79fce833719c613ba";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"fdfb53d09a83bbe3da66aa02626c0f";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"9482b15dff09ff3a4eeff333a8494a7e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"547829752174e95a54bc67381f6fc6";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"a203b2916793f6a967ab4d37799d0336";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"9188b8e34509b0bd0494feb765039f21";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"cf4d9f876de0f539253a974c607402ca";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"608cf49e81fd12782472c5143b3ea4ce";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"c55f2b17a0c9293a6c908b5dc30fe1c3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"5e1ea4b0b404ec4ce372fbb4b47007ba";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2308b506cf31d2c4125b65b14483cf58";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4a109af10ae0576c18921eaf91f6b662";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"298a7d8a3efc91f057f599d1732ae464";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"cce5ec07ccf3d24aca86e4781dd7dd5";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"baaafc6c71daae439ac352cc961516b5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4efc6b9a4bf9de98617d3fdaa5ad1614";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"50ecb7bfa9333123166533672c97f169";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4767935b17448afb22058a5e9f4b1320";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"60fbba8f1cc99fcc1ddbb059ffb9c71b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"8b4a2d3d8a8e50d0bb183390ae3a4947";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2fc1ea7da3b0cc064d6bbd5da64b62d5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"dfaaed2c6098c0c30b5763c664a28d98";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"1b13a405b484db42e58000cf427585d8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"2a1e4c74aa615c034bbaf415bf04dca";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"641d257116d91fc5be85039460fc74e8";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"1a4045c7d4f937da02bfeb1833cd0086";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"b4f6783a240c499ba9c633e27c113797";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"4b38e7e4cd2bb610c594e2aaa07569c0";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"b3e1da1173de1a9e87f3aa2b2c0eb235";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f53bb15feee50f1119f5ea50ff342e24";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2ce42e415961640123d8c4800e67287c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"acd7af126988b956ba52005eb7259b36";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"10afa9613b2d1fc9eded54e339e6f58f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"67abc5f3c7e51bbcbdc1c1ba6d80ac2e";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"6f283a3270a22d8ec3c02b36ea727bf4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"f1a7e55777c254d53231d04ad9d73f94";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"1eff10783985577fc069f48d5c5815b0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"7c2e753791a1852e7bb8f0625a7b8b62";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"dc4133147f1fe654a90aa00650807f5e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d1b6c1ae347ca4b5e9c5db5e2c7efe05";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"db45d35da3328206f963aee196f90129";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"d5f0d70f04ca997edec479ec10b07a87";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2e215337eab5f50a9f2a5843af335720";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"77396aab29c4d78d257eb3f3d92e5315";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"2c8aee2d70910cca4fd0fda21c32a1de";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"78621966024a02044916c9fac3cfde45";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"6b7a00d8dec0efbf60339ee9a8b12cca";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_192 <= 128x"36df558d8273fa0883e0a1ca9ae28b7";
        valid_128_192 <= '1';
        wait until rising_edge(clk);
        valid_128_192 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_192 <= 128x"23ca4739ce5e761b7b59a1c0bd08b032";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 34 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_128_192: process
    begin

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"3673249837e79b91b893d2621d8cd312") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"46278fe815ad6ec134007bf9f87fa1a4") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"b3e952999db8adf43b364c084d8b076a") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"92a3cfd30c921041133b84799b5f0e4f") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4113e9708c7faa49f72e3e461fa0f493") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"58f812676e29b8c5de2ee1b1b49240a1") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"745fee71a56d56917a2c4888075289c7") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"fad1e6a3829825ffcb9639b9a35da454") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"b646ba89f48edf66cb3c557af1cd7d16") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"8f2d9c0aa79c4b1db4019c8e0fc7b42a") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"38f42634ca8fa707ad6644d6f1897475") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d028241bd42cfecd08ca18761b7be5ff") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"6707248d1bc6c3e1671fe147a9db89d3") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4833f67dfa6062975d26178a23128813") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d40adb72cff6528c6938ce07197eaeb0") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"ba3d45f328987ae6359b1728cde0b5f9") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"2ac9c20a5e35766cdd2b5f0970418b70") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"a0d6742163f43c2f694e4153243e25cb") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7ca5cb1f8d7602abd2f8a35bc862c114") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"da51df2b93b3b735251ef9c0fcf4cdc2") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7e09fbd94e6dff1743db4bd433f6d1a8") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7656207f320f54b977cfb2316aacbc19") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"c081cab6b4f01231125733228c9a0039") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"bd960e1e57708d6e3933bc2f1618bed") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"c0754fc8423b8c39d274f031af4d71ad") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"781fa9e7b19d8d5608b0d9071b83a337") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"141ee02dfe672b47b0db9b8c28b06b1") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"e1915b4d9f7633765087246885631869") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"e24cfd4e053281dd8690e295d6bd2351") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"f5e1cf7dc5308341c90369402c1bc91b") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 29 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"3e0d0b3ff342b1e3e5a04c9de077b442") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 30 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"888836fe15466faeb33bfb17feb158c6") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 31 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"5d7a91146b2acb385849cf5ef56519e2") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 32 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"e08aec96f4159113cac4b9e6778d028c") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"3288a67e030c98e85e2408fa70dc4769") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7d87d79311705ee3343b4fb0912d791d") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"1677013ba8e19b8321ab9e3dfdf4ff09") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"abfa4f2cb188604884ddf869b8163f1a") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"9d0a4fac67aaa0688dcfb198f0e51f30") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"6d9635ef1426a5dc3536763b4768a5c9") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"b7aa3d917a282c8a8b67e0d305d79967") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"ea264afbbd3ee93c57bd270bbe633c9d") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4b8ff2b49ddd6df0329b638600bc698b") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"e33725eeddf06a9dc3b9b3acd4efad3e") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"72e99ed16b3bc4cdcd4a30f2c5062250") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4896c62cb397b350838a325db4369152") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"1608f0df09f49733fb813983106fa2ec") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"699a723fa4b2f62c610097fb589c2591") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"b2105ccda51e0bdec816c4aa618701e8") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"3b71e722c579009ca3efb3dec2f27fc1") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"6689ef79f8c3c4617c15b016487eb3df") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"6f5714d7a0be4a1c002b2f928dc57bd9") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7c30634aac606a5d49dd3b0ea29d06e0") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d31470c8acb14314662a7671276d105c") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"65173d1cf7fc0bd9eafe0d1f6e793d5f") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"e4e7f883f9576ac4eb5d11e8b6d28ba9") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"f84907a1d5810613c46cecaafdb61e50") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4d4e4e2999c5e64cb8c6773e9610c047") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4dd6862a5ea2fdfb8c33cf4d783d4a6d") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"95f7ad29e9daa8edd161387f6b32976c") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"58beb6672b8059d7c5bc8847a5743bd3") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"f56962c2706c360e6ca992350989e9e2") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"ae84f77810d9e38d4f73efb170dc9c84") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 29 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"3b2559fb54d6aa2dfd7fc7de3a0cc176") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 30 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"56bf5e579ff9b0f506274afb6071911e") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 31 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"e412eb0bd260a30d2edc5fdd27ef0967") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 32 Failed!" severity error;


        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"fecd9ade1c2116b150b549163da2827c") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"bc491f65b16d6905c9acc7b59b23b44f") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"b3555dbd07e01fb6077940dc002c7b5f") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"91e4c16c359a357846d7b401d6eae8fa") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"75e744f3b4fcd67bc64de0ea61d03b95") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"b920a330dc3b5782b15ca3f432ee7201") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"6e207fc5058a917cbab58961e482652f") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"ab1611233e8ee792ffa2f76b5bb28e61") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d9d7d5cb2e76fd36fe6a1c57304d028a") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"fdfb53d09a83bbe3da66aa02626c0f") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"547829752174e95a54bc67381f6fc6") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"9188b8e34509b0bd0494feb765039f21") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"608cf49e81fd12782472c5143b3ea4ce") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"5e1ea4b0b404ec4ce372fbb4b47007ba") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4a109af10ae0576c18921eaf91f6b662") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"cce5ec07ccf3d24aca86e4781dd7dd5") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4efc6b9a4bf9de98617d3fdaa5ad1614") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4767935b17448afb22058a5e9f4b1320") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"8b4a2d3d8a8e50d0bb183390ae3a4947") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"dfaaed2c6098c0c30b5763c664a28d98") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"2a1e4c74aa615c034bbaf415bf04dca") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"1a4045c7d4f937da02bfeb1833cd0086") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4b38e7e4cd2bb610c594e2aaa07569c0") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"f53bb15feee50f1119f5ea50ff342e24") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"acd7af126988b956ba52005eb7259b36") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"67abc5f3c7e51bbcbdc1c1ba6d80ac2e") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"f1a7e55777c254d53231d04ad9d73f94") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7c2e753791a1852e7bb8f0625a7b8b62") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d1b6c1ae347ca4b5e9c5db5e2c7efe05") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d5f0d70f04ca997edec479ec10b07a87") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 29 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"77396aab29c4d78d257eb3f3d92e5315") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 30 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"78621966024a02044916c9fac3cfde45") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 31 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"36df558d8273fa0883e0a1ca9ae28b7") report "128-Bit Block, 192-Bit Key, CTR Encryption Test 32 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"9602634b08453d3e6424d7ef4d433c1f") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"c2967bdf54f2206044672c65d1e0a50e") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"c3e6652c0f5270a2115c3e9276181f28") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4b3099ecd4364172b60b7264a69cfd32") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"746c8933eee69c71ee166b743841ed43") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"ed6fe79b8c56ab924f322470a2334974") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"116b47e2e046054560ab75bf34b2a7da") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"cb6228730aebe0870a5a61a06c87ecd1") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"1cf7f935e6cc9e41768599decffd101") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4cdaf00ed91a324f0fa9db4b6a3fea") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"27e4bbe60b08da959fee599a0878f6db") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"2b535d23de2d64b9980dda10dffd6f19") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"95e3f32914cca279a63cca7578405abf") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"be169d6bf290d831052d143c23a61526") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"1a0408e7cbabe5d7228c77158f8ac4cd") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"9b86d80d10b8c060b580d3a313ab42c4") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"33a70c3d1da5a563a939e190c6f1c3ad") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"7cbb1bccef38123719a0f532d2197d93") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"793c8d791d793750148e9fb96ece0443") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"fcb8f90c72187d18dc0ea928b7b61710") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"2b058a0ee3531771ba254533805c7d25") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"dae3c7202360db821a143f918a34065b") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"6c10f97fd9836a1fbad8ae6a5f5ce777") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"a0641fcb14abd4d22147c6f582ee1d86") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"bafcd1c408fbfe11f54e888981acd529") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"182165fc3f84747c8d943a55e11a4073") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"60cdc9dbfea0eb70ca8b425cbaab6a44") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"ea37651587543d515f2bf222e5782952") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"92659b42b2e120898fcb236252fb4fd4") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"4e84e106e8a743106473b9048beeb82c") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 29 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"176f9018b18646ce90e494613dff332b") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 30 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"d98d822467b41ee89ade0a942709483a") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 31 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_192 = '1';
        assert (data_out_128_192=128x"bc3548c55d4609baf77740fcc70312b9") report "128-Bit Block, 192-Bit Key, CTR Decryption Test 32 With Pause Failed!" severity error;

        report "128-Bit Block, 192-Bit Key, CTR Test Done." severity note;
    end process;

tb_ctr_set_128_256: process
    begin
        -- Encryption test
        reset_128_256 <= '1';

        wait until rising_edge(clk);

        reset_128_256 <= '0';
        valid_128_256 <= '1';
        key_128_256 <= 256x"df0644a8c3d7df292368db81da34effa04cb4dadd98efec68fdeab3c158423a5";
        nonce_128_256 <= 64x"aae0a7644fd43443";

        data_in_128_256 <= 128x"c445964acdb9ccc100dcfdbc413b8e8";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2d661445bb61ef9d3ad12632c2254484";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f497b5a65c1ed1f5c8e8868fe5158377";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f3971943a640ca97fc88e170620012a7";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"fc06d3deadb3a8a79e9e44c587b8d77e";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"35b592e56b3190f4e55ef7495e3fafbf";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"98a98ba60a2581e9b83fb64a6463137f";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"1e1dd8c91a7859b39147d0ebca1e7cd";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2c1f0b0bce7774272280d9ae2cd8130";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"337faf64c6839f4a2749913f6a372851";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"211acf9ea2d9281b94334bb0103ba901";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c9aadaa6e440aa7ce95361bfee628c9a";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e20e222447d35352c019fdfa510020c1";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"73d0c8bfe2fb8f04c6eb245e4b7bd27a";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7dbcc5f769d144d1860e7019579dc1fb";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"8431e88c4427635ecf186b915466accc";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ca968927719426694deaa29bdebec758";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"abaf920966be149c5503513e88c24eab";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"fdf156226751d1a4ee08db6155d8e17f";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"edbc59fe47c2e637c176eadbe5173c41";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d739bb9e36cc66a403a7590ab25cc9a3";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c0b2ae8b77887200b6bd58d6e8c2215d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"bd45242f6db6cc9a6735f3564c7c9c38";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"edb52ad7db3d977bd3d69412bd60bb3e";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"eb5dc17d213b37eaaeb405f1d006434c";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"30bb83947a31daf12dcbb10ef7a15f3b";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"9fe1662d2bba5e48fe31866ff37b9601";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"13f333af31660e65ecdc1273f0dfb9ca";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"80aaf97e454b57c1ee874f00de906481";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"96561c9429efcdfc81992dc5d7488a76";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7c261cc8a94f30d62f595bc0dad16c2b";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3f848dfcefd622d77b3402f41f13fea5";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"1dc11ea22f06771ef7f6b5996f1c1ff4";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"8410ebdf0ded0f89f059a06dd7fab5bc";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 35 loop
            wait until rising_edge(clk);
        end loop;

        -- Decryption test
        reset_128_256 <= '1';

        wait until rising_edge(clk);

        reset_128_256 <= '0';
        valid_128_256 <= '1';
        key_128_256 <= 256x"df0644a8c3d7df292368db81da34effa04cb4dadd98efec68fdeab3c158423a5";
        nonce_128_256 <= 64x"aae0a7644fd43443";

        data_in_128_256 <= 128x"29bedfebd47d73891fcb8f00485a29d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3206ddce0d570209d1089025695f04d5";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7086411378b34a6b05c04bcadb9dbdb3";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7badf16e8444b0edd48c14e1f6fae4b1";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"1194629623bb0c532e68917e6a575b5";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c409a76fa35935d1e9a763fe8d2447dc";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ec1117cecdbb49a6959e00987a18f2cb";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"41db4f8aafa003b39acf418e38d3a016";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"5d709a8eb3a91c92ec617ad01a473ea3";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2b069df8ac5bb6ed5ba3f15e10c0bc09";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ae3fab95941cf7dc2186e6851dce5044";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7de76e7f4485b3488ea11f4c5e5d20c8";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"113c2856d2c8f71d01da354a3819314d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"53d525aac5942cbd3d0ba7fea5646f49";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3034389fbc4503e7ee6d05152fc06016";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"36aaeabb1c58474983444fe7964cc791";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"9f245029e88a005e9625257b44e099e4";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"60db03653aac6bfde624bb40cdb9fbce";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c71bf8deb8a76b5a2590ccddad7e6830";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3f0994c79ef1b19d3de67dba27058780";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"323a0e1ff9ed765b8e2b8b5dc77ae486";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"99973e593a80c9a0f6758e7dce6ebb43";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"633dcb34521c9c14f99baca0d49c18ab";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3a4a7c68d16e8ffa79702a7d29910634";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e7ee16fe9714848b91ee6c0e596df87f";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"76d61d0d183dc1ee652af36dccdcbdff";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"5366160b11746cf39e5d24312bf20552";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2d18f807561abef2e1a7a521039dcccf";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2236ae6ce0ed9f1348fd6742e19a8d8d";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"90a33c45be9092f948a535d14c26e93b";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c596053ec3bafcda862b3d680b758124";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d18f60597f28834cac820c389fccf03a";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"73a1d64c420409c0cbe391be7c7882cf";
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d2ab9ca972fdc3f2e1c76b7b1ab684e6";
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 35 loop
            wait until rising_edge(clk);
        end loop;

        -- Encryption test with pause
        reset_128_256 <= '1';

        wait until rising_edge(clk);

        reset_128_256 <= '0';
        key_128_256 <= 256x"5bee11e1a5660feb35b996bd901d169d25ab34772328d866975e2ac2f08df7c1";
        nonce_128_256 <= 64x"18867eb519912186";

        data_in_128_256 <= 128x"281bb255cfc76634cea323b493df0c5a";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c5d21579191f3240cb4ced8b9b97e907";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c1c30b57dd56dae36bd2623a140895d0";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"2bdccad03027bdbd981f25ed0c7c9761";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"deaf525273ec1e79dd159d1d830d98ee";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"855f27d43303cc12a8964ce0c132222a";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"a440ccb988c15972ec737312d0a58c1f";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"91627297fdf3aecebd9a324e932b99a5";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"6b8f76fae8471a9a237f7edbc754841d";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"4dc557e294ad651639e72e2acabfcd94";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"21d98c6456eebfe7f5a182c5d246fd22";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"122594275aa2795069a0b95592ecd51d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"5c0d4feb8fc57f7beed5c0dab11edb43";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c43b5096d39e4b1147ab46abf685b1f3";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d03e6d922b243c589743dbc8fba435db";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"9067f7264ce68c9319b6edfad219c778";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"1cc39cbd3e078fa717c98c2e151a3787";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d17d4cc0e8bb1f2998d38b06a4545742";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e781c71bfd6291167a764f1333c4eb7a";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d22428c03bc3f21f6e95a644022b6290";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"a7806577d864fd60f863fe14b7b52ef6";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d00fb0684b3d1b2a770bd8a791fd7815";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"cb1dad0d0717eb473104f7c5f1525077";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"209ae9d11744bed8cc2fce640b31ec7e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"43a9da5b546e8226604ff4fedb690711";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"bbe7dec42cdd930399063e5b6237e31e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"71638db040af906697046d7c5ae44257";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d0fce12b67c6e2b264fe79c20a77e6a1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f86f1d33bfe19e5a84e9b5ffe89a006d";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"84cf74466b82e781a14d7071519ff558";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"dfa1084f4fc076bf09d31730f2ef2d45";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"6a4a7f7008415966ad7b787f3efde143";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d8821713e97a194e6ef93741721e4596";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"365d3eed327bb556916263b72f1d4b70";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"bca281f1c1c7f10be0467889390b72fa";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c1e1b6e14b2d72131e82b4bb3335219c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"8590a11a03cd3231794824aebeb6533a";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"cb5740704e0422b4bb9f636e5477afc1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"654075adbace4b0898989aded1dda656";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"6a430fc7b8772d29938dc1b92e352409";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"dad107d7cccf980db6aaa6d2fdab0bc2";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"a1bfefca8f6262db20f4eaaf631c3308";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f45a6a8736e11fc9564220e6cfc2df16";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d05366ccb051460d9f78e41ee237056f";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"4b2bac3c5950d2bd900e7701f888932e";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"664aaa398354e04f374049d33a4bcaab";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"b9f15b792d53f13c29a9464bcd024ec0";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"2a4be525e134e7a5273dad161c6d0e35";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"cf130e07331fcd7247f559efb76db463";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"6a8640178be6aeb42e00ecbfca1871c6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"5a3d4eac1e682c1ff26b659bf85cfc9e";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"5dce8477c9e1893ec3fb37430361194e";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"4d42c1502783643360c3746cbc6bf04b";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"b71df25e3756af5183dc01010b63983c";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ffa857c8b5f284e0417358fdcfc30c95";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c78e0f4845224c799cf52508aac487b1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"dd761afc2aee0157d3e4df8f9f747716";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"317588ff44296fe796df4c083fc9f149";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f3cfeea6aac411580716e1dd67ddf42d";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d6dffc21b1c2ed561ae3237faa884965";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d2c1d26b13e14526d2e922b3e80a2294";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"4b385492d4c6700b5f0099167df8b7f0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"6966437363eca19aed3696ce2f914af5";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"1b95cd28b276417343ce0b81fee2f56b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"91c73e1dad358ffc13addef2140d016e";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"572de2ffeaaa5a3e31dbd1d548e003be";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3747414b1140e8ae892324d63ffdd31f";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"3302a5cad4ae04b3fab2a7803dbe0be0";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 35 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;

        -- Decryption test with pause
        reset_128_256 <= '1';

        wait until rising_edge(clk);

        reset_128_256 <= '0';
        key_128_256 <= 256x"5bee11e1a5660feb35b996bd901d169d25ab34772328d866975e2ac2f08df7c1";
        nonce_128_256 <= 64x"18867eb519912186";

        data_in_128_256 <= 128x"9c3ca9a05d24220d80a780aa1ef62ea0";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"88df03070b320459ab46afee8898a682";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"5d814c9f3bb21cc7f6d122f305e56bdb";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"bc896faf4cf4627782dcf73633744da6";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3fd9560528acc253a158ca8bb8dbaced";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"5a5915c28d87b7e8ac91b72f6c14b828";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"c6b36f84a27cd1b8d809203db3aedb0e";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c2411753bd3a98bdcc583f50d8d02c0d";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"e089a7502d7253c6dcf47215425af6f";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"4b6250dae645eef27c6d07e32c8941bd";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"18782cd9e872375ebf3b2a7cfd30e18d";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"13e34b3d3d946990b092a5ff948c2d43";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"415369d739743c7e7e2ab2ec20c09092";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"6d2db46a5bb955f9315745ccccfcd746";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"1a1ff1848f8f78822b081aa392ae0701";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"23f4fe14fc8ba273caa7b1c81a71a203";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ce1ce5d4afab7ee45df15c6687b3602c";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"81b377bd59eae69aa09c93ded12ea61b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"6cdee9e191a775eaff30712d6c0a0375";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"75fe000cc40732b4ef1772f4100cfe80";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d461cba999a0c1c7b3101425138e8abc";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"488d6a212415f2a37bef34f04fc3489b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ee27531279313aad305b86abbd071b2c";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"10fb5581cccb4dfbb0a1baa56921c1c0";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3ce78aa76a77353596a46d2126839728";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c34c3f471171c2942d71602397ec1a40";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"94aa232ea773346090331ec768e3fff5";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c8dc79b90e79b9407f819dbe8d7025b";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"dfbe8461b16124930cf59f2c667e476a";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"8615ad73699303f1bde82282fc76ff58";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ae623aa295d30c8190a40d215c216c79";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"3ed27848c6950d85e31b328e3a326205";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d46a55dfc0015019cad8db97604473bf";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"f323e4341bbf9922a6db74d1a7486875";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3467c9ebba7b952e6bf4910cd75f8f1c";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"4bc3915a2539ed269af1e66f890974e4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"9d83325a625e21bf1fa55154efc052ac";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"55b1f1c6059251e1de0a09a6a886e763";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"78400082a44415b7b114ea62e2b9ede5";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"495565827e54ed03eef42592ec1c6fe4";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"acfd0378e28c59c032e2934ff7172fa2";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"357245f9173235659dc257bde19dad46";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"85e8a24a1fa569dcc65663045cabe9b";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"20979829cc898b6a733db528d4323934";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"ed2660fd30a0dc8967b0533d1b8de827";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"55b3b1acc34920a7fcfa3a3b47f050aa";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f516d6ce73a489c1145081f4f34282d4";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"bb8bb9ae57e061c60494305d7194a9f1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"83ab9054894f468a22d1aa5ad027957c";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"47595fb338b4372600cea03b7d52dce";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"a1cbd495bc250a84ad1d93ca5c288103";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"89d78ab394be4e35a0e38dd6f7003585";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"114114f83e89b7b5adf785bf66ea8054";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"5073039f1e6ad906e25cf3afdac79c04";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"2370752f6aa0d6717c4d1f4535705918";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"d5d0a12d17bcd32324b441266f1f7a15";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f7abc1eec00c250a970323cd13dc4e81";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"8e6b81a3e9edc59ca80ab2000cfcbe46";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d397e3e059d4f74092bb34b648d8f5cf";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"a7b0a957c0fa5031326e1983f6bd16ac";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"3c1eaa06e73d0c989e0076b5d0a3630d";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"4962073ba0f9986ab2363b7ea221c908";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"d014a7f35e22fd5c96aaff93f31ac85f";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"dd82ab3e28685bdd02c81d1173f19747";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"f35915cf7883e4e3d35247ac8cbad25f";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"c48418135eabd8f7178234e80cb771b1";
        wait for 20 ns;
        wait until rising_edge(clk);

        data_in_128_256 <= 128x"7e56386068d8ecb89645b1f93da24c56";
        valid_128_256 <= '1';
        wait until rising_edge(clk);
        valid_128_256 <= '0';
        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.
        data_in_128_256 <= 128x"39e65a53dd59195f39745c90aaf5cc09";
        wait for 20 ns;
        wait until rising_edge(clk);

        -- Wait for enough periods so that the all values passed through the pipeline.
        for i in 0 to 35 loop
            wait for 20 ns;
            wait until rising_edge(clk);
        end loop;
    end process;

tb_ctr_check_128_256: process
    begin

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"29bedfebd47d73891fcb8f00485a29d") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3206ddce0d570209d1089025695f04d5") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"7086411378b34a6b05c04bcadb9dbdb3") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"7badf16e8444b0edd48c14e1f6fae4b1") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"1194629623bb0c532e68917e6a575b5") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c409a76fa35935d1e9a763fe8d2447dc") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ec1117cecdbb49a6959e00987a18f2cb") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"41db4f8aafa003b39acf418e38d3a016") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"5d709a8eb3a91c92ec617ad01a473ea3") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"2b069df8ac5bb6ed5ba3f15e10c0bc09") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ae3fab95941cf7dc2186e6851dce5044") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"7de76e7f4485b3488ea11f4c5e5d20c8") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"113c2856d2c8f71d01da354a3819314d") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"53d525aac5942cbd3d0ba7fea5646f49") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3034389fbc4503e7ee6d05152fc06016") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"36aaeabb1c58474983444fe7964cc791") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"9f245029e88a005e9625257b44e099e4") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"60db03653aac6bfde624bb40cdb9fbce") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c71bf8deb8a76b5a2590ccddad7e6830") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3f0994c79ef1b19d3de67dba27058780") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"323a0e1ff9ed765b8e2b8b5dc77ae486") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"99973e593a80c9a0f6758e7dce6ebb43") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"633dcb34521c9c14f99baca0d49c18ab") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3a4a7c68d16e8ffa79702a7d29910634") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"e7ee16fe9714848b91ee6c0e596df87f") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"76d61d0d183dc1ee652af36dccdcbdff") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"5366160b11746cf39e5d24312bf20552") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"2d18f807561abef2e1a7a521039dcccf") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"2236ae6ce0ed9f1348fd6742e19a8d8d") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"90a33c45be9092f948a535d14c26e93b") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 29 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c596053ec3bafcda862b3d680b758124") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 30 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d18f60597f28834cac820c389fccf03a") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 31 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"73a1d64c420409c0cbe391be7c7882cf") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 32 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d2ab9ca972fdc3f2e1c76b7b1ab684e6") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 33 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c445964acdb9ccc100dcfdbc413b8e8") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 0 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"2d661445bb61ef9d3ad12632c2254484") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 1 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f497b5a65c1ed1f5c8e8868fe5158377") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 2 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f3971943a640ca97fc88e170620012a7") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 3 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"fc06d3deadb3a8a79e9e44c587b8d77e") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 4 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"35b592e56b3190f4e55ef7495e3fafbf") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 5 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"98a98ba60a2581e9b83fb64a6463137f") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 6 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"1e1dd8c91a7859b39147d0ebca1e7cd") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 7 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"2c1f0b0bce7774272280d9ae2cd8130") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 8 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"337faf64c6839f4a2749913f6a372851") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 9 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"211acf9ea2d9281b94334bb0103ba901") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 10 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c9aadaa6e440aa7ce95361bfee628c9a") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 11 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"e20e222447d35352c019fdfa510020c1") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 12 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"73d0c8bfe2fb8f04c6eb245e4b7bd27a") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 13 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"7dbcc5f769d144d1860e7019579dc1fb") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 14 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"8431e88c4427635ecf186b915466accc") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 15 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ca968927719426694deaa29bdebec758") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 16 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"abaf920966be149c5503513e88c24eab") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 17 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"fdf156226751d1a4ee08db6155d8e17f") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 18 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"edbc59fe47c2e637c176eadbe5173c41") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 19 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d739bb9e36cc66a403a7590ab25cc9a3") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 20 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c0b2ae8b77887200b6bd58d6e8c2215d") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 21 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"bd45242f6db6cc9a6735f3564c7c9c38") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 22 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"edb52ad7db3d977bd3d69412bd60bb3e") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 23 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"eb5dc17d213b37eaaeb405f1d006434c") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 24 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"30bb83947a31daf12dcbb10ef7a15f3b") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 25 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"9fe1662d2bba5e48fe31866ff37b9601") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 26 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"13f333af31660e65ecdc1273f0dfb9ca") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 27 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"80aaf97e454b57c1ee874f00de906481") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 28 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"96561c9429efcdfc81992dc5d7488a76") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 29 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"7c261cc8a94f30d62f595bc0dad16c2b") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 30 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3f848dfcefd622d77b3402f41f13fea5") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 31 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"1dc11ea22f06771ef7f6b5996f1c1ff4") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 32 Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"8410ebdf0ded0f89f059a06dd7fab5bc") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 33 Failed!" severity error;


        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"9c3ca9a05d24220d80a780aa1ef62ea0") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"5d814c9f3bb21cc7f6d122f305e56bdb") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3fd9560528acc253a158ca8bb8dbaced") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c6b36f84a27cd1b8d809203db3aedb0e") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"e089a7502d7253c6dcf47215425af6f") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"18782cd9e872375ebf3b2a7cfd30e18d") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"415369d739743c7e7e2ab2ec20c09092") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"1a1ff1848f8f78822b081aa392ae0701") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ce1ce5d4afab7ee45df15c6687b3602c") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"6cdee9e191a775eaff30712d6c0a0375") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d461cba999a0c1c7b3101425138e8abc") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ee27531279313aad305b86abbd071b2c") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3ce78aa76a77353596a46d2126839728") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"94aa232ea773346090331ec768e3fff5") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"dfbe8461b16124930cf59f2c667e476a") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ae623aa295d30c8190a40d215c216c79") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d46a55dfc0015019cad8db97604473bf") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3467c9ebba7b952e6bf4910cd75f8f1c") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"9d83325a625e21bf1fa55154efc052ac") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"78400082a44415b7b114ea62e2b9ede5") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"acfd0378e28c59c032e2934ff7172fa2") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"85e8a24a1fa569dcc65663045cabe9b") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ed2660fd30a0dc8967b0533d1b8de827") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f516d6ce73a489c1145081f4f34282d4") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"83ab9054894f468a22d1aa5ad027957c") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"a1cbd495bc250a84ad1d93ca5c288103") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"114114f83e89b7b5adf785bf66ea8054") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"2370752f6aa0d6717c4d1f4535705918") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f7abc1eec00c250a970323cd13dc4e81") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d397e3e059d4f74092bb34b648d8f5cf") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 29 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3c1eaa06e73d0c989e0076b5d0a3630d") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 30 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d014a7f35e22fd5c96aaff93f31ac85f") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 31 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f35915cf7883e4e3d35247ac8cbad25f") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 32 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"7e56386068d8ecb89645b1f93da24c56") report "128-Bit Block, 256-Bit Key, CTR Encryption Test 33 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"281bb255cfc76634cea323b493df0c5a") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 0 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"c1c30b57dd56dae36bd2623a140895d0") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 1 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"deaf525273ec1e79dd159d1d830d98ee") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 2 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"a440ccb988c15972ec737312d0a58c1f") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 3 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"6b8f76fae8471a9a237f7edbc754841d") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 4 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"21d98c6456eebfe7f5a182c5d246fd22") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 5 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"5c0d4feb8fc57f7beed5c0dab11edb43") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 6 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d03e6d922b243c589743dbc8fba435db") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 7 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"1cc39cbd3e078fa717c98c2e151a3787") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 8 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"e781c71bfd6291167a764f1333c4eb7a") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 9 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"a7806577d864fd60f863fe14b7b52ef6") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 10 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"cb1dad0d0717eb473104f7c5f1525077") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 11 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"43a9da5b546e8226604ff4fedb690711") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 12 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"71638db040af906697046d7c5ae44257") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 13 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f86f1d33bfe19e5a84e9b5ffe89a006d") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 14 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"dfa1084f4fc076bf09d31730f2ef2d45") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 15 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d8821713e97a194e6ef93741721e4596") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 16 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"bca281f1c1c7f10be0467889390b72fa") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 17 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"8590a11a03cd3231794824aebeb6533a") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 18 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"654075adbace4b0898989aded1dda656") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 19 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"dad107d7cccf980db6aaa6d2fdab0bc2") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 20 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f45a6a8736e11fc9564220e6cfc2df16") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 21 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"4b2bac3c5950d2bd900e7701f888932e") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 22 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"b9f15b792d53f13c29a9464bcd024ec0") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 23 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"cf130e07331fcd7247f559efb76db463") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 24 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"5a3d4eac1e682c1ff26b659bf85cfc9e") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 25 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"4d42c1502783643360c3746cbc6bf04b") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 26 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"ffa857c8b5f284e0417358fdcfc30c95") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 27 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"dd761afc2aee0157d3e4df8f9f747716") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 28 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"f3cfeea6aac411580716e1dd67ddf42d") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 29 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"d2c1d26b13e14526d2e922b3e80a2294") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 30 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"6966437363eca19aed3696ce2f914af5") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 31 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"91c73e1dad358ffc13addef2140d016e") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 32 With Pause Failed!" severity error;

        wait until falling_edge(clk) and ready_128_256 = '1';
        assert (data_out_128_256=128x"3747414b1140e8ae892324d63ffdd31f") report "128-Bit Block, 256-Bit Key, CTR Decryption Test 33 With Pause Failed!" severity error;

        report "128-Bit Block, 256-Bit Key, CTR Test Done." severity note;
    end process;

end Behavioral;
