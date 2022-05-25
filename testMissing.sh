#!/bin/bash

echo "Start with clean environment"
./downAll.sh
./rmAllWithWallets.sh
echo "Start bitoind instances for Alice, Bob and Carl"
./upAll.sh
echo "Waiting for all nodes to start"
sleep 10s
echo "Create wallets for every node."
./cwAll.sh
echo "Connections"
./connect.sh alice carl
./connect.sh alice bob 
echo "Alice generates 200 blocks."
./gbalice.sh 200
echo "Bob generates 200 blocks."
./gbbob.sh 200
echo "Carl generates 200 blocks."
./gbcarl.sh 200
echo "Create new address for each node"
./naAll.sh
echo "Press key when zmq-listening program is up and connected."
read -N 1
echo "Disconnecting bob from carl since it is not needed in test."
./disconnect.sh alice bob 

echo "Iterates disconnection, generation of transaction, then block and reconnection to generate ignored txs..."
for n in {1..10} 
do
  echo "iteration..."
  ./disconnect.sh alice carl
  ./alicest.sh carl
  ./gbcarl.sh
  ./connect.sh alice carl
  sleep 1s
done

