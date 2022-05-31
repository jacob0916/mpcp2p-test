#!/bin/bash
#$1 ipaddr
#$2 lockAddress
home=/home/ubuntu

nohup ~/bin/gwanOld  --port 17717  --nodekey=${home}/data/nodekey --syncmode=full --pluto --datadir=${home}/data  --password=${home}/data/pw.txt --mine --minerthreads=1 --etherbase  $2  --unlock $2  --verbosity 3 --wanstats $1:admin@wanstats.molin.tech

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
