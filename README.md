# Speck Cipher Hardware
This repository contains a VHDL and Python implementation of the Speck cipher as described in NSA documents [0,1]. The VHDL code of Speck is pipelined.
**Do not use this code for processing sensitive information.** While we have done our best to ensure correctness, the code has not been audited and may be susceptible to cryptographic attacks.

## Dependencies
The VHDL implementation and testbenches use a subset of VHDL-2008 and therefore require a synthesis and simulation tool that supports this standard, e.g. `Vivado 2016` and later. The Python implementation requires `Python 3.6` or later.

## Register Transfer Logic
The following images show the RTL schematics of Speck 64 96.
![CTR Mode](./imgs/ctr_rtl_schematic.svg)
![Encryption Pipeline](./imgs/encryption_pipeline_rtl_schematic.svg)
![Encryption Round](./imgs/encryption_round_rtl_schematic.svg)

## References
[0] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers,
    "The SIMON and SPECK Families of Lightweight Block Ciphers", Cryptology ePrint Archive, Report 2013/404,
    Available: [https://eprint.iacr.org/2013/404.pdf](https://eprint.iacr.org/2013/404.pdf)

[1] R. Beaulieu, D. Shors, J. Smith, S. Treatman-Clark, B. Weeks and L. Wingers,
    "SIMON and SPECK Implementation Guide", NSA Cybersecurity, June 26, 2018. [Online].
    Available: [https://nsacyber.github.io/simon-speck/implementations/ImplementationGuide1.1.pdf](https://nsacyber.github.io/simon-speck/implementations/ImplementationGuide1.1.pdf) 