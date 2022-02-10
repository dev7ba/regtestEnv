#!/bin/bash

if [ "$#" -ne 1 ]; then
  ./calice.sh -generate 1
else
  ./calice.sh -generate $1
fi
