#!/bin/bash
./ccarl.sh getaddressesbylabel addrCarl1 | jq -r 'keys_unsorted'[0]

