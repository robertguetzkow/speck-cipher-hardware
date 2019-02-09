""" Speck Cipher Demo Implementation

This module implements the Speck cipher as described in NSA documents [0,1] and additionally basic cipher modes without
authentication.

-----------------------------------------------------
DO NOT USE THIS CODE TO HANDLE SENSITIVE INFORMATION!
-----------------------------------------------------
This code was originally written to verify the correctness our Speck hardware implementation. As such it is NOT meant
to be used as cryptography module. Its design is meant for testing, debugging and visualizing cryptographic operations.
The Speck cipher was also reject by ISO and therefore is not recommended to be used for sensitive data in general.

[0] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers,
    "The SIMON and SPECK Families of Lightweight Block Ciphers", Cryptology ePrint Archive, Report 2013/404,
    Available: https://eprint.iacr.org/2013/404.pdf

[1] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers,
    "SIMON and SPECK Implementation Guide", NSA Cybersecurity, June 26, 2018. [Online].
    Available: https://nsacyber.github.io/simon-speck/implementations/ImplementationGuide1.1.pdf

------------------------------------------------------------------------------
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

import sys
import random
import secrets
import argparse
from abc import ABC, abstractmethod
from collections import namedtuple
from typing import List, Tuple, NamedTuple, Callable


class BlockCipher(ABC):
    """ Abstract base class for cipher implementations.
    """
    def __init__(self, block_size, key_size):
        self.block_size = block_size
        self.key_size = key_size
        self.block_byte_size = block_size // 8
        self.key_byte_size = key_size // 8

    @abstractmethod
    def encrypt_block(self, plaintext: int, key: int):
        pass

    @abstractmethod
    def decrypt_block(self, ciphertext: int, key: int):
        pass


class Speck(BlockCipher):
    """ Speck cipher, originally designed by R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers
    """
    SpeckOptions = namedtuple('SpeckOptions', ['alpha', 'beta', 'rounds'])

    def __init__(self, block_size: int, key_size: int):
        """
        :param block_size: Block size in bits.
        :type block_size: int.
        :param key_size: Key size in bits.
        :type key_size: int.
        """
        self.valid_options = {
            ( 32,  64): self.SpeckOptions(alpha=7, beta=2, rounds=22),
            ( 48,  72): self.SpeckOptions(alpha=8, beta=3, rounds=22),
            ( 48,  96): self.SpeckOptions(alpha=8, beta=3, rounds=23),
            ( 64,  96): self.SpeckOptions(alpha=8, beta=3, rounds=26),
            ( 64, 128): self.SpeckOptions(alpha=8, beta=3, rounds=27),
            ( 96,  96): self.SpeckOptions(alpha=8, beta=3, rounds=28),
            ( 96, 144): self.SpeckOptions(alpha=8, beta=3, rounds=29),
            (128, 128): self.SpeckOptions(alpha=8, beta=3, rounds=32),
            (128, 192): self.SpeckOptions(alpha=8, beta=3, rounds=33),
            (128, 256): self.SpeckOptions(alpha=8, beta=3, rounds=34)
        }

        chosen_option = self.valid_options.get((block_size, key_size))

        if chosen_option is None:
            raise ValueError("Combination of block size {} and key size {} are not supported".format(block_size,
                                                                                                     key_size))
        self.alpha = chosen_option.alpha
        self.beta = chosen_option.beta
        self.rounds = chosen_option.rounds
        self.word_size = block_size // 2
        self.word_byte_size = self.word_size // 8

        self.key = None
        self.round_keys = []

        super().__init__(block_size, key_size)

    def rotate_right(self, x: int, bit_shift: int) -> int:
        """ Bit rotation in direct of the lower addresses. This function is named ROTR in the implementation guide.

        :param x: Value to rotate. Needs to have equal bit length to the word size.
        :type x: int.
        :param bit_shift: Number of bits to rotate.
        :return: Rotated value.
        :rtype: int.
        """
        mask = 2 ** self.word_size - 1
        return ((x >> bit_shift) | (x << (self.word_size - bit_shift))) & mask

    def rotate_left(self, x: int, bit_shift: int) -> int:
        """ Bit rotation in direct of the higher addresses. This function is named ROTL in the implementation guide.

        :param x: Value to rotate. Needs to have equal bit length to the word size.
        :type x: int.
        :param bit_shift: Number of bits to rotate.
        :return: Rotated value.
        :rtype: int.
        """
        mask = 2 ** self.word_size - 1
        return ((x << bit_shift) | (x >> (self.word_size - bit_shift))) & mask

    def encryption_round(self, x: int, y: int, k: int) -> Tuple[int, int]:
        """ Encrypts values by one round. This function is named ER in the implementation guide.

        :param x: First word that is half the block size.
        :type x: int.
        :param y: Second word that is half the block size.
        :type y: int.
        :param k: Round key to encrypt with.
        :return: Results of one encryption round of Speck.
        :rtype: Tuple[int, int].
        """
        x = self.rotate_right(x, self.alpha)
        x = (x + y) & (2 ** self.word_size - 1)  # bitwise & for masking outside of value range
        x ^= k
        y = self.rotate_left(y, self.beta)
        y ^= x

        return x, y

    def decryption_round(self, x: int, y: int, k: int) -> Tuple[int, int]:
        """ Decrypts values by one round. This function is named DR in the implementation guide.

        :param x: First word that is half the block size.
        :type x: int.
        :param y: Second word that is half the block size.
        :type y: int.
        :param k: Round key to encrypt with.
        :return: Results of one encryption round of Speck.
        :rtype: Tuple[int, int].
        """
        y ^= x
        y = self.rotate_right(y, self.beta)
        x ^= k
        x = (x - y) & (2 ** self.word_size - 1)  # bitwise & for masking outside of value range
        x = self.rotate_left(x, self.alpha)

        return x, y

    def key_schedule(self, key: int) -> List[int]:
        """ Computes all round keys for the encryption.

        First the number of required round keys are determined. Depending on the key length and word size up to
        four sub keys are used to calculate the round keys. The round keys are generated by encrypting pairs of
        sub keys with a counter as key. The pairs are always the first sub key and one other selected subkey,
        which is determined by a rotating index. The results of the sub key encryption overwrites the original
        sub keys. The result for the sub key with index 0 is always used as the round key.

        :param key: Key.
        :type key: int.
        :return: List of round keys.
        :rtype: List[int].
        """
        round_keys = []
        sub_keys = []

        mask = 2 ** self.word_size - 1
        num_sub_keys = self.key_byte_size // self.word_byte_size

        for i in range(num_sub_keys):
            sub_key = key & mask
            sub_keys.append(sub_key)
            key = key >> self.word_size

        round_keys.append(sub_keys[0])
        j = 1

        for i in range(self.rounds):
            sub_keys[j], sub_keys[0] = self.encryption_round(sub_keys[j], sub_keys[0], i)
            round_keys.append(sub_keys[0])
            temp = j + 1
            j = (temp % len(sub_keys)) + (temp // len(sub_keys))
            # rotate between other sub keys range [1, len(sub_keys)-1]

        return round_keys

    def encrypt_block(self, plaintext: int, key: int) -> int:
        """ Encrypts one block of plaintext.

        :param plaintext: Plaintext to encrypt.
        :type plaintext: int.
        :param key: Encryption key.
        :type key: int.
        :return: Ciphertext.
        :rtype: int.
        """
        return self.__process_block(plaintext, key, encrypt=True)

    def decrypt_block(self, ciphertext: int, key: int) -> int:
        """ Decrypts one block of ciphertext.

        :param ciphertext: Ciphertext to decrypt.
        :type ciphertext: int.
        :param key: Decryption key.
        :type key: int.
        :return: Plaintext.
        :rtype: int.
        """
        return self.__process_block(ciphertext, key, encrypt=False)

    def __process_block(self, data: int, key: int, encrypt: bool):
        """ Process one block of data.

        :param data: Data to process.
        :type data: int.
        :param key: Encryption/Decryption key.
        :type key: int.
        :return: Processed data.
        :rtype: int.
        """
        # Pre-compute key schedule, if not already done.
        if self.key != key:
            self.key = key
            self.round_keys = self.key_schedule(key)

        mask = 2 ** self.word_size - 1
        word_1 = data & mask
        word_2 = (data >> self.word_size) & mask

        if encrypt:
            for i in range(self.rounds):
                word_2, word_1 = self.encryption_round(word_2, word_1, self.round_keys[i])
        else:
            for i in range(self.rounds - 1, -1, -1):
                word_2, word_1 = self.decryption_round(word_2, word_1, self.round_keys[i])

        return (word_2 << self.word_size) | word_1


class Padding:
    @staticmethod
    def pad(data: int, data_byte_size: int, block_byte_size: int) -> Tuple[int, int]:
        """ Byte padding with 0x80 as marker and zero byte filling. Pads to full block size.

        :param data: Unpadded data.
        :type data: int.
        :param data_byte_size: Number of bytes in unpadded data.
        :type data_byte_size: int.
        :param block_byte_size: Pad to a multiple byte length of this value.
        :type block_byte_size: int.
        :return: Padded data and its size.
        :rtype: Tuple[int, int].
        """
        padding_byte_size = block_byte_size - data_byte_size % block_byte_size
        padding = 128 << (padding_byte_size - 1) * 8  # Padding marker
        padded_data = data << (padding_byte_size * 8) | padding

        return padded_data, padding_byte_size + data_byte_size

    @staticmethod
    def unpad(data: int, data_byte_size: int, block_byte_size: int) -> Tuple[int, int]:
        """ Removes byte padding by iteratively shifting the padded data until 0x80 is reached.

        :param data: Padded data.
        :type data: int.
        :param data_byte_size: Number of bytes in padded data.
        :type data_byte_size: int.
        :param block_byte_size: Padded data is padded to a multiple byte length of this value.
        :return: Unpadded data and its size.
        :rtype: Tuple[int, int].
        """
        if data_byte_size % block_byte_size != 0:
            raise ValueError("Input not properly padded.")

        i = 0
        mask = 2 ** 8 - 1
        padding_found = False

        for i in range(0, data_byte_size):
            if data & mask == 128:  # Check if least significant byte is padding marker
                padding_found = True
            data = data >> 8  # Shift to check next byte for padding end and to remove one byte of padding
            if padding_found:
                break

        if not padding_found:
            raise ValueError("Input has no padding.")

        return data, data_byte_size - (i + 1)


class Block:
    """ Helper for working with blocks.
    """
    @staticmethod
    def blocks_in_data(data_byte_size: int, block_byte_size: int) -> int:
        """ Number of blocks required to hold the data.

        :param data_byte_size: Number of bytes to store.
        :type data_byte_size: int.
        :param block_byte_size: Number of bytes in a block.
        :type block_byte_size: int.
        :return: Number of blocks required to store data.
        :rtype: int
        """
        return (data_byte_size + block_byte_size - 1) // block_byte_size


class CipherMode(ABC):
    """ Abstract class for cipher mode implementations.
    """
    def __init__(self, cipher: BlockCipher):
        self.cipher = cipher

    @abstractmethod
    def encrypt(self, plaintext: int, plaintext_byte_size: int, key: int):
        pass

    @abstractmethod
    def decrypt(self, ciphertext: int, ciphertext_byte_size: int, key: int):
        pass


class ECB(CipherMode):
    """ Electronic Code Bock (ECB)
    """
    class Parameter(NamedTuple):
        data_in: int
        data_out: int
        key: int
        mask: int
        counter: int

    def __init__(self, cipher: BlockCipher):
        super().__init__(cipher)

    def encrypt(self, plaintext: int, plaintext_byte_size: int, key: int) -> Tuple[int, int]:
        """ Encrypts every block of the plaintext with the same key.

        Byte padding is applied to the plaintext to reach full blocks.

        :param plaintext: Plaintext.
        :type plaintext: int.
        :param plaintext_byte_size: Number of bytes in plaintext.
        :type plaintext_byte_size: int.
        :param key: Encryption key.
        :type key: int.
        :return: Ciphertext and its size.
        :rtype: Tuple[int, int].
        """
        padded_plaintext, padded_byte_size = Padding.pad(plaintext, plaintext_byte_size, self.cipher.block_byte_size)
        num_blocks = Block.blocks_in_data(padded_byte_size, self.cipher.block_byte_size)

        ciphertext = 0
        mask = 2 ** self.cipher.block_size - 1

        for i in range(num_blocks):
            param = self.Parameter(data_in=padded_plaintext, data_out=ciphertext, key=key, mask=mask, counter=i)
            padded_plaintext, ciphertext = self.__process_next_block(param, self.__encrypt_block)

        return ciphertext, padded_byte_size

    def __encrypt_block(self, plaintext_block: int, key: int) -> int:
        """ Encrypts block using the cipher chosen during initialization.

        :param plaintext_block: Block of plaintext.
        :type plaintext_block: int.
        :param key: Encryption key.
        :type key: int.
        :return: Encrypted block.
        :rtype: int.
        """
        return self.cipher.encrypt_block(plaintext_block, key)

    def decrypt(self, ciphertext: int, ciphertext_byte_size: int, key: int) -> Tuple[int, int]:
        """ Decrypts every block of the plaintext with the same key.

        :param ciphertext: Ciphertext.
        :type ciphertext: int.
        :param ciphertext_byte_size: Number of bytes in ciphertext.
        :type ciphertext_byte_size: int.
        :param key: Decryption key.
        :type key: int.
        :return: Plaintext and its size.
        :rtype: Tuple[int, int].
        """
        num_blocks = Block.blocks_in_data(ciphertext_byte_size, self.cipher.block_byte_size)

        padded_plaintext = 0
        mask = 2 ** self.cipher.block_size - 1

        for i in range(num_blocks):
            param = self.Parameter(data_in=ciphertext, data_out=padded_plaintext, key=key, mask=mask, counter=i)
            ciphertext, padded_plaintext = self.__process_next_block(param, self.__decrypt_block)

        plaintext, plaintext_byte_size = Padding.unpad(padded_plaintext,
                                                       self.cipher.block_byte_size * num_blocks,
                                                       self.cipher.block_byte_size)

        return plaintext, plaintext_byte_size

    def __decrypt_block(self, ciphertext_block: int, key: int) -> int:
        """ Decrypts block using the cipher chosen during initialization.

        :param ciphertext_block: Block of ciphertext.
        :type ciphertext_block: int.
        :param key: Decryption key.
        :type key: int.
        :return: Decrypted block.
        :rtype: int.
        """
        return self.cipher.decrypt_block(ciphertext_block, key)

    def __process_next_block(self, param: Parameter, func: Callable[[int, int], int]) -> Tuple[int, int]:
        """ Calls a function on the next block of data.

        Data_in is used to extract the next block the function func is called with. Data_out is updated by shifting the
        result of the function beyond the last block previously stored and bitwise or. Data_in is also modified
        (the copy) by right shifting to the next block.

        WARNING: The return value of data_in is modified in order to have the next block starting at the first bit.

        For encryption this means that we get the next block (block_in) and encrypt it. The result is stored with
        the other ciphertext blocks in data_out by shifting it to the addresses after the last block. The plaintext
        in data_in is shifted by one block towards the lower addresses to remove the currently processed block.

        Decryption works in the same manner with the difference that ciphertext stored in is data_in and the plaintext
        in data_out.

        :param param: Parameter object that contains the required properties.
        :type param: self.Parameter
        :param func: Function to use.
        :type func: Callable.
        :return: Modified data_in and data_out.
        :rtype: Tuple[int, int].
        """
        block_in = param.data_in & param.mask
        block_out = func(block_in, param.key)
        data_out = param.data_out | (block_out << self.cipher.block_size * param.counter)
        data_in_modified = param.data_in >> self.cipher.block_size

        return data_in_modified,  data_out


class CTR(CipherMode):
    """ Counter Mode (CTR)
    """
    class Parameter(NamedTuple):
        data_in: int
        data_out: int
        key: int
        nonce: int
        mask: int
        counter: int

    def __init__(self, cipher: BlockCipher):
        super().__init__(cipher)

    def encrypt(self, plaintext: int, plaintext_byte_size: int, key: int) -> Tuple[int, int]:
        """ Encrypts every block in the plaintext by encrypting a (nonce xor counter) and xoring the result with the
        plaintext. Note that this is only secure if the nonce is random, if not a Chosen-Plaintext Attack (CPA) is
        possible. The usual implementation of CTR therefore performs a concatenation between the nonce and counter
        which does not have this security issue.

        A new nonce is generated from a cryptographically secure source for every call, ensuring that is only used once.
        No padding is used, the ciphertext has the same size as the plaintext. The ciphertext is concatenated with the
        nonce for output.

        :param plaintext: Plaintext.
        :type plaintext: int.
        :param plaintext_byte_size: Number of bytes in plaintext.
        :type plaintext_byte_size: int.
        :param key: Encryption key.
        :type key: int.
        :return: Ciphertext + nonce and their size.
        :rtype: Tuple[int, int].
        """
        num_blocks = Block.blocks_in_data(plaintext_byte_size, self.cipher.block_byte_size)

        ciphertext = 0
        mask = 2 ** self.cipher.block_size - 1

        # Generate nonce, makes therefore sure it's actually only used once
        nonce = KeyMaterialFactory.create_nonce(self.cipher)

        for i in range(num_blocks):
            param = self.Parameter(data_in=plaintext, data_out=ciphertext, key=key, nonce=nonce, mask=mask, counter=i)
            plaintext, ciphertext = self.__process_next_block(param, self.__encrypt_block)

        # Mask bits that aren't relevant, when plaintext is less than a multiple of the block size.
        # This removes the need for padding.
        ciphertext = ciphertext & 2 ** (plaintext_byte_size * 8) - 1

        ciphertext_and_nonce = (ciphertext << self.cipher.block_size) | nonce
        data_size = plaintext_byte_size + self.cipher.block_byte_size

        return ciphertext_and_nonce, data_size

    def __encrypt_block(self, data_block: int, key: int, nonce: int, counter: int) -> int:
        """ Encrypts the plaintext block.

        The IV is encrypted using the cipher chosen during initialization. The result is xored with the plaintext.
        This allows to use the same function for encryption and decryption, as well as an encryption without padding.
        If the plaintext doesn't fill an entire block, only the bits at indices where the plaintext was populated have
        to be stored.

        :param data_block: Block of plaintext.
        :type data_block: int.
        :param key: Encryption key.
        :type key: int.
        :param nonce: Number used once.
        :type nonce: int.
        :param counter: Counter that should increment for every encrypted block.
        :type nonce: int.
        :return: Encrypted block.
        :rtype: int.
        """
        iv = nonce ^ counter
        encrypted_iv = self.cipher.encrypt_block(iv, key)
        ciphertext_block = encrypted_iv ^ data_block

        return ciphertext_block

    def decrypt(self, ciphertext: int, ciphertext_byte_size: int, key: int) -> Tuple[int, int]:
        """ Decrypts every block in the plaintext by encrypting a (nonce xor counter) and xoring the result with the
        plaintext.

        The nonce has is split from the ciphertext. In case the ciphertext is not a multiple of the block size,
        irrelevant bits are discarded after decryption.

        :param ciphertext: Ciphertext with nonce.
        :type ciphertext: int.
        :param ciphertext_byte_size: Number of bytes in ciphertext including nonce.
        :type ciphertext_byte_size: int.
        :param key: Decryption key.
        :type key: int.
        :return: Plaintext and its size.
        :rtype: Tuple[int, int].
        """
        plaintext = 0
        mask = 2 ** self.cipher.block_size - 1

        # Split the ciphertext to recover the nonce
        nonce = ciphertext & mask
        ciphertext = ciphertext >> self.cipher.block_size
        ciphertext_byte_size = ciphertext_byte_size - self.cipher.block_byte_size
        num_blocks = Block.blocks_in_data(ciphertext_byte_size, self.cipher.block_byte_size)

        for i in range(num_blocks):
            param = self.Parameter(data_in=ciphertext, data_out=plaintext, key=key, nonce=nonce, mask=mask, counter=i)
            ciphertext, plaintext = self.__process_next_block(param, self.__encrypt_block)

        # Mask bits that aren't relevant, when plaintext is less than a multiple of the block size.
        # This removes the need for padding.
        plaintext = plaintext & 2 ** (ciphertext_byte_size * 8) - 1

        return plaintext, ciphertext_byte_size

    def __process_next_block(self, param: Parameter, func: Callable[[int, int, int, int], int]) -> Tuple[int, int]:
        """ Calls a function on the next block of data.

        Data_in is used to extract the next block the function func is called with. Data_out is updated by shifting the
        result of the function beyond the last block previously stored and bitwise or. Data_in is also modified
        (the copy) by right shifting to the next block.

        WARNING: The return value of data_in is modified in order to have the next block starting at the first bit.

        For encryption this means that we get the next block (block_in) and encrypt it. The result is stored with
        the other ciphertext blocks in data_out by shifting it to the addresses after the last block. The plaintext
        in data_in is shifted by one block towards the lower addresses to remove the currently processed block.

        Decryption works in the same manner with the difference that ciphertext stored in is data_in and the plaintext
        in data_out.

        :param param: Parameter object that contains the required properties.
        :type param: self.Parameter
        :param func: Function to use.
        :type func: Callable.
        :return: Modified data_in and data_out.
        :rtype: Tuple[int, int].
        """
        block_in = param.data_in & param.mask
        block_out = func(block_in, param.key, param.nonce, param.counter)
        data_out = param.data_out | (block_out << self.cipher.block_size * param.counter)
        data_in_modified = param.data_in >> self.cipher.block_size

        return data_in_modified, data_out


class KeyMaterialFactory:
    """ Factory for random numbers.
    """
    @staticmethod
    def create(cipher: BlockCipher, seed=None):
        """ Creates a key and nonce. If seed is set a pseudo random number generator is used.

        :param cipher: Block cipher for which the random number are generated.
        :type cipher: BlockCipher
        :param seed: (Optional) seed for the random number generator.
        :type seed: int
        :return: Key and nonce.
        :rtype: Tuple[int, int].
        """
        key = KeyMaterialFactory.create_key(cipher, seed)
        nonce = KeyMaterialFactory.create_nonce(cipher, seed)
        return key, nonce

    @staticmethod
    def create_key(cipher: BlockCipher, seed=None) -> int:
        """ Creates a key. If seed is set a pseudo random number generator is used.

        :param cipher: Block cipher for which the random number are generated.
        :type cipher: BlockCipher
        :param seed: (Optional) seed for the random number generator.
        :type seed: int
        :return: Key.
        :rtype: int.
        """
        if seed is None:
            # Use cryptographically secure random numbers
            return secrets.randbits(cipher.key_size)
        else:
            # Use pseudo random numbers (allows to repeat execution deterministically)
            random.seed(seed)
            return random.getrandbits(cipher.key_size)

    @staticmethod
    def create_nonce(cipher: BlockCipher, seed=None) -> int:
        """ Creates a nonce/IV. If seed is set a pseudo random number generator is used.

        :param cipher: Block cipher for which the random number are generated.
        :type cipher: BlockCipher
        :param seed: (Optional) seed for the random number generator.
        :type seed: int
        :return: Nonce.
        :rtype: int.
        """
        if seed is None:
            # Use cryptographically secure random numbers
            return secrets.randbits(cipher.block_size)
        else:
            # Use pseudo random numbers (allows to repeat execution deterministically)
            random.seed(seed)
            return random.getrandbits(cipher.block_size)


class CipherModeFactory:
    """ Factory for cipher modes.
    """
    @staticmethod
    def create(mode: str, cipher: BlockCipher) -> CipherMode:
        """ Creates a cipher mode object.

        :param mode: Mode string. Should be one of ['ctr', 'ecb'].
        :type mode: str.
        :param cipher: Cipher to be used with cipher mode.
        :type cipher: BlockCipher
        :return: Cipher mode.
        :rtype: CipherMode.
        """
        if mode == 'ctr':
            return CTR(cipher)
        elif mode == 'ecb':
            return ECB(cipher)
        else:
            raise ValueError("Cipher mode {} is not supported.".format(mode))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog="Speck Cipher Demo",
                                     description="Speck cipher demo implementation for validation")

    parser.add_argument('-b',
                        '--block-size',
                        type=int,
                        choices=[32, 48, 64, 96, 128],
                        help="Block size.",
                        required=True)

    parser.add_argument('-k',
                        '--key-size',
                        type=int,
                        choices=[64, 72, 96, 128, 144, 192, 256],
                        help="Key size.",
                        required=True)

    parser.add_argument('-m',
                        '--mode',
                        type=str,
                        choices=["ctr", "ecb"],
                        help="Cipher mode.",
                        required=True)

    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument('--input-str',
                             type=lambda x: bytes(x.encode()),
                             help="String which is interpreted as its UTF-8 byte representation (big endian).",
                             dest='input')
    input_group.add_argument('--input-byte',
                             type=lambda x: bytes.fromhex(x),
                             help="Hex values as string which are interpreted as bytes (big endian).",
                             dest='input')

    operation_group = parser.add_mutually_exclusive_group(required=True)
    operation_group.add_argument('-e',
                                 '--encrypt',
                                 action='store_true',
                                 dest='do_encrypt',
                                 help="Encrypt the input.")
    operation_group.add_argument('-d',
                                 '--decrypt',
                                 action='store_false',
                                 dest='do_encrypt',
                                 help="Decrypt the input.")

    parser.add_argument('--gen-key',
                        type=int,
                        default=None,
                        help="Generate a key. If a value is supplied it is used as seed for a pseudo random number"
                             "generator. Otherwise a cryptographically secure random number generator is used. "
                             "For encryption only.",
                        metavar='SEED',
                        required='--encrypt' in sys.argv)

    parser.add_argument('--key',
                        type=lambda x: int.from_bytes(bytes.fromhex(x), byteorder=sys.byteorder, signed=False),
                        help="Key for encryption/decryption in big endian hex format. For decryption only.",
                        required='--decrypt' in sys.argv)

    args = parser.parse_args()

    speck_cipher = Speck(args.block_size, args.key_size)
    cipher_mode = CipherModeFactory.create(args.mode, speck_cipher)

    value_byte_size = len(args.input)
    value = int.from_bytes(args.input, byteorder=sys.byteorder, signed=False)

    if args.do_encrypt:
        key = KeyMaterialFactory.create_key(speck_cipher, args.gen_key)
        result, result_byte_size = cipher_mode.encrypt(value, value_byte_size, key)
        print("key: {}".format(int.to_bytes(key, args.key_size // 8, byteorder=sys.byteorder, signed=False).hex()))
        print("result: {}".format(int.to_bytes(result, result_byte_size, byteorder=sys.byteorder, signed=False).hex()))
    else:
        result, result_byte_size = cipher_mode.decrypt(value, value_byte_size, args.key)
        print("result: {}".format(int.to_bytes(result, result_byte_size, byteorder=sys.byteorder, signed=False).decode()))



