#!/bin/bash
./calice.sh getaddressesbylabel addrAlice1 | jq 'keys_unsorted'[0]
