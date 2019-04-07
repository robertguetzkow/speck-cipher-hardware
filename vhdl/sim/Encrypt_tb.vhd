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
-- Create Date: 23.01.2019 12:50:01
-- Module Name: Encrypt_tb - Behavioral
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: Testbench for the encryption pipeline entity.
-- 
-- Dependencies: Encrypt.vhd, IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Encrypt_tb is
end Encrypt_tb;

architecture Behavioral of Encrypt_tb is
    signal plaintext_32_64, ciphertext_32_64: UNSIGNED(32 - 1 downto 0);
    signal key_32_64: UNSIGNED(64 - 1 downto 0);
    
    signal plaintext_48_72, ciphertext_48_72: UNSIGNED(48 - 1 downto 0);
    signal key_48_72: UNSIGNED(72 - 1 downto 0);
    
    signal plaintext_48_96, ciphertext_48_96: UNSIGNED(48 - 1 downto 0);
    signal key_48_96: UNSIGNED(96 - 1 downto 0);
    
    signal plaintext_64_96, ciphertext_64_96: UNSIGNED(64 - 1 downto 0);
    signal key_64_96: UNSIGNED(96 - 1 downto 0);
    
    signal plaintext_64_128, ciphertext_64_128: UNSIGNED(64 - 1 downto 0);
    signal key_64_128: UNSIGNED(128 - 1 downto 0);
       
    signal plaintext_96_96, ciphertext_96_96: UNSIGNED(96 - 1 downto 0);
    signal key_96_96: UNSIGNED(96 - 1 downto 0);
    
    signal plaintext_96_144, ciphertext_96_144: UNSIGNED(96 - 1 downto 0);
    signal key_96_144: UNSIGNED(144 - 1 downto 0);
    
    signal plaintext_128_128, ciphertext_128_128: UNSIGNED(128 - 1 downto 0);
    signal key_128_128: UNSIGNED(128 - 1 downto 0);
    
    signal plaintext_128_192, ciphertext_128_192: UNSIGNED(128 - 1 downto 0);
    signal key_128_192: UNSIGNED(192 - 1 downto 0);
    
    signal plaintext_128_256, ciphertext_128_256: UNSIGNED(128 - 1 downto 0);
    signal key_128_256: UNSIGNED(256 - 1 downto 0);

    signal clk : std_logic := '0';
    constant CLK_HALF_PERIOD: TIME := 5 ns;
begin

clock: process
    begin
        wait for CLK_HALF_PERIOD;
        clk <= not clk; 
    end process;

Encrypt_32_64: entity work.Encrypt 
    generic map(32, 64) 
    port map (
        plaintext => plaintext_32_64,
        key => key_32_64,
        clk => clk,
        ciphertext => ciphertext_32_64
    );
    
Encrypt_48_72: entity work.Encrypt 
    generic map(48, 72) 
    port map (
        plaintext => plaintext_48_72,
        key => key_48_72,
        clk => clk,
        ciphertext => ciphertext_48_72
    );

Encrypt_48_96: entity work.Encrypt 
    generic map(48, 96) 
    port map (
        plaintext => plaintext_48_96,
        key => key_48_96,
        clk => clk,
        ciphertext => ciphertext_48_96
    );
        
Encrypt_64_96: entity work.Encrypt 
    generic map(64, 96) 
    port map (
        plaintext => plaintext_64_96,
        key => key_64_96,
        clk => clk,
        ciphertext => ciphertext_64_96
    );
        
Encrypt_64_128: entity work.Encrypt 
    generic map(64, 128) 
    port map (
        plaintext => plaintext_64_128,
        key => key_64_128,
        clk => clk,
        ciphertext => ciphertext_64_128
    );
        
Encrypt_96_96: entity work.Encrypt 
    generic map(96, 96) 
    port map (
        plaintext => plaintext_96_96,
        key => key_96_96,
        clk => clk,
        ciphertext => ciphertext_96_96
    );

Encrypt_96_144: entity work.Encrypt 
    generic map(96, 144) 
    port map (
        plaintext => plaintext_96_144,
        key => key_96_144,
        clk => clk,
        ciphertext => ciphertext_96_144
    );

Encrypt_128_128: entity work.Encrypt 
    generic map(128, 128) 
    port map (
        plaintext => plaintext_128_128,
        key => key_128_128,
        clk => clk,
        ciphertext => ciphertext_128_128
    );

Encrypt_128_192: entity work.Encrypt 
    generic map(128, 192) 
    port map (
        plaintext => plaintext_128_192,
        key => key_128_192,
        clk => clk,
        ciphertext => ciphertext_128_192
    );

Encrypt_128_256: entity work.Encrypt 
    generic map(128, 256) 
    port map (
        plaintext => plaintext_128_256,
        key => key_128_256,
        clk => clk,
        ciphertext => ciphertext_128_256
    );

tb_enc_set_32_64: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_32_64 <= 32x"82e2e662";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"7a024204";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"e87a1613";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"81332876";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"48268673";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"c17c6279";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"e6f4590b";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"4f65d4d9";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"bad640fb";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"af19922a";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"19c78df4";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"6f25e2a2";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"e9bb17bc";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"7a1d5006";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"42af9fc3";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"3983ca8";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"de1b372a";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"ded733e8";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"9148624f";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"f7b0b7d2";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"72ae2244";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

        plaintext_32_64 <= 32x"eece328b";
        key_32_64 <= 64x"6baa9455e3e70682";
        wait until rising_edge(clk);

    end process;

