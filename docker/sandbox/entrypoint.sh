#!/bin/bash
./run-bitcoin.sh
./generate-block-bitcoin.sh
cd code || return
make dep
export PATH="$PATH":"$HOME/.pub-cache/bin"
make
cd .. || return
./run-clightning.sh
cd code || return
RPC_PATH=/workdir/lightning_dir_two/regtest/lightning-rpc make ci