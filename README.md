# regtestEnv

This is project to make an environment for testing projects which uses serveral instances of bitcoind, one for each node.

It uses bitcoind's regTest environment to create nodes, connect an disconnect them,
while creating transactions and blocks in any of them.

It has three unconnected nodes called Alice, Bob an Carl. each one using the following ports:

* Alice
  * port:8331
  * rpcport:8332
  * zmqport:29000

* Bob
  * port:8333
  * rpcport:8334
  * zmqport:29001

* Carl
  * port:8335
  * rpcport:8336
  * zmqport:29002

## Usage

You must have an environment variable `BITCOIND_PATH` pointing to ``bitcoin-[version]/bin`` i.e. ``BITCOIND_PATH=~/programs/bitcoin-22.0/bin``

Each node (Alice, Bob and Carl) has a respective bitcoind working subdirectory named as them.

## Commands

This is the list of commands you can use in each node. Commands normaly has one or two letters as acronim of the command followed by the node mame for whom the command is executed.

* Creation-Destroying of nodes:
  * up[node].sh start bitcoind for alice.
  * upAll.sh starts all bitcoind instances (for Alice, Bob and Carl).
  * downAll.sh stops all bitcoind instances.
* Wallet creation (needed before mining any block)
  * cw[node].sh create wallet for [node].
* General comand-sending:
  * c[node].sh send a rpccommand to alice. i.e. ``calice.sh stop``
* General purpose commands:
  * l[node].sh (and similar) log debug.log for [node]. Needs ``bat`` installed.
* Cleaning & Re-creating:
  * rm[node].sh remove all files and directories (except wallet).
  * rmAllButWallets.sh as above, but for all nodes.
  * rmAllWithWallets.sh remove all files and directories for all nodes.
* Address creation and querying:
  * na[node].sh create a new address for [node] named addr[node]1
  * ga[node].sh get address of [node]
* Block creation:
  * gb[node].sh (optional:numblocks=1) generate numblocks mining.
* Transactions:
  * [node]st.sh [node] send to [alice|bob|carl] [amount] [fee in sat/vByte] i.e. alicest.sh bob 0.01 20
* Connect and disconnect:
  * connect.sh [alice|bob|carl] [alice|bob|carl] connect one node with the other.
