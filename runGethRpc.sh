#!/bin/bash
#$1 ipaddr
#$2 lockAddress
home=/home/ubuntu


nohup ~/bin/geth --http --http.port 36891 --http.addr 0.0.0.0  --http.api=admin,debug,eth,miner,net,personal,pluto,rpc,txpool,wan,web3,pos --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --snapshot=false --gcmode=archive --verbosity 4

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
