#!/bin/bash
pem=$(cat ./conf/pem.txt)

for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "pkill -9 schnorrmpc && ps -ef|grep schnorrmpc"
  ((index++))
done
