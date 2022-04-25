#!/bin/bash
#$1 ipaddr
#$2 lockAddress
home=/home/ubuntu

#disable http
#nohup ~/bin/gwan --http.port 36891 --http.addr 0.0.0.0 --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --mine --miner.threads=1 --miner.etherbase  $2 --unlock $2 --snapshot=false --gcmode=archive --verbosity 4 --ethstats $1:admin@139.198.161.211:8888

nohup ~/bin/gwan --http.port 36891 --http.addr 0.0.0.0 --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --mine --miner.threads=1 --miner.etherbase  $2 --unlock $2 --snapshot=false --gcmode=archive --verbosity 4 --ethstats $1:admin@wanstats.molin.tech
#nohup ~/bin/gwan --http.port 36891 --http.addr 0.0.0.0 --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --mine --miner.threads=1 --miner.etherbase  $2 --unlock $2 --snapshot=false --gcmode=archive --verbosity 3 --ethstats $1:admin@139.198.161.211:8888

#nohup ~/bin/geth --http --http.port 36891 --http.addr 0.0.0.0 --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --mine --miner.threads=1 --miner.etherbase  $2 --unlock $2 --snapshot=false --gcmode=archive --verbosity 4

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
