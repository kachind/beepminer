#!/bin/bash

while getopts :w:p:c: option
do
case "${option}"
in
w) WALLET=${OPTARG};;
p) POOL=${OPTARG};;
c) CPU=${OPTARG};;
esac
done

echo "$WALLET"
echo "$POOL"
echo "$CPU"

if [ "$CPU" -eq 0 ];then
  CPU=$((`getconf _NPROCESSORS_ONLN`/4))
fi

echo "$CPU"

UV_THREADPOOL_SIZE=${CPU} ./miner --wallet-address="$WALLET" --pool=${POOL} --miner=${CPU} --in-memory
