#!/bin/bash

if [ "$#" -ne 1 ]; then
  ./ccarl.sh -generate 1
else
  ./ccarl.sh -generate $1
fi
