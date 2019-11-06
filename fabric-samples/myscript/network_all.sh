# Hyperledger Fabric Network Setup

## Run Cryptogen script
echo '=========================[Run Cryptogen Script]========================='
./cryptogen.sh
sleep 2
echo '================================[Done]=================================='

## Docker Up
echo '===============================[Docker Up]==============================='
echo '============================[Docker Up (VM1)]============================'
./up_docker.sh
echo '================================[Done]=================================='

echo '============================[Docker Up (VM2)]============================'
sudo ssh -T an@192.168.57.1 << \EOF
cd /home/an/fabric-samples/myscript
./up_docker.sh
EOF
echo '================================[Done]=================================='

echo '============================[Docker Up (VM3)]============================'
sudo ssh -T an@192.168.58.1 << \EOF
cd /home/an/fabric-samples/myscript
./up_docker.sh
EOF
sleep 5
echo '================================[Done]=================================='

## Channel Create and Join
echo '============================[Channel Create]============================'
./channel-create.sh
sleep 2
echo '================================[Done]=================================='

echo '=============================[Channel Join]============================='
./channel-join.sh
sleep 2
echo '================================[Done]=================================='

## Chaincode Install and Instantiate
echo '==========================[Chaincode Install]=========================='
./chaincode-install.sh
sleep 2
echo '================================[Done]=================================='

echo '=========================[Chaincode Instantiate]========================='
./chaincode-instantiate.sh
echo '================================[Done]=================================='

echo '==============================[All Done]================================'
echo '======================[Run the invoke.sh script]========================'