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

import unittest
from src import speck


class TestSpeck(unittest.TestCase):
    """ Verifies test vectors provided in [0].

    [0] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers,
    "SIMON and SPECK Implementation Guide", NSA Cybersecurity, June 26, 2018. [Online].
    Available: https://nsacyber.github.io/simon-speck/implementations/ImplementationGuide.pdf
    """

    def test_speck_64_96(self):
        cipher = speck.Speck(64, 96)
        plaintext = int.from_bytes(bytes.fromhex('65 61 6e 73 20 46 61 74'), byteorder='little', signed=False)
        key = int.from_bytes(bytes.fromhex('00 01 02 03 08 09 0a 0b 10 11 12 13'), byteorder='little', signed=False)
        encrypted = cipher.encrypt_block(plaintext, key)
        decrypted = cipher.decrypt_block(encrypted, key)

        # Key Schedule
        self.assertEqual(cipher.round_keys[0], 0x03020100)
        self.assertEqual(cipher.round_keys[1], 0x131d0309)
        self.assertEqual(cipher.round_keys[2], 0xbbd80d53)
        self.assertEqual(cipher.round_keys[3], 0x1a2370c1)
        self.assertEqual(cipher.round_keys[4], 0xe45d26dd)
        self.assertEqual(cipher.round_keys[5], 0x63cb3f1c)
        self.assertEqual(cipher.round_keys[6], 0x27597d5a)
        self.assertEqual(cipher.round_keys[7], 0x205175b4)
        self.assertEqual(cipher.round_keys[8], 0xdb01db9f)
        self.assertEqual(cipher.round_keys[9], 0x9812aac8)
        self.assertEqual(cipher.round_keys[10], 0x16796373)
        self.assertEqual(cipher.round_keys[11], 0xff72647b)
        self.assertEqual(cipher.round_keys[12], 0xccda7364)
        self.assertEqual(cipher.round_keys[13], 0xd6f4b7c9)
        self.assertEqual(cipher.round_keys[14], 0x2589bf5a)
        self.assertEqual(cipher.round_keys[15], 0x39741c59)
        self.assertEqual(cipher.round_keys[16], 0x85a6aa9c)
        self.assertEqual(cipher.round_keys[17], 0x208eb076)
        self.assertEqual(cipher.round_keys[18], 0x71a9351e)
        self.assertEqual(cipher.round_keys[19], 0x8eff59e3)
        self.assertEqual(cipher.round_keys[20], 0x498ff996)
        self.assertEqual(cipher.round_keys[21], 0x15ec7c21)
        self.assertEqual(cipher.round_keys[22], 0x0f49104a)
        self.assertEqual(cipher.round_keys[23], 0xd8ea21bc)
        self.assertEqual(cipher.round_keys[24], 0xdcdb415c)
        self.assertEqual(cipher.round_keys[25], 0x2fa7e901)

        # Encryption Result
        expected_ciphertext = int.from_bytes(bytes.fromhex('6c 94 75 41 ec 52 79 9f'), byteorder='little', signed=False)
        self.assertEqual(encrypted, expected_ciphertext)

        # Decryption Result
        self.assertEqual(decrypted, plaintext)

    def test_speck_64_128(self):
        cipher = speck.Speck(64, 128)
        plaintext = int.from_bytes(bytes.fromhex('2d 43 75 74 74 65 72 3b'), byteorder='little', signed=False)
        key = int.from_bytes(bytes.fromhex('00 01 02 03 08 09 0a 0b 10 11 12 13 18 19 1a 1b'), byteorder='little',
                             signed=False)
        encrypted = cipher.encrypt_block(plaintext, key)
        decrypted = cipher.decrypt_block(encrypted, key)

        # Key Schedule
        self.assertEqual(cipher.round_keys[0], 0x03020100)
        self.assertEqual(cipher.round_keys[1], 0x131d0309)
        self.assertEqual(cipher.round_keys[2], 0xbbd80d53)
        self.assertEqual(cipher.round_keys[3], 0x0d334df3)
        self.assertEqual(cipher.round_keys[4], 0x7fa43565)
        self.assertEqual(cipher.round_keys[5], 0x67e6ce55)
        self.assertEqual(cipher.round_keys[6], 0xe98cb3d2)
        self.assertEqual(cipher.round_keys[7], 0xaac76cbd)
        self.assertEqual(cipher.round_keys[8], 0x7f5951c8)
        self.assertEqual(cipher.round_keys[9], 0x03fa82c2)
        self.assertEqual(cipher.round_keys[10], 0x313533ad)
        self.assertEqual(cipher.round_keys[11], 0xdff70882)
        self.assertEqual(cipher.round_keys[12], 0x9e487c93)
        self.assertEqual(cipher.round_keys[13], 0xa934b928)
        self.assertEqual(cipher.round_keys[14], 0xdd2edef5)
        self.assertEqual(cipher.round_keys[15], 0x8be6388d)
        self.assertEqual(cipher.round_keys[16], 0x1f706b89)
        self.assertEqual(cipher.round_keys[17], 0x2b87aaf8)
        self.assertEqual(cipher.round_keys[18], 0x12d76c17)
        self.assertEqual(cipher.round_keys[19], 0x6eaccd6c)
        self.assertEqual(cipher.round_keys[20], 0x6a1ab912)
        self.assertEqual(cipher.round_keys[21], 0x10bc6bca)
        self.assertEqual(cipher.round_keys[22], 0x6057dd32)
        self.assertEqual(cipher.round_keys[23], 0xd3c9b381)
        self.assertEqual(cipher.round_keys[24], 0xb347813d)
        self.assertEqual(cipher.round_keys[25], 0x8c113c35)
        self.assertEqual(cipher.round_keys[26], 0xfe6b523a)

        # Encryption Result
        expected_ciphertext = int.from_bytes(bytes.fromhex('8b 02 4e 45 48 a5 6f 8c'), byteorder='little', signed=False)
        self.assertEqual(encrypted, expected_ciphertext)

        # Decryption Result
        self.assertEqual(decrypted, plaintext)

    def test_speck_128_128(self):
        cipher = speck.Speck(128, 128)
        plaintext = int.from_bytes(bytes.fromhex('20 6d 61 64 65 20 69 74 20 65 71 75 69 76 61 6c'), byteorder='little',
                                   signed=False)
        key = int.from_bytes(bytes.fromhex('00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f'), byteorder='little',
                             signed=False)
        encrypted = cipher.encrypt_block(plaintext, key)
        decrypted = cipher.decrypt_block(encrypted, key)

        # Key Schedule
        self.assertEqual(cipher.round_keys[0], 0x0706050403020100)
        self.assertEqual(cipher.round_keys[1], 0x37253b31171d0309)
        self.assertEqual(cipher.round_keys[2], 0xf91d89cc90c4085c)
        self.assertEqual(cipher.round_keys[3], 0xc6b1f07852cc7689)
        self.assertEqual(cipher.round_keys[4], 0x014fcdf4f9c2d6f0)
        self.assertEqual(cipher.round_keys[5], 0xb5fae1e4fe24cfd6)
        self.assertEqual(cipher.round_keys[6], 0xa36d6954b0737cfe)
        self.assertEqual(cipher.round_keys[7], 0xf511691ea02f35f3)
        self.assertEqual(cipher.round_keys[8], 0x5374abb75a2b455d)
        self.assertEqual(cipher.round_keys[9], 0x8dd5f6204ddcb2a5)
        self.assertEqual(cipher.round_keys[10], 0xb243d7c9869cac18)
        self.assertEqual(cipher.round_keys[11], 0x753e7a7c6660459e)
        self.assertEqual(cipher.round_keys[12], 0x78d648a3a5b0e63b)
        self.assertEqual(cipher.round_keys[13], 0x87152b23cbc0a8d2)
        self.assertEqual(cipher.round_keys[14], 0xa8ff8b8c54a3b6f2)
        self.assertEqual(cipher.round_keys[15], 0x4873be3c43b3ea79)
        self.assertEqual(cipher.round_keys[16], 0x771ebffcbf05cb13)
        self.assertEqual(cipher.round_keys[17], 0xe8a6bcaf25863d20)
        self.assertEqual(cipher.round_keys[18], 0xe6c2ea8b5c520c93)
        self.assertEqual(cipher.round_keys[19], 0x4d71b5c1ac5214f5)
        self.assertEqual(cipher.round_keys[20], 0xdc60b2ae253070dc)
        self.assertEqual(cipher.round_keys[21], 0xb01d0abbe1fb9741)
        self.assertEqual(cipher.round_keys[22], 0xd7987684a318b54a)
        self.assertEqual(cipher.round_keys[23], 0xa22c5282e600d319)
        self.assertEqual(cipher.round_keys[24], 0xe029d67ebdf90048)
        self.assertEqual(cipher.round_keys[25], 0x67559234c84efdbf)
        self.assertEqual(cipher.round_keys[26], 0x65173cf0cb01695c)
        self.assertEqual(cipher.round_keys[27], 0x24cf1f1879819519)
        self.assertEqual(cipher.round_keys[28], 0x38a36ed2dbafb72a)
        self.assertEqual(cipher.round_keys[29], 0xded93cfe31bae304)
        self.assertEqual(cipher.round_keys[30], 0xc53d18b91770b265)
        self.assertEqual(cipher.round_keys[31], 0x2199c870db8ec93f)

        # Encryption Result
        expected_ciphertext = int.from_bytes(bytes.fromhex('18 0d 57 5c df fe 60 78 65 32 78 79 51 98 5d a6'),
                                             byteorder='little', signed=False)
        self.assertEqual(encrypted, expected_ciphertext)

        # Decryption Result
        self.assertEqual(decrypted, plaintext)

    def test_speck_128_192(self):
        cipher = speck.Speck(128, 192)
        plaintext = int.from_bytes(bytes.fromhex('65 6e 74 20 74 6f 20 43 68 69 65 66 20 48 61 72'), byteorder='little',
                                   signed=False)
        key = int.from_bytes(bytes.fromhex('00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17'),
                             byteorder='little', signed=False)
        encrypted = cipher.encrypt_block(plaintext, key)
        decrypted = cipher.decrypt_block(encrypted, key)

        # Key Schedule
        self.assertEqual(cipher.round_keys[0], 0x0706050403020100)
        self.assertEqual(cipher.round_keys[1], 0x37253b31171d0309)
        self.assertEqual(cipher.round_keys[2], 0xfe1588ce93d80d52)
        self.assertEqual(cipher.round_keys[3], 0xf788db953a2770c8)
        self.assertEqual(cipher.round_keys[4], 0xae96cb4f51692699)
        self.assertEqual(cipher.round_keys[5], 0x792bb597b847397a)
        self.assertEqual(cipher.round_keys[6], 0x9e6329125cfe47cc)
        self.assertEqual(cipher.round_keys[7], 0xa6698f90adc36bbb)
        self.assertEqual(cipher.round_keys[8], 0xf68cb29333796e9d)
        self.assertEqual(cipher.round_keys[9], 0x6187b7c3ae08eb15)
        self.assertEqual(cipher.round_keys[10], 0xae70c68cb42115ea)
        self.assertEqual(cipher.round_keys[11], 0xdac09cd5af5e76d6)
        self.assertEqual(cipher.round_keys[12], 0xca660ce33bd16b9e)
        self.assertEqual(cipher.round_keys[13], 0x1d3f349235549e8d)
        self.assertEqual(cipher.round_keys[14], 0xaca233ed2931350f)
        self.assertEqual(cipher.round_keys[15], 0x42e1dc29fc94bca2)
        self.assertEqual(cipher.round_keys[16], 0xbd29d68e9dbdb77e)
        self.assertEqual(cipher.round_keys[17], 0x751f72a5339f6f77)
        self.assertEqual(cipher.round_keys[18], 0x49320cf569e3fc63)
        self.assertEqual(cipher.round_keys[19], 0x825e391774dd8c3f)
        self.assertEqual(cipher.round_keys[20], 0x49b1ca0af73ec529)
        self.assertEqual(cipher.round_keys[21], 0x22f3c83e0a8caec6)
        self.assertEqual(cipher.round_keys[22], 0xefd149b0efbbf74e)
        self.assertEqual(cipher.round_keys[23], 0x02ca8ace24b0cbb4)
        self.assertEqual(cipher.round_keys[24], 0x94968fa740eaf782)
        self.assertEqual(cipher.round_keys[25], 0xfca6ad548d13daff)
        self.assertEqual(cipher.round_keys[26], 0xfa1c1a8a0be7904f)
        self.assertEqual(cipher.round_keys[27], 0x3594f90a254d56d0)
        self.assertEqual(cipher.round_keys[28], 0x4913ea2b79da668d)
        self.assertEqual(cipher.round_keys[29], 0xb0660f031a87ec17)
        self.assertEqual(cipher.round_keys[30], 0x3e7bbb3d40e4fc47)
        self.assertEqual(cipher.round_keys[31], 0x4fa96d719e9eb338)
        self.assertEqual(cipher.round_keys[32], 0x372dd2b830c61709)

        # Encryption Result
        expected_ciphertext = int.from_bytes(bytes.fromhex('86 18 3c e0 5d 18 bc f9 66 55 13 13 3a cf e4 1b'),
                                             byteorder='little', signed=False)
        self.assertEqual(encrypted, expected_ciphertext)

        # Decryption Result
        self.assertEqual(decrypted, plaintext)

    def test_speck_128_256(self):
        cipher = speck.Speck(128, 256)
        plaintext = int.from_bytes(bytes.fromhex('70 6f 6f 6e 65 72 2e 20 49 6e 20 74 68 6f 73 65'), byteorder='little',
                                   signed=False)
        key = int.from_bytes(bytes.fromhex(
            '00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f'),
                             byteorder='little', signed=False)
        encrypted = cipher.encrypt_block(plaintext, key)
        decrypted = cipher.decrypt_block(encrypted, key)

        # Key Schedule
        self.assertEqual(cipher.round_keys[0], 0x0706050403020100)
        self.assertEqual(cipher.round_keys[1], 0x37253b31171d0309)
        self.assertEqual(cipher.round_keys[2], 0xfe1588ce93d80d52)
        self.assertEqual(cipher.round_keys[3], 0xe698e09f31334dfe)
        self.assertEqual(cipher.round_keys[4], 0xdb60f14bcbd834fd)
        self.assertEqual(cipher.round_keys[5], 0x2dafa7c34cc2c2f8)
        self.assertEqual(cipher.round_keys[6], 0xfbb8e2705e64a1db)
        self.assertEqual(cipher.round_keys[7], 0xdb6f99e4e383eaef)
        self.assertEqual(cipher.round_keys[8], 0x291a8d359c8ab92d)
        self.assertEqual(cipher.round_keys[9], 0x0b653abee296e282)
        self.assertEqual(cipher.round_keys[10], 0x604236be5c109d7f)
        self.assertEqual(cipher.round_keys[11], 0xb62528f28e15d89c)
        self.assertEqual(cipher.round_keys[12], 0x10419dd1d0b25f29)
        self.assertEqual(cipher.round_keys[13], 0xfd71e73b9c69fff6)
        self.assertEqual(cipher.round_keys[14], 0x8ea922047f976e93)
        self.assertEqual(cipher.round_keys[15], 0x2e039afd398cffbc)
        self.assertEqual(cipher.round_keys[16], 0x9c9fcfef22c1072c)
        self.assertEqual(cipher.round_keys[17], 0x25fa8973ed55e6c9)
        self.assertEqual(cipher.round_keys[18], 0x69819861a6b4280c)
        self.assertEqual(cipher.round_keys[19], 0x7b62d87498038f77)
        self.assertEqual(cipher.round_keys[20], 0xf2351ece62e296fe)
        self.assertEqual(cipher.round_keys[21], 0xa6d382d176ba05ff)
        self.assertEqual(cipher.round_keys[22], 0x8d96e66745b78726)
        self.assertEqual(cipher.round_keys[23], 0xbe77397e9de6bf31)
        self.assertEqual(cipher.round_keys[24], 0x35177f07af7d9479)
        self.assertEqual(cipher.round_keys[25], 0xb86971c5e7815ff0)
        self.assertEqual(cipher.round_keys[26], 0x7d77bfff103b45ea)
        self.assertEqual(cipher.round_keys[27], 0x9983914c82a1a11e)
        self.assertEqual(cipher.round_keys[28], 0x1e88e9b26e3307f5)
        self.assertEqual(cipher.round_keys[29], 0x7a0068774fc7061b)
        self.assertEqual(cipher.round_keys[30], 0x1771e55c7df2b16f)
        self.assertEqual(cipher.round_keys[31], 0xa2cb5323bbf86418)
        self.assertEqual(cipher.round_keys[32], 0x400303547ff5e38b)
        self.assertEqual(cipher.round_keys[33], 0xf4d26f589a56b276)

        # Encryption Result
        expected_ciphertext = int.from_bytes(bytes.fromhex('43 8f 18 9c 8d b4 ee 4e 3e f5 c0 05 04 01 09 41'),
                                             byteorder='little', signed=False)
        self.assertEqual(encrypted, expected_ciphertext)

        # Decryption Result
        self.assertEqual(decrypted, plaintext)


if __name__ == '__main__':
    unittest.main()
