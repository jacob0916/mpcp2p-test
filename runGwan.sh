#!/bin/bash
#$1 ipaddr
#$2 lockAddress
home=/home/ubuntu

nohup ~/bin/gwan  --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --mine --minerthreads=1 --etherbase  $2  --unlock $2  --verbosity 4 --wanstats $1:admin@139.198.161.211:8888

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
