#!/bin/bash
# Arg 1: number of repetitions
# Arg 2: dataset size in MB (100, 500 or 1500)

# Set env variables and clean old files
LD_LIBRARY_PATH=/home/mcostanzo/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
#cargo clean

 # Run tests
for ((i=1; i<=$1; i++))
do
	RUSTFLAGS='-L /home/mcostanzo/lib' cargo run --example single-spearman --no-default-features --release -q "../gem-$2mb.csv"
done