tb_enc_check_32_64: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 22 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_32_64=32x"45ff2487") report "32-Bit Block, 64-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"e3ad1c8e") report "32-Bit Block, 64-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"cefd3136") report "32-Bit Block, 64-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"8832ec5c") report "32-Bit Block, 64-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"922ee75a") report "32-Bit Block, 64-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"b2891b3") report "32-Bit Block, 64-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"21caf782") report "32-Bit Block, 64-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"8f72df04") report "32-Bit Block, 64-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"576d2dff") report "32-Bit Block, 64-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"f662751f") report "32-Bit Block, 64-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"54e04c27") report "32-Bit Block, 64-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"407e9d59") report "32-Bit Block, 64-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"f12af7f6") report "32-Bit Block, 64-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"e35cc74e") report "32-Bit Block, 64-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"fc55dbf0") report "32-Bit Block, 64-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"3eb9fd34") report "32-Bit Block, 64-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"3f3378d7") report "32-Bit Block, 64-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"76b84b08") report "32-Bit Block, 64-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"4e752aa2") report "32-Bit Block, 64-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"53fe9027") report "32-Bit Block, 64-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"568137ba") report "32-Bit Block, 64-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_32_64=32x"bce2e679") report "32-Bit Block, 64-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        report "32-Bit Block, 64-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_48_72: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_48_72 <= 48x"aa5e8c25166a";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"680a8a5006c1";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"9347966e1277";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"2eea71eacd05";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"a2536288e1a5";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"7bf5935ddd72";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"5e244a5308cc";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"10e12fcd81b5";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"8526a81ad477";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"235f79fdef7c";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"42acc1f254b8";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"4c91e07405eb";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"13c8ec62b2c8";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"2916d7ab7928";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"7893cfc6e625";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"6e2ed977e993";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"d6bef323ca74";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"8ce89466e472";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"fc3d73581a81";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"b6f8cb175a5a";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"a60d15166570";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

        plaintext_48_72 <= 48x"3b0f9cdf5a86";
        key_48_72 <= 72x"3fb4e1357d4a84eb03";
        wait until rising_edge(clk);

    end process;

tb_enc_check_48_72: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 22 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_48_72=48x"d4bf744daac9") report "48-Bit Block, 72-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"ab942a1ae63c") report "48-Bit Block, 72-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"4f1bf8e4886d") report "48-Bit Block, 72-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"b5c3c2fdf86b") report "48-Bit Block, 72-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"d65ed5700c05") report "48-Bit Block, 72-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"aebb0df99706") report "48-Bit Block, 72-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"595c2998f9f7") report "48-Bit Block, 72-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"efb55b2d0651") report "48-Bit Block, 72-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"c1a91f3f1b4e") report "48-Bit Block, 72-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"8dd3d0ceb715") report "48-Bit Block, 72-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"d59700f31c30") report "48-Bit Block, 72-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"930fae397331") report "48-Bit Block, 72-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"f15c207e39dc") report "48-Bit Block, 72-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"8daf1eb11059") report "48-Bit Block, 72-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"e4e5c52e1396") report "48-Bit Block, 72-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"a0b9ce370205") report "48-Bit Block, 72-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"f0a9cc29b643") report "48-Bit Block, 72-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"7b839a8259b7") report "48-Bit Block, 72-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"510af750db34") report "48-Bit Block, 72-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"120bef496878") report "48-Bit Block, 72-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"2c74aa71a516") report "48-Bit Block, 72-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_72=48x"cb8a27d73be2") report "48-Bit Block, 72-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        report "48-Bit Block, 72-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_48_96: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_48_96 <= 48x"6179d8570102";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"84c3e37952d";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"8ac5bb42e0b2";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"be7e38701a14";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"5749cb69ca38";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"da2d552116dd";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"1fd7d0dfae43";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"7003b29a8b06";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"25e2ae3b16ec";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"3fb706d599e8";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"6085a28f5ab0";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"3d489371a71f";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"2edd64264cd5";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"3b6afb0323a1";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"63a10589f877";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"f55e1fb797fa";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"1f46ccfdba9b";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"23d7428a1c22";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"24d938884479";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"9a24a59cec98";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"df4459acdd98";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"1f402e295065";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

        plaintext_48_96 <= 48x"ef2b80ee526e";
        key_48_96 <= 96x"a1515607964a870c7c879b74";
        wait until rising_edge(clk);

    end process;

