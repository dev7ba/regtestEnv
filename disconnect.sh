#!/bin/bash
# set -x

from="none"
to="none"
if [ "$#" -ge 1 ]; then
  if [ $1 == "alice" ]; then 
    from="./calice.sh"
  fi
  if [ $1 == "bob" ]; then 
    from="./cbob.sh"
  fi
  if [ $1 == "carl" ]; then 
    from="./ccarl.sh"
  fi
fi

if [ "$#" -ge 2 ]; then
  if [ $2 == "alice" ]; then 
    to="127.0.0.1:8331"
  fi
  if [ $2 == "bob" ]; then 
    to="127.0.0.1:8333"
  fi
  if [ $2 == "carl" ]; then 
    to="127.0.0.1:8335"
  fi
fi

if [ $from == "none" ] || [ $to == "none" ]; then
  echo "Error, usage is like this! ./connect.sh [alice|bob|carl] [alice|bob|carl]"
else
  echo Disconnect $1 to $2
  ($from disconnectnode $to)
fi
