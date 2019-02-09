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


def generate_test_param(block_size, key_size):
    speck_cipher = speck.Speck(block_size, key_size)
    key = random.randint(0, 2 ** key_size - 1)

    ciphertext = []

    print('tb_enc_set_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('    begin')
    print('        wait until rising_edge(clk); -- First values need to be assigned on rising edge.')
    print('')

    for i in range(speck_cipher.rounds):
        plaintext = random.randint(0, 2 ** block_size - 1)
        ciphertext.append(speck_cipher.encrypt_block(plaintext, key))
        print('        plaintext_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                             speck_cipher.key_size,
                                                             speck_cipher.block_size,
                                                             plaintext))
        print('        key_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                       speck_cipher.key_size,
                                                       speck_cipher.key_size,
                                                       key))
        print('        wait until rising_edge(clk);')
        print('')
    print('    end process;')
    print('')

    print('tb_enc_check_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('    begin')
    print('        wait until rising_edge(clk); -- First values are assigned on rising edge.')
    print('')
    print('        -- Wait for enough periods so that the first value passed through the pipeline.')
    print('        for i in 0 to {} loop'.format(speck_cipher.rounds))
    print('            wait until rising_edge(clk);')
    print('        end loop;')
    print('')

    for i in range(speck_cipher.rounds):
        print('        assert (ciphertext_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.block_size,
                                       ciphertext[i],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
        print('        wait until rising_edge(clk);')
        print('')
    print('        report "{}-Bit Block, {}-Bit Key, Encryption Test Done." '
          'severity note;'.format(speck_cipher.block_size,
                                  speck_cipher.key_size))
    print('    end process;')
    print('')


if __name__ == '__main__':
    random.seed(0)
    generate_test_param(32, 64)
    generate_test_param(48, 72)
    generate_test_param(48, 96)
    generate_test_param(64, 96)
    generate_test_param(64, 128)
    generate_test_param(96, 96)
    generate_test_param(96, 144)
    generate_test_param(128, 128)
    generate_test_param(128, 192)
    generate_test_param(128, 256)
