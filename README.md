# TokenDistributorMock
For final testing before certain airbop event.
Seems neither Hardhat nor Anvil return the L1 block number that the original contract checks for, but they return the current L2 block number instead.

To go around this you can either deploy this contract to arbibum mainnet and set their some current L1 block as target block and test against that.
You can also deploy it on a local fork and set the target block to L2 block 

This way we can test e.g. with some WETH dust. 

1. deploy, e.g. using deploy_td.sh
2. sent some WETH dust to contract
3. setRecipients() for example accounts
4. test your bot against it (obviously you need to override it a bit for testing to use this contract and WETH as the claimed token)
