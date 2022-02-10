#!/bin/bash
find ./alice/regtest -not -path "*/wallet*" -type f -delete
find ./alice/regtest -mindepth 1 -not -path "./alice/regtest/wallets*" -type d -exec rm -rf {} +
