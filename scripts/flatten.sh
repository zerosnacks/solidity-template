#!/usr/bin/env bash

# Read the contract name
echo Which contract do you want to flatten \(e.g. Greeter\)?
read contract

# Clean up temporary file
rm -rf flattened.sol

# Flatten to temporary file
forge flatten ./src/${contract}.sol > flattened.sol
