#!/bin/bash
./ccarl.sh getaddressesbylabel addrCarl1 | jq 'keys_unsorted'[0]

