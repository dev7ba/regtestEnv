#!/bin/bash
./cbob.sh getaddressesbylabel addrBob1 | jq 'keys_unsorted'[0]
