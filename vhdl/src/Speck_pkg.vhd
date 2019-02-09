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
-- Create Date: 31.01.2019 14:28:06
-- Module Name: Speck_pkg - Package
-- Project Name: Speck Cipher
-- Target Devices: Zedboard
-- Tool Versions: Vivado 2018.2, VHDL 2008
-- Description: A collection of functions for implementing the Speck cipher.
-- 
-- Dependencies: IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


package Speck_pkg is
    function num_rounds (block_size: in INTEGER; key_size: in INTEGER) return INTEGER;
    function r_shift_val_encrypt (word_size: in INTEGER) return INTEGER; 
    function l_shift_val_encrypt (word_size: in INTEGER) return INTEGER;
    function r_shift_val_decrypt(word_size: in INTEGER) return INTEGER;
    function l_shift_val_decrypt(word_size: in INTEGER) return INTEGER;    
    function rotr (data: in UNSIGNED; shift: in INTEGER) return UNSIGNED;
    function rotl (data: in UNSIGNED; shift: in INTEGER) return UNSIGNED;

    function encryption_round(x: in UNSIGNED; y: in UNSIGNED; k: in UNSIGNED; word_size: in INTEGER) return UNSIGNED;
    function decryption_round(x: in UNSIGNED; y: in UNSIGNED; k: in UNSIGNED; word_size: in INTEGER) return UNSIGNED;
    function key_schedule_round(subkey_0: in UNSIGNED; 
                                subkey_1: in UNSIGNED; 
                                subkey_2: in UNSIGNED; 
                                subkey_3: in UNSIGNED; 
                                round: in UNSIGNED; 
                                key_size: in INTEGER; 
                                word_size: in INTEGER) return UNSIGNED; 
end package Speck_pkg;

package body Speck_pkg is

    function num_rounds(block_size: INTEGER; key_size: INTEGER) return INTEGER is 
    begin
        if (block_size = 32) and (key_size = 64) then
            return 22;
        elsif (block_size = 48) and (key_size = 72) then
            return 22;
        elsif (block_size = 48) and (key_size = 96) then
            return 23;
        elsif (block_size = 64) and (key_size = 96) then
            return 26;
        elsif (block_size = 64) and (key_size = 128) then
            return 27;
        elsif (block_size = 96) and (key_size = 96) then
            return 28;
        elsif (block_size = 96) and (key_size = 96) then
            return 28;
        elsif (block_size = 96) and (key_size = 144) then
            return 29;
        elsif (block_size = 128) and (key_size = 128) then
            return 32;
        elsif (block_size = 128) and (key_size = 192) then
            return 33;
        elsif (block_size = 128) and (key_size = 256) then
            return 34;
        else
            return -1; -- all other combinations are not valid
        end if;
    end num_rounds;
    
    
    function r_shift_val_encrypt(word_size: INTEGER) return INTEGER is 
    begin
        if (word_size * 2 > 32) then
            return 8;
        else
            return 7;
        end if;
    end r_shift_val_encrypt;
    
    
    function l_shift_val_encrypt(word_size: INTEGER) return INTEGER is 
    begin
        if (word_size * 2 > 32) then
            return 3;
        else
            return 2;
        end if;
    end l_shift_val_encrypt;
    
    
    function r_shift_val_decrypt(word_size: INTEGER) return INTEGER is
    begin
        return l_shift_val_encrypt(word_size);
    end r_shift_val_decrypt;
    
    
    function l_shift_val_decrypt(word_size: INTEGER) return INTEGER is 
    begin
        return r_shift_val_encrypt(word_size);
    end l_shift_val_decrypt;
    
    function rotr(data: UNSIGNED; shift: INTEGER) return UNSIGNED is
    begin
        return unsigned(std_logic_vector(shift_right(data, shift)) or std_logic_vector(shift_left(data, data'length - shift)));
    end rotr;
    
    
    function rotl(data: UNSIGNED; shift: INTEGER) return UNSIGNED is    
    begin
        return unsigned(std_logic_vector(shift_left(data, shift)) or std_logic_vector(shift_right(data, data'length - shift)));
    end rotl;
    
    
    function encryption_round(x: UNSIGNED; y: UNSIGNED; k: UNSIGNED; word_size: INTEGER) return UNSIGNED is
        variable x_rotr, add_words, key_xor, y_rotl, xor_words: UNSIGNED(word_size-1 downto 0);
        constant r_shift: INTEGER := r_shift_val_encrypt(word_size);
        constant l_shift: INTEGER := l_shift_val_encrypt(word_size);
    begin
        x_rotr := rotate_right(x, r_shift);
        add_words := x_rotr + y;
        key_xor := add_words xor k;
        y_rotl := rotate_left(y, l_shift);
        xor_words := y_rotl xor key_xor;
        
        return xor_words & key_xor; --return y, x; Caller needs to split value
    end encryption_round;
    
    
    function decryption_round(x: UNSIGNED; y: UNSIGNED; k: UNSIGNED; word_size: INTEGER) return UNSIGNED is
        variable xor_words, y_rotr, key_xor, sub_words, rotl: UNSIGNED(word_size-1 downto 0);
        constant r_shift: INTEGER := r_shift_val_decrypt(word_size);
        constant l_shift: INTEGER := l_shift_val_decrypt(word_size);
    begin
        xor_words := y xor x;
        y_rotr := rotate_right(xor_words, r_shift);
        key_xor := x xor k;
        sub_words := key_xor - y_rotr;
        rotl := rotate_left(sub_words, l_shift);

        return y_rotr & rotl; --return y, x; Caller needs to split values
    end decryption_round;
    
    
    function key_schedule_round(subkey_0: UNSIGNED; 
                               subkey_1: UNSIGNED; 
                               subkey_2: UNSIGNED; 
                               subkey_3: UNSIGNED; 
                               round: UNSIGNED; 
                               key_size: INTEGER; 
                               word_size: INTEGER) return UNSIGNED is
        type SUBKEY_ARRAY is array (3 downto 0) of UNSIGNED(word_size - 1 downto 0);
        variable j: INTEGER;
        variable subkeys: SUBKEY_ARRAY;
        variable encryption_round_out: UNSIGNED(word_size * 2 - 1 downto 0);
        variable x_out, y_out: UNSIGNED(word_size - 1 downto 0);
    begin
            subkeys(0) := subkey_0;
            subkeys(1) := subkey_1;
            subkeys(2) := subkey_2;
            subkeys(3) := subkey_3;
              
            j := to_integer((round) mod (key_size / word_size - 1)) + 1; -- values only in range [1, KEY_SIZE / WORD_SIZE)
            
            encryption_round_out := encryption_round(subkeys(j), subkeys(0), round, word_size);
            x_out := encryption_round_out(word_size - 1 downto 0);
            y_out := encryption_round_out(word_size * 2 - 1 downto word_size);
            
            for i in subkeys'range loop
                if (i = 0) then
                    subkeys(i) := y_out;
                elsif (i = j) then
                    subkeys(i) := x_out;
                else
                    subkeys(i) := subkeys(i);
                end if;      
            end loop;
            
            return subkeys(3) & subkeys(2) & subkeys(1) & subkeys(0);  
    end key_schedule_round;

end package body Speck_pkg;
