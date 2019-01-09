#!/bin/bash

while getopts :w:p:c:s option
do
case "${option}"
in
w) WALLET=${OPTARG};;
p) POOL=${OPTARG};;
c) CPU=${OPTARG};;
s) SEED=${OPTARG};;
esac
done

if [ "$CPU" -eq 0 ];then
  CPU=$((`getconf _NPROCESSORS_ONLN`/4))
fi

UV_THREADPOOL_SIZE=${CPU} ./miner --wallet-address="$WALLET" --pool=${POOL} --miner=${CPU} --seed=${SEED} --in-memory
