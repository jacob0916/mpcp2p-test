#!/bin/bash
pem=$(cat ./conf/pem.txt)

#cd ~/jacob/src/github.com/ethereum/go-ethereum && git checkout aws_private && git pull && make

cd ~/jacob/mpcp2p-test

addrs=($(cat ./addrs.txt))
validBeginIndex=0
validEndIndex=${#addrs[@]}

echo "validBeginIndex=""${validBeginIndex}"
echo "validEndIndex=""${validEndIndex}"


if [ -n "$1" ]
then
	validBeginIndex=$1
fi

if [ -n "$2" ]
then
	validEndIndex=$2
fi

echo "validBeginIndex=""${validBeginIndex}"
echo "validEndIndex=""${validEndIndex}"

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  
 if [ ${index} -ge ${validBeginIndex} -a ${index} -le ${validEndIndex} ] 
 then
  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/mpcp2p-test/run.sh ubuntu@${ip}:~/bin/run.sh
#  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/mpcp2p-test/runGwan.sh ubuntu@${ip}:~/bin/runGwan.sh
#  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/mpcp2p-test/runGethRpc.sh ubuntu@${ip}:~/bin/runGethRpc.sh
#  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/mpcp2p-test/runGwanRpc.sh ubuntu@${ip}:~/bin/runGwanRpc.sh
#

#update gwan
#  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/go-wanchain/build/bin/gwan ubuntu@${ip}:~/bin/gwan
#update geth
  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/src/github.com/wanchain/go-wanchain/build/bin/gwan ubuntu@${ip}:~/bin/gwan

#  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "cp ~/bin/gwan ~/bin/gwan.bak"

#  scp -o StrictHostKeyChecking=no -i ${pem} ~/gwan ubuntu@${ip}:~/bin/aws_gwan
#  scp -o StrictHostKeyChecking=no -i ${pem} ~/jacob/src/github.com/wanchain/go-wanchain/build/bin/old_gwan ubuntu@${ip}:~/bin/old_gwan
#  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/nodekeys/n${index} ubuntu@${ip}:~/data/nodekey
#  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/keystore/${addrs[$index]} ubuntu@${ip}:~/data/keystore/${addrs[$index]}
#  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/pwd ubuntu@${ip}:~/data/pw.txt
 fi
  ((index++))

  echo ''
  echo ''
done

