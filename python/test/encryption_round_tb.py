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
    speck_cipher.round_keys = speck_cipher.key_schedule(key)

    plaintext = random.randint(0, 2 ** block_size - 1)
    mask = 2 ** speck_cipher.word_size - 1
    word_0 = plaintext & mask
    word_1 = (plaintext >> speck_cipher.word_size) & mask

    round_keys = []
    sub_keys = []
    num_sub_keys = speck_cipher.key_byte_size // speck_cipher.word_byte_size  # Actually used subkeys

    for i in range(4):  # Max range of subkeys, 4 are required in the testbench because of fixed number of ports
        sub_key = key & mask
        sub_keys.append(sub_key)
        key = key >> speck_cipher.word_size

    round_keys.append(sub_keys[0])
    j = 1

    word_0_snapshot = []
    word_1_snapshot = []
    sub_keys_snapshot = []

    print('tb_er_set_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('    begin')

    for i in range(speck_cipher.rounds):
        print('        word_0_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                          speck_cipher.key_size,
                                                          speck_cipher.word_size,
                                                          word_0))
        print('        word_1_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                          speck_cipher.key_size,
                                                          speck_cipher.word_size,
                                                          word_1))
        print('        subkey_0_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                            speck_cipher.key_size,
                                                            speck_cipher.word_size,
                                                            sub_keys[0]))
        print('        subkey_1_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                            speck_cipher.key_size,
                                                            speck_cipher.word_size,
                                                            sub_keys[1]))
        print('        subkey_2_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                            speck_cipher.key_size,
                                                            speck_cipher.word_size,
                                                            sub_keys[2]))
        print('        subkey_3_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                            speck_cipher.key_size,
                                                            speck_cipher.word_size,
                                                            sub_keys[3]))
        print('        index_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                         speck_cipher.key_size,
                                                         speck_cipher.word_size,
                                                         i))
        print('        wait until rising_edge(clk);')
        print('')

        word_1, word_0 = speck_cipher.encryption_round(word_1, word_0, speck_cipher.round_keys[i])
        word_0_snapshot.append(word_0)
        word_1_snapshot.append(word_1)

        sub_keys[j], sub_keys[0] = speck_cipher.encryption_round(sub_keys[j], sub_keys[0], i)
        round_keys.append(sub_keys[0])
        temp = j + 1
        j = (temp % num_sub_keys) + (temp // num_sub_keys)

        sub_keys_snapshot.append(sub_keys.copy())

    print('    end process;')
    print('')

    print('tb_er_check_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('    begin')

    for i in range(speck_cipher.rounds):
        print('        wait until falling_edge(clk);')
        print('')
        print('        assert (word_0_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.word_size,
                                       word_0_snapshot[i],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
        print('        assert (word_1_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.word_size,
                                       word_1_snapshot[i],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
        print('        assert (subkey_0_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.word_size,
                                       sub_keys_snapshot[i][0],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
        print('        assert (subkey_1_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.word_size,
                                       sub_keys_snapshot[i][1],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
        print('        assert (subkey_2_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.word_size,
                                       sub_keys_snapshot[i][2],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
        print('        assert (subkey_3_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, Encryption Round Test {} Failed!" '
              'severity error;'.format(speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       speck_cipher.word_size,
                                       sub_keys_snapshot[i][3],
                                       speck_cipher.block_size,
                                       speck_cipher.key_size,
                                       i))
    print('')
    print('        report "{}-Bit Block, {}-Bit Key, Encryption Round Test Done." '
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
