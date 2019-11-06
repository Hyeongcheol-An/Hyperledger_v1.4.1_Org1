# Chaincode Install

export GOPATH=/home/an/fabric-samples/chaincode
export PATH=$PATH:/home/an/fabric-samples/bin
export FABRIC_CFG_PATH=/home/an/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

peer chaincode install -n edu -v 0 -l golang -p edu/go
echo '=============[Chaincode Installation Successful (Peer1-1)]=============='

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer1.org1.example.com:8051

peer chaincode install -n edu -v 0 -l golang -p edu/go
echo '=============[Chaincode Installation Successful (Peer1-2)]=============='

export CORE_PEER_LOCALMSPID="Org2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export CORE_PEER_ADDRESS=peer0.org2.example.com:7051

peer chaincode install -n edu -v 0 -l golang -p edu/go
echo '=============[Chaincode Installation Successful (Peer2-1)]=============='

export CORE_PEER_LOCALMSPID="Org2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export CORE_PEER_ADDRESS=peer1.org2.example.com:8051

peer chaincode install -n edu -v 0 -l golang -p edu/go
echo '=============[Chaincode Installation Successful (Peer2-2)]=============='

## Copy the Chaincode to SDK folder
rm -rf edu
mkdir edu
cp -r /home/an/fabric-samples/chaincode/src/edu/go/* /home/an/fabric-samples/myscript/sdk/network_resources/chaincode/src/github.com/edu