#!/bin/bash

if [ "$#" -ne 1 ]; then
  ./cbob.sh -generate 1
else
  ./cbob.sh -generate $1
fi
