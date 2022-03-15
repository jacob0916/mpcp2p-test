#!/bin/bash
pem=$(cat ./conf/pem.txt)

#cd ~/wanchain/src/github.com/ethereum/go-ethereum && git checkout private_test && git pull && make

cd ~/jacob/mpcp2p-test

addrs=($(cat ./addrs.txt))

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}

  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/mpcp2p-test/run.sh ubuntu@${ip}:~/bin/run.sh

  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/src/github.com/ethereum/go-ethereum/build/bin/geth ubuntu@${ip}:~/bin/geth
  #
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/nodekeys/n${index} ubuntu@${ip}:~/data/nodekey
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/keystore/${addrs[$index]} ubuntu@${ip}:~/data/keystore/${addrs[$index]}
  #
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/pwd ubuntu@${ip}:~/data/pw.txt

  ((index++))

  echo ''
  echo ''
done

