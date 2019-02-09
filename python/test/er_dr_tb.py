"""
MIT License

Copyright (c) 2019 Robert Guetzkow

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

from src import speck
import random


def generate_test_param(block_size, key_size, iterations=3):
    speck_cipher = speck.Speck(block_size, key_size)

    round_key = []
    x_out = random.randint(0, 2 ** speck_cipher.word_size - 1)
    y_out = random.randint(0, 2 ** speck_cipher.word_size - 1)

    print('tb_er_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('        constant BLOCK_SIZE: INTEGER := {};'.format(speck_cipher.block_size))
    print('        constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;')
    print('        variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);')
    print('        variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);')
    print('    begin')
    for i in range(iterations):
        x = x_out
        y = y_out
        rk = random.randint(0, 2 ** speck_cipher.word_size - 1)
        round_key.append(rk)
        x_out, y_out = speck_cipher.encryption_round(x, y, rk)

        print('        x := {}x"{:x}";'.format(speck_cipher.word_size, x))
        print('        y := {}x"{:x}";'.format(speck_cipher.word_size, y))
        print('        k := {}x"{:x}";'.format(speck_cipher.word_size, rk))
        print('        output := encryption_round(x, y, k, WORD_SIZE);')

        print('')
        print('        wait until rising_edge(clk);')
        print('')

        print('        assert (output(WORD_SIZE - 1 downto 0)={}x"{:x}") '
              'report "{}-Bit Encryption Round Test {} Failed! '
              'x_out_{} has wrong value." severity error;'.format(speck_cipher.word_size,
                                                                  x_out,
                                                                  speck_cipher.word_size,
                                                                  i,
                                                                  speck_cipher.word_size))

        print('        assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)={}x"{:x}") '
              'report "{}-Bit Encryption Round Test {} Failed! '
              'y_out_{} has wrong value." severity error;'.format(speck_cipher.word_size,
                                                                  y_out,
                                                                  speck_cipher.word_size,
                                                                  i,
                                                                  speck_cipher.word_size))
        print('')
    print('        report "{}-Bit Encryption Round Test Done." severity note;'.format(speck_cipher.word_size))
    print('    end process;')
    print('')

    print('tb_dr_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('        constant BLOCK_SIZE: INTEGER := {};'.format(speck_cipher.block_size))
    print('        constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;')
    print('        variable x, y, k: UNSIGNED(WORD_SIZE - 1 downto 0);')
    print('        variable output: UNSIGNED(BLOCK_SIZE - 1 downto 0);')
    print('    begin')
    for i in range(iterations):
        x = x_out
        y = y_out
        rk = round_key[len(round_key) - 1 - i]
        x_out, y_out = speck_cipher.decryption_round(x, y, rk)

        print('        x := {}x"{:x}";'.format(speck_cipher.word_size, x))
        print('        y := {}x"{:x}";'.format(speck_cipher.word_size, y))
        print('        k := {}x"{:x}";'.format(speck_cipher.word_size, rk))
        print('        output := decryption_round(x, y, k, WORD_SIZE);')

        print('')
        print('        wait until rising_edge(clk);')
        print('')

        print('        assert (output(WORD_SIZE - 1 downto 0)={}x"{:x}") '
              'report "{}-Bit Decryption Round Test {} Failed! '
              'x_out_{} has wrong value." severity error;'.format(speck_cipher.word_size,
                                                                  x_out,
                                                                  speck_cipher.word_size,
                                                                  i,
                                                                  speck_cipher.word_size))

        print('        assert (output(WORD_SIZE * 2 - 1 downto WORD_SIZE)={}x"{:x}") '
              'report "{}-Bit Decryption Round Test {} Failed! '
              'y_out_{} has wrong value." severity error;'.format(speck_cipher.word_size,
                                                                  y_out,
                                                                  speck_cipher.word_size,
                                                                  i,
                                                                  speck_cipher.word_size))

        print('')
    print('        report "{}-Bit Decryption Round Test Done." severity note;'.format(speck_cipher.word_size))
    print('    end process;')
    print('')


if __name__ == '__main__':
    random.seed(0)
    generate_test_param(32, 64)
    generate_test_param(64, 96)
    generate_test_param(128, 128)
