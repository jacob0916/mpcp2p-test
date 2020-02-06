pem=$(cat ./conf/pem.txt)

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y  gcc g++ make "
  
  ((index++))
done

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "mkdir -p ~/schnorrmpc/bin && mkdir -p ~/schnorrmpc/data"

  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/nodekeys/n${ids[$index]} ubuntu@${ip}:~/schnorrmpc/data/nodekey
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/storemans.json  ubuntu@${ip}:~/schnorrmpc/data/storemans.json
  scp -o StrictHostKeyChecking=no -i ${pem} ./conf/pwd ubuntu@${ip}:~/schnorrmpc/data/pwd
  scp -o StrictHostKeyChecking=no -i ${pem} ./run.sh ubuntu@${ip}:~/schnorrmpc/bin/run.sh

  ((index++))
done
