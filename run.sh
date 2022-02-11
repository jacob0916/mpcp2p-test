#!/bin/bash
#$1 ipaddr
#$2 lockAddress
nohup ~/bin/geth --http --http.port 8545 --http.addr $1 --port 17717  --nodekey=~/data/nodekey --syncmode=full --pluto --datadir=~/data  --password=~/data/pw.txt --miner.threads=1 --miner.etherbase  $2 --unlock $2 --snapshot=false --gcmode=archive --verbosity 4 2>&1 >~/data/geth.log &

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