tb_enc_check_48_96: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 23 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_48_96=48x"620d23a05844") report "48-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"bece06f82b9c") report "48-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"dac86445b814") report "48-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"d313329cc386") report "48-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"55bcf76c4b19") report "48-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"ae4456240389") report "48-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"a1173281f64f") report "48-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"22c81cc64acc") report "48-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"67364b72b770") report "48-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"734525237274") report "48-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"ee5fd3b0c8b") report "48-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"6a488aa7cee7") report "48-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"fc86533c0df3") report "48-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"4c5e62afb618") report "48-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"7ed748b3cde6") report "48-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"31c35a8c914") report "48-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"954a26c4bb05") report "48-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"9d23f752a1aa") report "48-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"70713a020cf") report "48-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"3dbb7f87c884") report "48-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"70d68655456f") report "48-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"261ab70b428e") report "48-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_48_96=48x"194508862b81") report "48-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        report "48-Bit Block, 96-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_64_96: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_64_96 <= 64x"91dc59efeb21a3f6";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"ac322c12b29c467d";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"c470f0e7f76fbfb8";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"ad1b8f60c9e4dab2";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"2975d279d86dbf11";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"402d0baf878b9f6b";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"ebe2136898c75205";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"2cc0f859aa6524ab";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"ae68690a78bc7175";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"eae2025e82339e23";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"5b6e4ae7a6208143";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"a859890cd670f668";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"8b5885ca0bb2c3f0";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"7b59051bf40048d7";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"b2d650af313b32b7";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"3d4a5d5128fafd04";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"72b8ff39a32c9b6f";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"dfe1b30791725f0a";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"9145de05b3ab1b2c";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"2a69acc70bf9c0ef";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"e245a4600004884c";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"53710f577e9cf84f";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"77863fe5d675ebf7";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"cffa6cddf963a7ef";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"fca055362169df82";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

        plaintext_64_96 <= 64x"50f0fc2b6ae04d52";
        key_64_96 <= 96x"3308fb2e642aad48fcfcfa81";
        wait until rising_edge(clk);

    end process;

tb_enc_check_64_96: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 26 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_64_96=64x"62cfef11cc4a6613") report "64-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"9154f8099ab8c8b7") report "64-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"c63efd7bd2934e6f") report "64-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"96392460540db580") report "64-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"9010af124c73f1d2") report "64-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"b264f58ac0f2333c") report "64-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"825c9dcd0a38e3a7") report "64-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"a5a5e20cf2ed4334") report "64-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"455cca555b965bb9") report "64-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"c5aa483323ab44f4") report "64-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"eb68fc01b22f2381") report "64-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"fd25e42020e20187") report "64-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"f6106c97b3ef2f0c") report "64-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"64d291941d4e00b9") report "64-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"b9c373abc9091358") report "64-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"9ac4e2787131dca2") report "64-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"33607893e919eeed") report "64-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"f4556b2cc40db0e9") report "64-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"c75765c05c6f7458") report "64-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"accded37ab8dbbf5") report "64-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"dc6222322a54a0a2") report "64-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"e79f3257c714785c") report "64-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"11ce8a545a8fc5fe") report "64-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"ff908c0dfb577f5e") report "64-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"55f6f5122017fbef") report "64-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_96=64x"fb4ecd5d92d21d03") report "64-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        report "64-Bit Block, 96-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_64_128: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_64_128 <= 64x"9cb017c18741ae91";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"2ea60b99fa7ff8bf";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"a0acf4c9658de17e";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"dc8215271da3b7e2";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"ad4041504c14982";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"ae55cdff34ab18fd";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"d974c146e8ec01b3";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"2da44da189b5b368";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"964ddb776025f0ae";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"2371ea2c0247145f";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"555a40854578bab3";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"9215f4f9edb95f2";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"29f2c3c74505f4f6";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"955d0e77fb5eb866";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"2130260c8c69778f";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"ef0a81ed3d5d60bc";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"ba8982dd85e69ea9";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"4c9a0ae15419eefc";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"7b2e1b82e89dc815";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"cff4c56bf9ea2c64";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"7aa56a181fd3c017";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"7f6b8793b318ad4c";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"4d4985dc09aedbd0";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"eb70ba6527d99a23";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"90823edaa0722aa0";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"16408169a38d8afc";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

        plaintext_64_128 <= 64x"15ace7a1ceca2ee3";
        key_64_128 <= 128x"c1378be5b7a28e0a03a8987936a98d74";
        wait until rising_edge(clk);

    end process;

tb_enc_check_64_128: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 27 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_64_128=64x"7f0ecc3f2db037a0") report "64-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"dc338fd3fcb98b40") report "64-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"a59eba9505abce3e") report "64-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"4c394b8493bb8c6b") report "64-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"f47abe38fbe26231") report "64-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"cdd05e4ff5f26f7f") report "64-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"349fe4b3763001ab") report "64-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"aa1d1ec40dffe9e0") report "64-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"1983eaaae9131dcc") report "64-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"116b8cace12f9020") report "64-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"9d2f8c5cb46d103e") report "64-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"59e7e267e3172b78") report "64-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"302f7ba8274459cc") report "64-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"49541ebdc5cb980f") report "64-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"739b522d094e2589") report "64-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"4c4b51d5261ebf0b") report "64-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"3fb23b429059751d") report "64-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"9cb0506e1b870f4e") report "64-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"9d9879320ecb9ba") report "64-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"9a26d2a0df0599ca") report "64-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"155b1ea42d401eb3") report "64-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"ea2c84594fba1bd8") report "64-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"1670b5861821bea0") report "64-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"c75bb2b12267d93f") report "64-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"faf537d67071dbcc") report "64-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"24e3ff6e98c86893") report "64-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_64_128=64x"8d90924e85f4615f") report "64-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
        wait until rising_edge(clk);

        report "64-Bit Block, 128-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_96_96: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_96_96 <= 96x"6c4c3935379deda1ade6c5e9";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"c6f0093395d1805142cb6d1d";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"5bc7fdeb31234efe6e648043";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"ad4ab155c09fcd8f739cd488";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"65e049937f411fed1e70e799";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"32ae2a201ac902ee25777cf0";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"ae0fdbc8a36bcb0167e98363";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"38018399ee6a8e2f9c19ed34";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"d17034ce51797350e6256403";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"c8bf23fb9a431f7a41c30359";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"953c178e61067a8cd7a3283c";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"ce9b2e70b4d4dfccb7d779cc";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"a1727f7ea5f24b6de6fec4b";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"a66dc4e21681081399f8a8f";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"d80d6a1cc2472fd603e9ba02";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"a7f5195cde62d43f261908b9";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"8147a8f45f0ef320f7f60e7f";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"809f292387a1798fe6addd9e";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"bf391fbb138c3460fd938adc";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"34c3494ac12ea9b8e7e13ed8";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"993ec8c6e6b106e289110af0";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"2e9583eabda17da2000fc63d";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"4124405b91fcfe8881c16e98";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"dc2151e17e56ac3d10cc8711";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"cf5e9ea362584ab368777bab";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"6af944e07b38785b0932f5b6";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"fc98c279cf6f111c26c06e67";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

        plaintext_96_96 <= 96x"9c9d03f309018aee69407be7";
        key_96_96 <= 96x"fa7ee0538974df5bff773ce";
        wait until rising_edge(clk);

    end process;

