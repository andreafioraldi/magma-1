#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone --no-checkout https://github.com/AFLplusplus/LibAFL.git "$FUZZER/repo"
git -C "$FUZZER/repo" checkout 0692a370390c5b0601d893980c8d4562c489b280
