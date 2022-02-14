#!/bin/bash

echo "Start with clean environment"
./downAll.sh
./rmAllWithWallets.sh
echo "Start bitoind instances for Alice, Bob and Carl"
./upAll.sh
echo "Create wallets for every node."
./cwAll.sh
echo "Connections"
./connect.sh alice bob
./connect.sh alice carl
./connect.sh bob carl
echo "Alice generates 200 blocks."
./gbalice.sh 200
echo "Bob generates 200 blocks."
./gbbob.sh 200
echo "Create new address for each node"
./naAll.sh
echo "Press key when zmq-listening program is up and connected."
read -N 1
echo "Alice Send to Bob, 1 tx in all mempools since we are connected"
./alicest.sh bob
echo "Wait tx to propagate to other nodes"
sleep 10s
echo "Disconnect all nodes to simulate chain reorg."
./disconnect.sh alice bob
./disconnect.sh alice carl
./disconnect.sh bob carl
echo "Alice generates 10 tx when disconnected"
for n in {1..10}; do ./alicest.sh bob; done
echo "Alice generate 1 block containing 11 transactions"
./gbalice.sh
echo "Alice generate another transaction for Bob."
./alicest.sh bob
echo "Alice generate another block containing 1 transaction"
./gbalice.sh
echo "At this point Alice has generated two blocks and its mempool is empty." 
echo "Bob and Carl are oblivious of this since they are disconnected."
echo "Bob mines a block containing 1 transaction (the one sent by alice while connected)"
./gbbob.sh
echo "Bob create 2 transactions to Alice."
for n in {1..2}; do ./bobst.sh alice; done
echo "Bob mines a block containing last 2 txs."
./gbbob.sh
echo "Bob create 3 transactions to Alice."
for n in {1..3}; do ./bobst.sh alice; done
echo "Bob mines a block containing last 3 txs."
./gbbob.sh
echo "At this point both alice and bob mempool is empty, but Bob has mined 3 blocks and Alice only 2."
echo "We connect nodes again to see the chain reorg."
./connect.sh alice bob
./connect.sh alice carl
./connect.sh bob carl
echo "Wait for reorg in nodes."
sleep 1s
echo "Alice overrides its two blocks and all transactions oblivious to other nodes (11) are now in it's mempool."
./calice.sh getmempoolinfo
echo "Bob has its mempool empty since Alice does not resend transactions from overrided blocks."
./cbob.sh getmempoolinfo
