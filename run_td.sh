#!/bin/bash
PROVIDER=https://arb1.arbitrum.io/rpc
forge test --fork-url $PROVIDER -vvv --gas-report --match-contract TD