tb_enc_check_96_96: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 28 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_96_96=96x"3679f01552bfc972f119ecaa") report "96-Bit Block, 96-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"b092b60a9e9d7ea1732f958c") report "96-Bit Block, 96-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"51683580d06c8c425a1c7ba2") report "96-Bit Block, 96-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"602d76e163cce90242221bb7") report "96-Bit Block, 96-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"e2fe04dcac57e5c0235662f8") report "96-Bit Block, 96-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"24d288e900664974ec8dac47") report "96-Bit Block, 96-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"5b2df135d091ff3914c42f23") report "96-Bit Block, 96-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"1eb8d5e053f2fe4499cefcbc") report "96-Bit Block, 96-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"b9f5d7acaa52e736a0c1a4e0") report "96-Bit Block, 96-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"b3b23d54ca40f50ac2606165") report "96-Bit Block, 96-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"f5d486d0de2118cad38c774f") report "96-Bit Block, 96-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"e25c52173c43e287a3fb2d86") report "96-Bit Block, 96-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"5803419e83d2f355e32e977f") report "96-Bit Block, 96-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"c22eea45c53c9a4745cb7644") report "96-Bit Block, 96-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"e4a69a5b277e38ad88a17f06") report "96-Bit Block, 96-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"4075d2b0525a18d428d75a5a") report "96-Bit Block, 96-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"c25a1d10072998212a2f3fd6") report "96-Bit Block, 96-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"50ca8b2de7f9e8afea5f8025") report "96-Bit Block, 96-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"57aa5e6fb09608b8d72c4f42") report "96-Bit Block, 96-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"a2afcb024363e29f5deac2e4") report "96-Bit Block, 96-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"c420b73c414b368635fa6bff") report "96-Bit Block, 96-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"943ae20cd7845e5c11ba9a83") report "96-Bit Block, 96-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"bfff814fedc2c7971115de5a") report "96-Bit Block, 96-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"6960d88e2524ecad3d79c38b") report "96-Bit Block, 96-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"82d9308c39787eb0466e8a1f") report "96-Bit Block, 96-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"2e823f336f1e117bd847cc96") report "96-Bit Block, 96-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"8721c6eadca8ed19742daab4") report "96-Bit Block, 96-Bit Key, Encryption Test 26 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_96=96x"767288dddbd23c6f6f86c7da") report "96-Bit Block, 96-Bit Key, Encryption Test 27 Failed!" severity error;
        wait until rising_edge(clk);

        report "96-Bit Block, 96-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_96_144: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_96_144 <= 96x"52daad326c00984c734bb05";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"31e9ca8058bf3b9ea6245b59";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"c707aef9c6c3744cc88e03b6";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"a6855857567e5862ef151673";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"d960af85c9df7e444bdffa7d";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"f4dd05d51349747aa1cba182";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"a3c2c6fef2d9a38e6e4b8df";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"3acaaf82374a6cc9e0397e67";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"81d1bf066b8c66f28611f583";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"254bf7ae1d0ab994f20b575d";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"1ad1daaaef8d9ff015831fee";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"f45da406bbf9bb0127f9e728";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"5a3da367141b1a1b40a978bf";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"b1182d235bf806761f12a0e9";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"2d8b5b41590e83da586f1721";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"d3d1af353e0c8624aeba79";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"bf7b68ae1f8941b6e6a1a40b";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"b080e0035e7f503c4b1347f6";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"743c7e9d2fdeb0352452bc39";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"55c36c3d5cbbc08035475c5e";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"8222134550de4292390a9016";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"2f16fb50c13e66af3c9590d3";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"a9c72e7b6b770df15f59aa2c";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"99e8c82821da132cdc68d4fd";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"b3c161c313f2a37c64d02759";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"ed28508dbdaa3bfa6ab01563";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"3f80c31f15a5712c5ac4b6c7";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"605dd4d60ecfb95b877a2133";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

        plaintext_96_144 <= 96x"70f8dd9952177eb7e6b920da";
        key_96_144 <= 144x"f11819faa06e0c0a59677579501a62fda854";
        wait until rising_edge(clk);

    end process;

