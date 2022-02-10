#!/bin/bash
./calice.sh -named createwallet wallet_name=alice load_on_startup=true 
./cbob.sh -named createwallet wallet_name=bob load_on_startup=true 
./ccarl.sh -named createwallet wallet_name=carl load_on_startup=true 
