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

    key = random.randint(0, 2 ** speck_cipher.key_size - 1)

    round_keys = []
    sub_keys = []

    mask = 2 ** speck_cipher.word_size - 1
    num_sub_keys = speck_cipher.key_byte_size // speck_cipher.word_byte_size

    for i in range(num_sub_keys):
        sub_key = key & mask
        sub_keys.append(sub_key)
        key = key >> speck_cipher.word_size

    round_keys.append(sub_keys[0])
    j = 1

    print('tb_key_schedule_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('        constant BLOCK_SIZE: INTEGER := {};'.format(speck_cipher.block_size))
    print('        constant KEY_SIZE: INTEGER := {};'.format(speck_cipher.key_size))
    print('        constant WORD_SIZE: INTEGER := BLOCK_SIZE / 2;')
    print('        variable subkey_0, subkey_1, subkey_2, subkey_3, round: UNSIGNED(WORD_SIZE - 1 downto 0);')
    print('        variable output: UNSIGNED(WORD_SIZE * 4 - 1 downto 0);')
    print('    begin')
    for i in range(speck_cipher.rounds):
        for idx, value in enumerate(sub_keys):
            print('        subkey_{} := {}x"{:x}";'.format(idx, speck_cipher.word_size, value))
        print('        round := {}x"{:x}";'.format(speck_cipher.word_size, i))
        print('        output := key_schedule_round(subkey_0, ')
        print('                                     subkey_1, ')
        print('                                     subkey_2, ')
        print('                                     subkey_3, ')
        print('                                     round, ')
        print('                                     KEY_SIZE, ')
        print('                                     WORD_SIZE);')

        print('')
        print('        wait until rising_edge(clk);')
        print('')

        sub_keys[j], sub_keys[0] = speck_cipher.encryption_round(sub_keys[j], sub_keys[0], i)
        for idx, value in enumerate(sub_keys):
            print('        assert (output(WORD_SIZE * {} - 1 downto WORD_SIZE * {})={}x"{:x}") '
                  'report "{}-Bit Block, {}-Bit Key, '
                  'Key Schedule Round Test {}, Index {} Failed!" severity error;'.format(idx + 1,
                                                                                         idx,
                                                                                         speck_cipher.word_size,
                                                                                         value,
                                                                                         speck_cipher.block_size,
                                                                                         speck_cipher.key_size,
                                                                                         i,
                                                                                         idx))
        print('')
        round_keys.append(sub_keys[0])
        temp = j + 1
        j = (temp % len(sub_keys)) + (temp // len(sub_keys))  # rotate between other sub keys range [1, len(sub_keys)-1]
    print('        report "{}-Bit Block, {}-Bit Key, Key Schedule Round Test Done." '
          'severity note;'.format(speck_cipher.block_size, speck_cipher.key_size))
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
