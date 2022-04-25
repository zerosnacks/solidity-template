#!/usr/bin/env bash

echo Which contract do you want to flatten \(eg Greeter\)?

read contract

rm -rf out/flattened.sol

forge flatten ./src/${contract}.sol > out/flattened.sol
