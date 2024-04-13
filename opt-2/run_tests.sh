#!/bin/bash
# Arg 1: example program name
# Arg 2: number of repetitions
# Arg 3: dataset size in MB (100, 500 or 1500)
# Arg 4: number of threads

# Set env variables and clean old files
PROGRAM_NAME=$1
LD_LIBRARY_PATH=/home/mcostanzo/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

 # Run tests
for T in $4
do
	echo "$PROGRAM_NAME: Testing T=$T"

	for ((i=1; i<=$2; i++))
	do
		RUSTFLAGS='-L /home/mcostanzo/lib' cargo run --example $PROGRAM_NAME --no-default-features --release -q $T "../gem-$3mb.csv"
	done
done
