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
    word_size = block_size // 2

    speck_cipher = speck.Speck(block_size, key_size)
    mask = 2 ** block_size - 1

    key = random.randint(0, 2 ** key_size - 1)
    nonce = random.randint(0, 2 ** word_size - 1)
    plaintext = random.randint(0, 2 ** (block_size * speck_cipher.rounds) - 1)
    ciphertext_block = []
    plaintext_block = []

    print('tb_ctr_set_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('    begin')
    print('        -- Encryption test')
    print("        reset_{}_{} <= '1';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('')
    print('        wait until rising_edge(clk);')
    print('')
    print("        reset_{}_{} <= '0';".format(speck_cipher.block_size, speck_cipher.key_size))
    print("        valid_{}_{} <= '1';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('        key_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                   speck_cipher.key_size,
                                                   speck_cipher.key_size,
                                                   key))
    print('        nonce_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                     speck_cipher.key_size,
                                                     speck_cipher.word_size,
                                                     nonce))
    print('')

    for i in range(speck_cipher.rounds):
        block = (plaintext >> i * block_size) & mask
        iv = (nonce << word_size) | i
        encrypted_iv = speck_cipher.encrypt_block(iv, key)
        ciphertext_block.append(encrypted_iv ^ block)

        print('        data_in_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                           speck_cipher.key_size,
                                                           speck_cipher.block_size,
                                                           block))
        print('        wait until rising_edge(clk);')
        print('')
    print('        -- Wait for enough periods so that the all values passed through the pipeline.')
    print('        for i in 0 to {} loop'.format(speck_cipher.rounds + 1))
    print('            wait until rising_edge(clk);')
    print('        end loop;')
    print('')
    print('        -- Decryption test')
    print("        reset_{}_{} <= '1';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('')
    print('        wait until rising_edge(clk);')
    print('')
    print("        reset_{}_{} <= '0';".format(speck_cipher.block_size, speck_cipher.key_size))
    print("        valid_{}_{} <= '1';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('        key_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                   speck_cipher.key_size,
                                                   speck_cipher.key_size,
                                                   key))
    print('        nonce_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                     speck_cipher.key_size,
                                                     speck_cipher.word_size,
                                                     nonce))
    print('')

    for i in range(speck_cipher.rounds):
        block = ciphertext_block[i] & mask
        iv = (nonce << word_size) | i
        encrypted_iv = speck_cipher.encrypt_block(iv, key)
        plaintext_block.append(encrypted_iv ^ block)

        print('        data_in_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                           speck_cipher.key_size,
                                                           speck_cipher.block_size,
                                                           block))
        print('        wait until rising_edge(clk);')
        print('')
    print('        -- Wait for enough periods so that the all values passed through the pipeline.')
    print('        for i in 0 to {} loop'.format(speck_cipher.rounds + 1))
    print('            wait until rising_edge(clk);')
    print('        end loop;')
    print('')

    key_pause = random.randint(0, 2 ** key_size - 1)
    nonce_pause = random.randint(0, 2 ** word_size - 1)
    plaintext_pause = random.randint(0, 2 ** (block_size * speck_cipher.rounds) - 1)
    ciphertext_block_pause = []
    plaintext_block_pause = []

    print('        -- Encryption test with pause')
    print("        reset_{}_{} <= '1';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('')
    print('        wait until rising_edge(clk);')
    print('')
    print("        reset_{}_{} <= '0';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('        key_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                   speck_cipher.key_size,
                                                   speck_cipher.key_size,
                                                   key_pause))
    print('        nonce_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                     speck_cipher.key_size,
                                                     speck_cipher.word_size,
                                                     nonce_pause))
    print('')

    for i in range(speck_cipher.rounds):
        block = (plaintext_pause >> i * block_size) & mask
        iv = (nonce_pause << word_size) | i
        encrypted_iv = speck_cipher.encrypt_block(iv, key_pause)
        ciphertext_block_pause.append(encrypted_iv ^ block)

        print('        data_in_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                           speck_cipher.key_size,
                                                           speck_cipher.block_size,
                                                           block))
        print("        valid_{}_{} <= '1';".format(speck_cipher.block_size,
                                                   speck_cipher.key_size))
        print('        wait until rising_edge(clk);')
        print("        valid_{}_{} <= '0';".format(speck_cipher.block_size,
                                                   speck_cipher.key_size))
        print("        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.")
        print('        data_in_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                           speck_cipher.key_size,
                                                           speck_cipher.block_size,
                                                           random.randint(0, 2 ** block_size - 1)))
        print('        wait for 20 ns;')
        print('        wait until rising_edge(clk);')
        print('')
    print('        -- Wait for enough periods so that the all values passed through the pipeline.')
    print('        for i in 0 to {} loop'.format(speck_cipher.rounds + 1))
    print('            wait for 20 ns;')
    print('            wait until rising_edge(clk);')
    print('        end loop;')
    print('')
    print('        -- Decryption test with pause')
    print("        reset_{}_{} <= '1';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('')
    print('        wait until rising_edge(clk);')
    print('')
    print("        reset_{}_{} <= '0';".format(speck_cipher.block_size, speck_cipher.key_size))
    print('        key_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                   speck_cipher.key_size,
                                                   speck_cipher.key_size,
                                                   key_pause))
    print('        nonce_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                     speck_cipher.key_size,
                                                     speck_cipher.word_size,
                                                     nonce_pause))
    print('')

    for i in range(speck_cipher.rounds):
        block = ciphertext_block_pause[i] & mask
        iv = (nonce_pause << word_size) | i
        encrypted_iv = speck_cipher.encrypt_block(iv, key_pause)
        plaintext_block_pause.append(encrypted_iv ^ block)

        print('        data_in_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                           speck_cipher.key_size,
                                                           speck_cipher.block_size,
                                                           block))
        print("        valid_{}_{} <= '1';".format(speck_cipher.block_size,
                                                   speck_cipher.key_size))
        print('        wait until rising_edge(clk);')
        print("        valid_{}_{} <= '0';".format(speck_cipher.block_size,
                                                   speck_cipher.key_size))
        print("        -- Add random data to inputs. This shouldn't affect the output when valid is '0'.")
        print('        data_in_{}_{} <= {}x"{:x}";'.format(speck_cipher.block_size,
                                                           speck_cipher.key_size,
                                                           speck_cipher.block_size,
                                                           random.randint(0, 2 ** block_size - 1)))
        print('        wait for 20 ns;')
        print('        wait until rising_edge(clk);')
        print('')
    print('        -- Wait for enough periods so that the all values passed through the pipeline.')
    print('        for i in 0 to {} loop'.format(speck_cipher.rounds + 1))
    print('            wait for 20 ns;')
    print('            wait until rising_edge(clk);')
    print('        end loop;')
    print('    end process;')
    print('')

    print('tb_ctr_check_{}_{}: process'.format(speck_cipher.block_size, speck_cipher.key_size))
    print('    begin')
    print('')
    for i in range(speck_cipher.rounds):
        print("        wait until falling_edge(clk) and ready_{}_{} = '1';".format(speck_cipher.block_size,
                                                                                   speck_cipher.key_size))
        print('        assert (data_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, '
              'CTR Encryption Test {} Failed!" severity error;'.format(speck_cipher.block_size,
                                                                       speck_cipher.key_size,
                                                                       speck_cipher.block_size,
                                                                       ciphertext_block[i],
                                                                       speck_cipher.block_size,
                                                                       speck_cipher.key_size,
                                                                       i))
        print('')

    for i in range(speck_cipher.rounds):
        print("        wait until falling_edge(clk) and ready_{}_{} = '1';".format(speck_cipher.block_size,
                                                                                   speck_cipher.key_size))
        print('        assert (data_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, '
              'CTR Decryption Test {} Failed!" severity error;'.format(speck_cipher.block_size,
                                                                       speck_cipher.key_size,
                                                                       speck_cipher.block_size,
                                                                       plaintext_block[i],
                                                                       speck_cipher.block_size,
                                                                       speck_cipher.key_size,
                                                                       i))
        print('')

    print('')
    for i in range(speck_cipher.rounds):
        print("        wait until falling_edge(clk) and ready_{}_{} = '1';".format(speck_cipher.block_size,
                                                                                   speck_cipher.key_size))
        print('        assert (data_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, '
              'CTR Encryption Test {} With Pause Failed!" severity error;'.format(speck_cipher.block_size,
                                                                                  speck_cipher.key_size,
                                                                                  speck_cipher.block_size,
                                                                                  ciphertext_block_pause[i],
                                                                                  speck_cipher.block_size,
                                                                                  speck_cipher.key_size,
                                                                                  i))

        print('')

    for i in range(speck_cipher.rounds):
        print("        wait until falling_edge(clk) and ready_{}_{} = '1';".format(speck_cipher.block_size,
                                                                                   speck_cipher.key_size))
        print('        assert (data_out_{}_{}={}x"{:x}") '
              'report "{}-Bit Block, {}-Bit Key, '
              'CTR Decryption Test {} With Pause Failed!" severity error;'.format(speck_cipher.block_size,
                                                                                  speck_cipher.key_size,
                                                                                  speck_cipher.block_size,
                                                                                  plaintext_block_pause[i],
                                                                                  speck_cipher.block_size,
                                                                                  speck_cipher.key_size,
                                                                                  i))
        print('')
    print('        report "{}-Bit Block, {}-Bit Key, CTR Test Done." '
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
