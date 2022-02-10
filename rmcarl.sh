#!/bin/bash
find ./carl/regtest -not -path "*/wallet*" -type f -delete
find ./carl/regtest -mindepth 1 -not -path "./carl/regtest/wallets*" -type d -exec rm -rf {} +
