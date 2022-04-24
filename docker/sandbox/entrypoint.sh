#!/bin/bash
./run-bitcoin.sh
./generate-block-bitcoin.sh
./run-clightning.sh
cd code || return
make dep
RPC_PATH=/workdir/lightning_dir_two/regtest/lightning-rpc dart test