#!/usr/bin/env bash

echo Which compiler version did you use to build \(eg v0.8.13+commit.abaa5c0e\)?

read version

echo Which chain id did you deploy to \(eg 4\)?

read chainid

echo Which contract do you want to verify \(eg Greeter\)?

read contract

echo What is the deployed address?

read deployed

echo Enter constructor arguments separated by spaces \(eg 1 2 3\):

read -ra args

echo What is your Etherscan API Key?:

read -s etherscan

if [ -z "$args" ]
then
  forge verify-contract --compiler-version $version $deployed ./src/${contract}.sol:${contract} $etherscan --chain-id $chainid
else
  forge verify-contract --compiler-version $version $deployed ./src/${contract}.sol:${contract} $etherscan --constructor-args ${args} --chain-id $chainid
fi
