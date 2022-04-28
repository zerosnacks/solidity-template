#!/usr/bin/env bash

# Read the compiler version
echo Which compiler version did you use to build \(e.g. v0.8.13+commit.abaa5c0e\)?
read version

# Read the chain id
echo Which chain id did you deploy to \(e.g. 4\)?
read id

# Read the contract name
echo Which contract do you want to verify \(e.g. Greeter\)?
read contract

# Read the deployed address
echo What is the deployed address?
read deployed

# Read the constructor arguments
echo Enter constructor arguments separated by spaces \(e.g. hello 0xacc4de8d4ca96c3f0c91b58f1d6c0d80cf8cc146 1\):
read -ra args

# Read the Etherscan API key
echo What is your Etherscan API Key \(silent - e.g. PBXRXCYVARVKN34QHWUSM5WZRVZQSCJQW4\)?:
read -s etherscan

if [ -z "$args" ]
then
  forge verify-contract --compiler-version $version $deployed ./src/${contract}.sol:${contract} $etherscan --chain-id $id
else
  forge verify-contract --compiler-version $version $deployed ./src/${contract}.sol:${contract} $etherscan --constructor-args ${args} --chain-id $id
fi
