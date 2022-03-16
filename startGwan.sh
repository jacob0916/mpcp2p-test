#!/bin/bash
pem=$(cat ./conf/pem.txt)
addrs=($(cat ./addrs.txt))

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  #echo "~/bin/run.sh ${ip} ${addrs[index]}"

  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/bin/runGwan.sh ${ip} ${addrs[index]} >~/bin/out.log 2>&1 &"
  ((index++))
done
