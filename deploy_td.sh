#!/bin/bash
RPC=https://arb1.arbitrum.io/rpc
OWNER_ACCT=0xYourAddress
PK=0xYourPrivateKey
GAS=100000000
forge create --optimize --optimizer-runs 2500000000 --gas-price $GAS --rpc-url $RPC --private-key $PK src/TokenDistributor.sol:TokenDistributor --constructor-args 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1 $OWNER_ACCT 0 91744632
