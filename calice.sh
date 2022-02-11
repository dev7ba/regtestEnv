#!/bin/bash
($BITCOIND_PATH/bitcoin-cli -rpcconnect=pc:8332 $@)
