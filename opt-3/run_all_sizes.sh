#!/bin/bash
# Arg 1: example program name
# Arg 2: number of repetitions
# Arg 3: number of threads

# Set env variables and clean old files
PROGRAM_NAME=$1
LD_LIBRARY_PATH=/home/mcostanzo/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

 # Run tests
for size in 100 500 1500
do
	echo "$PROGRAM_NAME: Testing T=$3, size=${size}"

	for ((i=1; i<=$2; i++))
	do
		RUSTFLAGS='-L /home/mcostanzo/lib' cargo run --example $PROGRAM_NAME --no-default-features --release -q $3 "../gem-${size}mb.csv"
	done
done
