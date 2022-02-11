pem=$(cat ./conf/pem.txt)

addrs=($(cat ./addrs.txt))


cd ~/wanchain/mpcp2p-test

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  echo "./conf/keystore/${addrs[$index]}"

  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "mkdir -p ~/bin && mkdir -p ~/data/keystore"

  ((index++))
  echo ''
  echo ''
done
