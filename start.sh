#!/bin/bash
pem=$(cat ./conf/pem.txt)
addrs=($(cat ./addrs.txt))

gethBegin=$(cat ./conf/groups.txt | grep -i -w geth | awk '{print $2}')
gethEnd=$(cat ./conf/groups.txt | grep -i -w geth | awk '{print $3}')


gwanBegin=$(cat ./conf/groups.txt | grep -i -w gwan| awk '{print $2}')
gwanEnd=$(cat ./conf/groups.txt | grep -i -w gwan| awk '{print $3}')


gethRpcBegin=$(cat ./conf/groups.txt | grep -i -w gethRpc | awk '{print $2}')
gethRpcEnd=$(cat ./conf/groups.txt | grep -i -w gethRpc | awk '{print $3}')


gwanRpcBegin=$(cat ./conf/groups.txt | grep -i -w gwanRpc| awk '{print $2}')
gwanRpcEnd=$(cat ./conf/groups.txt | grep -i -w gwanRpc| awk '{print $3}')


echo $gethBegin
echo $gethEnd

echo $gwanBegin
echo $gwanEnd

echo $gethRpcBegin
echo $gethRpcEnd

echo $gwanRpcBegin
echo $gwanRpcEnd

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
  	#gethnode
  	if [ $index -ge $gethBegin -a $index -le $gethEnd ]
  	then
	 echo ${index} + "geth " 
  		ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/bin/run.sh ${ip} ${addrs[index]} >~/bin/out.log 2>&1 &"
  		((index++))
		continue
  	fi
  	#gwannode
  	if [ $index -ge $gwanBegin  -a $index -le $gwanEnd ]
  	then
	 	echo ${index} + "gwan " 
  		ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/bin/runGwan.sh ${ip} ${addrs[index]} >~/bin/out.log 2>&1 &"
  		((index++))
		continue
  	fi
  	#gwanRpcNode
  	if [ $index -ge $gwanRpcBegin -a $index -le $gwanRpcEnd ]
  	then
	 	echo ${index} + "gwanRpc " 
	  	ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/bin/runGwanRpc.sh ${ip} ${addrs[index]} >~/bin/out.log 2>&1 &"
  		((index++))
		continue
  	fi
  	#gethRpcNode
  	if [ $index -ge $gethRpcBegin -a $index -le $gethRpcEnd ]
  	then
	 	echo ${index} + "gethiRpc" 
	  	ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "nohup ~/bin/runGethRpc.sh ${ip} ${addrs[index]} >~/bin/out.log 2>&1 &"
  		((index++))
		continue
  	fi
  else
	break
  fi
#  ((index++))
done
