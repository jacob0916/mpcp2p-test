#!/bin/bash
pem=$(cat ./conf/pem.txt)

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
  	ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "echo 'eth.blockNumber' | ./bin/gwan attach ./data/gwan.ipc"
 fi 

  ((index++))
done
