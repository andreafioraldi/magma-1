#!/bin/bash
set -ex

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

if [ ! -d "$FUZZER/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

cd "$FUZZER/repo"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ./rustup.sh
sh ./rustup.sh -y

unset CFLAGS
unset CXXFLAGS
export CC=clang
export CXX=clang++

# Build LibAFL's fuzzbench fuzzer
cd fuzzers/fuzzbench

export LIBAFL_EDGES_MAP_SIZE=2621440
$HOME/.cargo/bin/cargo build --release
