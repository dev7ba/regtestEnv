#!/bin/bash
# set -x

addr="none"
amount=0.001
fee=1
if [ "$#" -ge 1 ]; then
  if [ $1 == "bob" ]; then 
    addr=$(./gabob.sh)
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
  echo "Error, usage is like this! ./alicest.sh [bob|carl] [amount] [fee]"
else
  echo Alice send to $1\'s address $addr $amount BTC
  ./calice.sh -named sendtoaddress address=$addr amount=$amount fee_rate=$fee
fi
