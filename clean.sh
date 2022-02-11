#!/bin/bash
pem=$(cat ./conf/pem.txt)

index=0
#ids=($(awk '{print $1}' ip_index.txt))
for ip in $(awk '{print $2}' ./conf/ip_index.txt)
do 
  #echo ${index} ${ip} ${ids[$index]}
  echo ${index} ${ip} ${ids[$index]}

  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "rm -rf ~/data/gwan"
  ((index++))
done
