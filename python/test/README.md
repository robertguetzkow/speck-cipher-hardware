# Test
This directory contains two kinds of test scripts, unit tests and scripts for generating (partial) VHDL testbenches.

## Unit test
The file `test.py` contains unit tests for the Speck cipher implemented in Python. You can run them by using the following command in the `speck-cipher-hardware/python` directory: `python -m unittest test.test`

## Testbench
The other files in the directory allow to generate test cases for the VHDL testbenches. You can run them using `python -m test.encrypt_tb`, `python -m test.er_dr_tb`, `python -m test.encryption_round_tb`, `python -m test.key_schedule_round_tb` and `python -m test.ctr_speck_tb`.