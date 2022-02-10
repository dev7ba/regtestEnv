#!/bin/bash
./cbob.sh getaddressesbylabel addrBob1 | jq -r 'keys_unsorted'[0]