tb_enc_check_96_144: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 29 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_96_144=96x"fed9a1d4da5dcb42648d6826") report "96-Bit Block, 144-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"29a46237b19ba8c641889b6a") report "96-Bit Block, 144-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"b2b705e8ef6087b9de2ba85a") report "96-Bit Block, 144-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"4111078879fad1dae784bb07") report "96-Bit Block, 144-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"1212939128b60c9eddce1889") report "96-Bit Block, 144-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"25e01b26f79fa41eb48e9783") report "96-Bit Block, 144-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"ab53cf2a48ec48507846e29c") report "96-Bit Block, 144-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"bfcc3d76699b257e9a54e124") report "96-Bit Block, 144-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"e755efc44afb7822e8cf937") report "96-Bit Block, 144-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"a89b63f2ebbaae619f65c8f") report "96-Bit Block, 144-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"4e85675e9bf5b69450621bc3") report "96-Bit Block, 144-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"f07f262461c3f9b088026017") report "96-Bit Block, 144-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"a7f7b997e01811531e9d7bf9") report "96-Bit Block, 144-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"5bc90223d7f2026ea2421331") report "96-Bit Block, 144-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"949388fc6d0d2409514117b0") report "96-Bit Block, 144-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"b672b57717bcb4a49a8e91ed") report "96-Bit Block, 144-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"4a9738bdc011c3b745d2ebd7") report "96-Bit Block, 144-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"39736253679d1e2e7f7e714") report "96-Bit Block, 144-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"f38988ca317e2120017e7b31") report "96-Bit Block, 144-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"81e14f771b9e2cdce2dba970") report "96-Bit Block, 144-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"2ef6e62b9f971b457ccfe6fc") report "96-Bit Block, 144-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"26eeaf4d2f7f5dc2c64bba38") report "96-Bit Block, 144-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"a64b55457393df4ec6c5d732") report "96-Bit Block, 144-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"42fd26080cd6e54c23cd161") report "96-Bit Block, 144-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"18d69d2ad5aea85e31f9f21c") report "96-Bit Block, 144-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"2af858db71eeeaefbadbd2f8") report "96-Bit Block, 144-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"aa6221b35a62f4bd616c02c3") report "96-Bit Block, 144-Bit Key, Encryption Test 26 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"fe5b4963662703c05aa41ebd") report "96-Bit Block, 144-Bit Key, Encryption Test 27 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_96_144=96x"c526d4f9e37409b7340e8fa8") report "96-Bit Block, 144-Bit Key, Encryption Test 28 Failed!" severity error;
        wait until rising_edge(clk);

        report "96-Bit Block, 144-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_128_128: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_128_128 <= 128x"1bce35d8cbe88a3f2f7a304ff344c911";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"b02de52c9b050db28ee4fd021cb66f67";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"eda2fc4c7237d420b3dd77e1cbb02fe9";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"6e84f8ea6bf4d047c4841a8d2f751bde";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"c149fa8e7bb8c2f11624d318a32652e8";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"b2f11ef9d48644820078cb124b7350d1";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"37fef6b501fda698764657ca9e65736c";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"a100ed14fa92cd28c4c536fb1d4d1180";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"ad9d1f4217b18e6e78aff58ec058a332";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"fbe86a8ea1cf0d1d47b3df4167c21355";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"ab2212c9e23b580e4523dbbb1eeed219";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"71d04b0f656fa7e6b5c03f6f94e4cc44";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"cad00273120961ea0913508715d38ca9";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"dc66a27b6a325333116e8a6429deb984";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"1af55c2688083ebc35d4cd35a08c3a00";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"47534952c9c5fef1e76f8a76c74f11cd";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"a0f9c0749177b6d45f2e9167713eceb1";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"1eda4209b270af551f9078d52835bcdb";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"a1d20ebc5aa3892a4c88b9d8ab12fb53";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"7a0a02ba37cf80256a447a90be0a5a56";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"4cd8ef2471a8c9c60f6ab75bf55b2e5c";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"78b61daf5afb9565068a3c383739076a";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"ddfae808afd8643211035083fa999f9b";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"a8aa1e45c7cbc6201a4f7a165264961";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"92a651d7c069c542240397213a082921";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"54a8762b2b12c92c62565a955487b5c3";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"6f6ddf79affe2554e5aef699a5e3a719";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"e90f79f835783f662114c2d650ea1324";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"fbc59e92ca1209ad596305b371b221e4";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"a217cf253be957670884fd16636abf8c";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"7552c6e86953a1155a62ddc4e2091f49";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

        plaintext_128_128 <= 128x"7460d20d94b9cdb56e3c18c9ef1fa0a3";
        key_128_128 <= 128x"788c161ef3cc9d8a4b1678e45f20f406";
        wait until rising_edge(clk);

    end process;

