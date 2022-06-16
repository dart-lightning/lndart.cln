#!/bin/bash
./run-bitcoin.sh
./generate-block-bitcoin.sh
cd code || exit 1
make dep
export PATH="$PATH":"$HOME/.pub-cache/bin"
make
cd .. || exit 1
./run-clightning.sh
cd code || exit 1
ls -la
make RPC_PATH=/workdir/lightning_dir_one/regtest/lightning-rpc ci