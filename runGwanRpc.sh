#!/bin/bash
#$1 ipaddr
#$2 lockAddress
home=/home/ubuntu

nohup ~/bin/gwan  --rpc --rpcport 36891 --rpcaddr 0.0.0.0 --rpcapi=admin,debug,eth,miner,net,personal,pluto,rpc,txpool,wan,web3,pos --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --verbosity 4 

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