tb_enc_check_128_128: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 32 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_128_128=128x"40d309a4a37188683dd171a6b7619efa") report "128-Bit Block, 128-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"95d5cd360541f6abab809a8dc86b1769") report "128-Bit Block, 128-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"be7246c32b83a974994a794477b66955") report "128-Bit Block, 128-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"d1e758aee8c212a561bd4414366a366a") report "128-Bit Block, 128-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"bfa830aad4ea55d9c70d160fe32f2190") report "128-Bit Block, 128-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"9a5e21fbc6a86f5706109c9eae477d40") report "128-Bit Block, 128-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"688612a877b8352e5878441f86cc1db2") report "128-Bit Block, 128-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"a2b2bb6cbbbf63839b22aa53406e2a65") report "128-Bit Block, 128-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"7c31325e3dbb6eab738a94a31d0ad11c") report "128-Bit Block, 128-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"7cb08cc1bffcd8cd13443a8f3f954270") report "128-Bit Block, 128-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"70177ba959536abc8cbcfa405e5f35f5") report "128-Bit Block, 128-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"9f0f1cd93a29428ccaf3e008a5d2eb38") report "128-Bit Block, 128-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"8d6ef56a1f567a32c6193f37ee6cbe6b") report "128-Bit Block, 128-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"47e2cec66f49bb374f4b3e679d11833f") report "128-Bit Block, 128-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"3f5ee8259d0938c7fb0ed21f197c5305") report "128-Bit Block, 128-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"2e18b53bf02b986ca1030d0e3f4898fc") report "128-Bit Block, 128-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"e94d1138420e0283745b33aee867db6c") report "128-Bit Block, 128-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"5cb20a9fb5182882c1e5f4a09ee93165") report "128-Bit Block, 128-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"1df1962587ed8898eb4c4b71e9ae328f") report "128-Bit Block, 128-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"d7820264faf9d237af12c6ecbae6c4de") report "128-Bit Block, 128-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"b370f6855930a8ca54f9e34328b3973f") report "128-Bit Block, 128-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"6bf443041c8da21daaed43e73af73858") report "128-Bit Block, 128-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"adada6fee63feccb38434f774cd986cc") report "128-Bit Block, 128-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"b55d58ac4b6250958f45290d154eeff9") report "128-Bit Block, 128-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"84c4fec55a6b70f8349a33f3c7353d18") report "128-Bit Block, 128-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"8821aaa680e6e5032728de531887ea83") report "128-Bit Block, 128-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"7304a34d93568030a28c9fb3a16bb28") report "128-Bit Block, 128-Bit Key, Encryption Test 26 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"6ac74a3198810780e46b3d113871ebcd") report "128-Bit Block, 128-Bit Key, Encryption Test 27 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"9967244b1b30534c2cd8696f034b61a9") report "128-Bit Block, 128-Bit Key, Encryption Test 28 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"c6143cfbbd9cfd91833596fce3b13c2a") report "128-Bit Block, 128-Bit Key, Encryption Test 29 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"d24d20bcefa4b2698788e5b66ae865a7") report "128-Bit Block, 128-Bit Key, Encryption Test 30 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_128=128x"8f2f5bbb431e8b5ed2a552fd4c5b530a") report "128-Bit Block, 128-Bit Key, Encryption Test 31 Failed!" severity error;
        wait until rising_edge(clk);

        report "128-Bit Block, 128-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_128_192: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_128_192 <= 128x"598ca3b429b108230d7422560b36f3cd";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"23f1b67e01d34690a795ac544a30f7cd";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"ebe0572c8ec9ea986581f9349bcfb1c4";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"9bbac83856e9b78d315e80807425f4e9";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"cb775e2415eb3a3de2014a459b3a0c89";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"e4bacd7874aba9fc8930d17952ab793f";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"b5aafef85a1282a0761585b4168705a";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"339d78f5d658b1b33012ae1c5882e3bb";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"4d236555bc5074acbaa172acac33f644";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"413008796279d944dc2897c684539813";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"3d6e2667b6651d6edf39ccaa580c79fc";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"1284b9d78d4e2753ef26a5b74e49df56";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"702dc88ab97fb3bb7ecc040c75ff93f0";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"fa98c1156980b561cf1accc1eaca3811";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"15eae9d21e3d59d070aaf52575e417dd";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"c3f3f74dd3861b58194665d33dbba3af";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"36a5be06eb52ee01e25e651269fcbef0";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"64fc0dbad44f85e7e2f88051c13c6688";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"7d7185913fee2fc72e2dffdff57b8a92";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"6f51ea78fea2a33a51d11bcd5a23754b";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"3b56735e45c596d442d01ba3a2652c9e";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"b63f83c6c89309e99d683a9e1e651ac1";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"3fafa2176a27241fbb9e5a022c2df3c2";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"83e9973b89181ba3bdee923101a6009e";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"3bcd6aec53ca8c05acb5959f4eb98768";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"9501e917496dc27b7af2f402a0e624f1";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"a283453695decd6e5df2e07353f04099";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"6544c97de0789f97213c121ccfdef303";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"fdc1293082ae752f2d4076bcf9cb2ee8";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"bb8917463c3da91136a52df9f8247e70";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"62759469c28d2ad53bd3147dd0f0c75d";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"a105725621ee302e974d9d499bc69882";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

        plaintext_128_192 <= 128x"5bce228b989bb03086c47b0606a8e22f";
        key_128_192 <= 192x"441030ae56525ce03725bd0c79c45c38b440ffe0413770e2";
        wait until rising_edge(clk);

    end process;

