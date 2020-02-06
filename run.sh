#!/bin/bash

nohup ~/schnorr/bin/schnorrmpc --verbosity 4 --port 27718 --storeman --datadir ~/schnorr/data --ipcpath ~/schnorr/data/gwan.ipc --maxpeers 100 --nodekey ~/schnorr/data/nodekey --threshold 17 --totalnodes 21 --password ~/schnorr/data/pwd

echo "start finish"
#curl ifconfig.me 

echo ''
echo ''
