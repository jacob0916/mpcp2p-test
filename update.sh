#!/bin/bash
pem=$(cat ./conf/pem.txt)

cd ~/src/github.com/wanchain/schnorr-mpc && git checkout p2ptest & git pull && make schnorrmpc

cd ~/p2ptest

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}

  scp -o StrictHostKeyChecking=no -i ${pem} ~/src/github.com/wanchain/schnorr-mpc/build/bin/schnorrmpc ubuntu@${ip}:~/schnorrmpc/bin/schnorrmpc
  scp -o StrictHostKeyChecking=no -i ${pem} ~/p2ptest/run.sh ubuntu@${ip}:~/schnorrmpc/bin/run.sh

  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/nodekeys/n${ids[$index]} ubuntu@${ip}:~/schnorrmpc/data/nodekey
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/storemans.json  ubuntu@${ip}:~/schnorrmpc/data/storemans.json
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/pwd ubuntu@${ip}:~/schnorrmpc/data/pwd

  ((index++))
done