tb_enc_check_128_192: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 33 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_128_192=128x"357a8aa0f409d7dc3164a86b02b8478f") report "128-Bit Block, 192-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"a2a062656dccac2faeb708adda2d5ba2") report "128-Bit Block, 192-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"78704a86ad417af048603080f1fd30ee") report "128-Bit Block, 192-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"d994bf1dc350846a2e922491e71e1096") report "128-Bit Block, 192-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"ccfbc937924b7897a1ef3b2033a79cbf") report "128-Bit Block, 192-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"294c7ebd341ab479c6388fd44e5593ef") report "128-Bit Block, 192-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"d1739a1683da4e2389cfcc5b35db5b35") report "128-Bit Block, 192-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"10278f178641216c7bfee2e649281a25") report "128-Bit Block, 192-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"df0bbd7020f5b479555de6e5f038acc0") report "128-Bit Block, 192-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"25addb7b83a91aa6a1f56d609ba87ef8") report "128-Bit Block, 192-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"20db0ddd00e774c32fa5ced34afac400") report "128-Bit Block, 192-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"60d8ca2a5bb226420df89b4347db36d5") report "128-Bit Block, 192-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"23e3fee0f29c38ff911a82139a7f63df") report "128-Bit Block, 192-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"70d1e9a4c33cc60034b4bf7a7bf23de1") report "128-Bit Block, 192-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"180173dc704d6e57766a8f96ebfd08b4") report "128-Bit Block, 192-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"b0615d69d566461744a403134419f210") report "128-Bit Block, 192-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"b1479e3d68cc87b7021af4b252db690") report "128-Bit Block, 192-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"eff3a5b675aa9779d14aebaa628066b5") report "128-Bit Block, 192-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"b3ffbc1f5475bdbeb1312557372910b6") report "128-Bit Block, 192-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"580ae4d2e30b294826a8f9b7717e87e4") report "128-Bit Block, 192-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"ae8b563d57eb8d80a343e871362c1e74") report "128-Bit Block, 192-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"2c4139b549466861aef052aca9f10354") report "128-Bit Block, 192-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"b7f1f7c25a0bf76fc22c6871f253e1e8") report "128-Bit Block, 192-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"250e91ce4c11f30ee8516c13b86489b9") report "128-Bit Block, 192-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"b898aad65cf3b2596449bd067a7fc3f2") report "128-Bit Block, 192-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"62a2658899e21f8d0e467aa4c7d717c9") report "128-Bit Block, 192-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"20b2664c58066176e05376cbe1f789f8") report "128-Bit Block, 192-Bit Key, Encryption Test 26 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"e10d14a50d585371ea063a0131aee78a") report "128-Bit Block, 192-Bit Key, Encryption Test 27 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"fd8f5330f30731f8680a5789a6526486") report "128-Bit Block, 192-Bit Key, Encryption Test 28 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"1edba91fb51dc060e39d9a46781912a7") report "128-Bit Block, 192-Bit Key, Encryption Test 29 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"95f6070fe50eb73fecb7b6416701a71d") report "128-Bit Block, 192-Bit Key, Encryption Test 30 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"62d485f70c76707e13ccad30b43e7fd9") report "128-Bit Block, 192-Bit Key, Encryption Test 31 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_192=128x"d49c17735d857efa000e88358c63d5a5") report "128-Bit Block, 192-Bit Key, Encryption Test 32 Failed!" severity error;
        wait until rising_edge(clk);

        report "128-Bit Block, 192-Bit Key, Encryption Test Done." severity note;
    end process;

tb_enc_set_128_256: process
    begin
        wait until rising_edge(clk); -- First values need to be assigned on rising edge.

        plaintext_128_256 <= 128x"3fe65f90f631681ebf401e04b9f94ec6";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"a1645f58bb78eb2d0ee5144d8a1d8b42";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"a0b976c27db931ce05a0f4215a79b46a";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"32f594d0b82b61c3dd0c8660649def5";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"a9fa4ea6f8db1a4d584d3c020ff9d318";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"376e22a6ec071cf1e47638ec22c71d04";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"4fdc13515ba830dc245db6ca6f6a2196";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"27752fe61f68c6e689c0559bf4fa4a3";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"b476998dafc8128afb0a6a90bc52b34e";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"ebe7ef9190920b690abc847ec2537638";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"2bdb572063eaa07ff436498e68afe2b8";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"b3191702bb80d98dd70da545839137a6";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"f22a4fc63f2de8a82d20481ad216ad53";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"8fb87c76af044a8dd69db137c9a57cd1";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"a0e774869ed9c1241a895c62990e8f01";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"9a1ab3579d6c84af266b0d37b5c99b49";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"5bbdd1f416f14aad7f107645094c0230";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"c0c32da9bc49b58e298b7e5d5b1654ad";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"fa3222c4780afabf8cea309b49c94aa5";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"8d56206d920c3de988239867c5dd967b";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"74b7061c09ce15a8afd4fc7bef208346";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"58ba0bf3675e0c521eb95739b8acdd81";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"5a7583c0e02a35e9ae6b4c8e88644581";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"272eaa36e642965cde386aebea96abe6";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"a02ebb764a8b77da5cfa38b1583678ee";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"711fa10a0b2975c6918ff3582408c3c2";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"efa2ce128c83384811fba56e300a2187";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"a3af11d0a8ab29f1103393102b7bde99";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"48f3531c4fb7c3bb4408c04c6f446806";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"579e9a46fd768f635163de1d8df7a267";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"caa0a6796e83a7b2c857d8c3b4a06976";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"82e7448cc003745701847803d840fccb";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"c29ed120cddb2316cc68fd3f9d37da5c";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

        plaintext_128_256 <= 128x"7f3ab7dcb3390a6ea0b87e455abec113";
        key_128_256 <= 256x"9cd3bdf356af7370f2670d2f19b43da6253dfe34aaeb212c90ded295100f186";
        wait until rising_edge(clk);

    end process;

