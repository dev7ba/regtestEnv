#!/bin/bash
find ./bob/regtest -not -path "*/wallet*" -type f -delete
find ./bob/regtest -mindepth 1 -not -path "./bob/regtest/wallets*" -type d -exec rm -rf {} +
