#!/bin/bash
pem=$(cat ./conf/pem.txt)

cd ~/src/github.com/ethereum/go-ethereum && git checkout private_test & git pull && make

cd ~/wanchain/p2ptest

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}

  scp -o StrictHostKeyChecking=no -i ${pem} ~/src/github.com/ethereum/go-ethereum/build/bin/geth ubuntu@${ip}:~/bin/geth
  scp -o StrictHostKeyChecking=no -i ${pem} ~/p2ptest/run.sh ubuntu@${ip}:~/bin/run.sh

  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/nodekeys/n${ids[$index]} ubuntu@${ip}:~/data/nodekey
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/pwd ubuntu@${ip}:~/data/pw.txt

  ((index++))
done

