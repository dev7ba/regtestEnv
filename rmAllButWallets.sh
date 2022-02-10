#!/bin/bash
find ./alice/regtest -not -path "*/wallet*" -type f -delete
find ./alice/regtest -mindepth 1 -not -path "./alice/regtest/wallets*" -type d -exec rm -rf {} +
find ./bob/regtest -not -path "*/wallet*" -type f -delete
find ./bob/regtest -mindepth 1 -not -path "./bob/regtest/wallets*" -type d -exec rm -rf {} +
find ./carl/regtest -not -path "*/wallet*" -type f -delete
find ./carl/regtest -mindepth 1 -not -path "./carl/regtest/wallets*" -type d -exec rm -rf {} +
