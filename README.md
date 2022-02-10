# regtestEnv

Environment for regTest bitcoin

## Commands

- calice.sh (and similar) send a rpccommand to alice.
- cwalice.sh (and similar) create wallet for alice.
- downAll.sh (and similar) stops all bitcoind instances.
- lalice.sh (and similar) log debug.log for alice.
- rmalice.sh (and similar) remove all files and directories except wallet for alice.
- upalice.sh (and similar) start bitcoind for alice.
- upAll.sh starts all bitcoind instances (for alice, bob and carl).
- rmAllButWallets.sh remove all files and directories but wallet data for everyone.
- rmAllWithWallets.sh remove all files and directories for everyone.
- naalice.sh create a new address for alice named addrAlice1
- gaalice.sh get address of alice
- gbalice.sh (optional:numblocks=1) generate numblocks mining.
- alicest.st alice send to [bob|carl] [amount] [fee]
- bobst.st alice send to [alice|carl] [amount] [fee]
- carlst.st alice send to [bob|alice] [amount] [fee]
- connect.sh [alice|bob|carl] [alice|bob|carl] connect one node with the other.
