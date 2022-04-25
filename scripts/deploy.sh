#!/usr/bin/env bash

echo Enter your RPC URL \(eg "https://eth-mainnet.alchemyapi.io/v2/XXXXXXXXXX"\):

read -s rpc

echo Which contract do you want to deploy \(eg Greeter\)?

read contract

echo Enter constructor arguments separated by spaces \(eg 1 2 3\):

read -ra args

if [ -z "$args" ]
then
  forge create ./src/${contract}.sol:${contract} -i --rpc-url $rpc
else
  forge create ./src/${contract}.sol:${contract} -i --rpc-url $rpc --constructor-args ${args}
fi
