# Speck Cipher Hardware
This repository contains a VHDL and Python implementation of the Speck cipher as described in NSA documents [0,1]. The VHDL code of Speck is pipelined and allows to define the desired key and block sizes through generics. CTR is available as cipher mode for Speck in hardware. Tests are provided for both VHDL and Python.

**Do not use this code to process sensitive information.** While we have done our best to ensure correctness, the code has not been audited and may be susceptible to cryptographic attacks. Cryptography is a challenging field, simple mistakes can have disastrous consequences for the security of the encryption. In fact even the National Security Agency made a [little but not insignificant mistake](https://github.com/nsacyber/simon-speck/issues/1) in the implementation guide for the Speck and Simon ciphers which I discovered during the development. Although the actual reference implementation did not contain the error, the code from the implementation guide would have caused undefined behavior. We are not less likely to make mistakes than the researchers at the NSA therefore be aware of the risk when using our code.

## Dependencies
The VHDL testbenches use VHDL-2008 and therefore require a simulation tool that supports this standard, e.g. `Vivado 2016.4` and later. The Python implementation requires `Python 3.6` or later.

## Register Transfer Logic
The following images show the RTL schematics of Speck 64 96.
![CTR Mode](./imgs/ctr_rtl_schematic.svg)
*CTR Mode*

![Encryption Pipeline](./imgs/encryption_pipeline_rtl_schematic.svg)
*Encryption Pipeline*

![Encryption Round](./imgs/encryption_round_rtl_schematic.svg)
*Encryption Round*

## References
[0] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers, "The SIMON and SPECK Families of Lightweight Block Ciphers", Cryptology ePrint Archive, Report 2013/404, Available: [https://eprint.iacr.org/2013/404.pdf](https://eprint.iacr.org/2013/404.pdf)

[1] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers, "SIMON and SPECK Implementation Guide", NSA Cybersecurity, June 26, 2018. [Online]. Available: [https://nsacyber.github.io/simon-speck/implementations/ImplementationGuide1.1.pdf](https://nsacyber.github.io/simon-speck/implementations/ImplementationGuide1.1.pdf) 
