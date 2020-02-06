#!/bin/bash
pem=$(cat ./conf/pem.txt)

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/schnorrmpc/bin/run.sh  >~/mpc.log 2>&1 &"
  ((index++))
done
