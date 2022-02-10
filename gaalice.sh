#!/bin/bash
./calice.sh getaddressesbylabel addrAlice1 | jq -r 'keys_unsorted'[0]