tb_enc_check_128_256: process
    begin
        wait until rising_edge(clk); -- First values are assigned on rising edge.

        -- Wait for enough periods so that the first value passed through the pipeline.
        for i in 0 to 34 loop
            wait until rising_edge(clk);
        end loop;

        assert (ciphertext_128_256=128x"aa6b74508396e8b764d8d84be057440a") report "128-Bit Block, 256-Bit Key, Encryption Test 0 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"bc243122af9f30b6f258eb62639ae3b4") report "128-Bit Block, 256-Bit Key, Encryption Test 1 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"4c553906840c9ce3fe535bcfe081bb65") report "128-Bit Block, 256-Bit Key, Encryption Test 2 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"879610eb4f54b7f4530ab9811bff7952") report "128-Bit Block, 256-Bit Key, Encryption Test 3 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"fa8821c9773470cda7a2b27c40f6b49f") report "128-Bit Block, 256-Bit Key, Encryption Test 4 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"3e1690d676e1e5232230ee4d2c2f8bab") report "128-Bit Block, 256-Bit Key, Encryption Test 5 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"8627ddb35f34e7dba085e0dfd7def87a") report "128-Bit Block, 256-Bit Key, Encryption Test 6 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"6c06e43640fb70370eaf6e618cc0d1ef") report "128-Bit Block, 256-Bit Key, Encryption Test 7 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"956269bf9af91518a0cdef9677311a56") report "128-Bit Block, 256-Bit Key, Encryption Test 8 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"6acdd98357e00a41b9fa17c3b3f799fc") report "128-Bit Block, 256-Bit Key, Encryption Test 9 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"25f444283f446fbb0aba79592d8ac252") report "128-Bit Block, 256-Bit Key, Encryption Test 10 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"e6ff6ec3dae72c855aa7c34264f614b4") report "128-Bit Block, 256-Bit Key, Encryption Test 11 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"ade3fae92abdee474edbd5d561cbb43a") report "128-Bit Block, 256-Bit Key, Encryption Test 12 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"4bc45f39a26c4439710a3269c5fda8da") report "128-Bit Block, 256-Bit Key, Encryption Test 13 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"8cd5042c052cbc32c5950318c3604e63") report "128-Bit Block, 256-Bit Key, Encryption Test 14 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"1fc28a48292aa25f17003c97bf63ad6d") report "128-Bit Block, 256-Bit Key, Encryption Test 15 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"32058dd80c25b3f3ff106d366cc4b087") report "128-Bit Block, 256-Bit Key, Encryption Test 16 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"41cae1d4a3164c430f036ca7e151649a") report "128-Bit Block, 256-Bit Key, Encryption Test 17 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"248a6b8c954d3d56a8d886bf917b1044") report "128-Bit Block, 256-Bit Key, Encryption Test 18 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"cb2cc07ab87cce3a7ae750bac831f329") report "128-Bit Block, 256-Bit Key, Encryption Test 19 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"36bb53230f76b317307cbf53e5558825") report "128-Bit Block, 256-Bit Key, Encryption Test 20 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"192159f1dc958ea0dd1aa4f3d1d6c4cc") report "128-Bit Block, 256-Bit Key, Encryption Test 21 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"715f95d9552c9e7b4497cc22d67d1979") report "128-Bit Block, 256-Bit Key, Encryption Test 22 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"2d5ac7b9ecf58316e048a5d1c87f9b08") report "128-Bit Block, 256-Bit Key, Encryption Test 23 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"5cd93d7cc79392f623bccab10f0ad0c3") report "128-Bit Block, 256-Bit Key, Encryption Test 24 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"9295c28fbbb57eecfa4f7186f878cb13") report "128-Bit Block, 256-Bit Key, Encryption Test 25 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"aca851017ec50b55b4ba746d3c8052e4") report "128-Bit Block, 256-Bit Key, Encryption Test 26 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"be5c029caad522173facb7cb89a7ae5") report "128-Bit Block, 256-Bit Key, Encryption Test 27 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"dc0f70e71e235cb92208d79895e11283") report "128-Bit Block, 256-Bit Key, Encryption Test 28 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"89534db5621451e50347f9b2ac262eb1") report "128-Bit Block, 256-Bit Key, Encryption Test 29 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"9c64cb6b577c5d806ef65918b8bcc84d") report "128-Bit Block, 256-Bit Key, Encryption Test 30 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"2728eaabb15566dec572411ff99f1") report "128-Bit Block, 256-Bit Key, Encryption Test 31 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"91067b3fa38c500caef59d8c0bf2a16c") report "128-Bit Block, 256-Bit Key, Encryption Test 32 Failed!" severity error;
        wait until rising_edge(clk);

        assert (ciphertext_128_256=128x"8080eff7501320733e4a320752236d8a") report "128-Bit Block, 256-Bit Key, Encryption Test 33 Failed!" severity error;
        wait until rising_edge(clk);

        report "128-Bit Block, 256-Bit Key, Encryption Test Done." severity note;
    end process;

end Behavioral;
