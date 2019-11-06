# Channel Create

export PATH=$PATH:/home/an/fabric-samples/bin
export FABRIC_CFG_PATH=/home/an/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

peer channel create -o orderer1.example.com:7050 -c channel1 \
-f /home/an/fabric-samples/myscript/channel-artifacts/channel1.tx --tls true \
--cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

echo '======================[Channel Create Successful]======================='


## Copy the block file
./util/trans_scp.sh 192.168.57.1 channel1.block
echo '=================[Copy the block file Successful (VM2)]=================='

./util/trans_scp.sh 192.168.58.1 channel1.block
echo '=================[Copy the block file Successful (VM3)]=================='
