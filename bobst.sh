#!/bin/bash
# set -x

addr="none"
amount=0.001
fee=1
if [ "$#" -ge 1 ]; then
  if [ $1 == "alice" ]; then 
    addr=$(./gaalice.sh)
  fi
  if [ $1 == "carl" ]; then 
    addr=$(./gacarl.sh)
  fi
fi

if [ "$#" -ge 2 ]; then
  amount=$2
fi
if [ "$#" -ge 3 ]; then
  fee=$3
fi

if [ $addr == "none" ]; then
  echo "Error, usage is like this! ./bobst.sh [alice|carl] [amount] [fee]"
else
  echo Bob send to $1\'s address $addr $amount BTC
  ./cbob.sh -named sendtoaddress address=$addr amount=$amount fee_rate=$fee
fi
