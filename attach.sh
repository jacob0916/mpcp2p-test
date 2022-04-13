pem=$(cat ./conf/pem.txt)
ips=($(awk '{print $1}' ./ip.txt))
echo $ips
echo $1
echo ${ips[$1]}
ssh -t -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ips[$1]} "./bin/geth attach ./data/gwan.ipc"
