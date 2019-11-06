#!/bin/bash

export PATH=$PATH:/home/an/fabric-samples/bin
export FABRIC_CFG_PATH=/home/an/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

if [ $# -eq 1 ];then
    if [[ "${1}" == "initLedger" ]]; then
        echo "Access the initLedger chaincode"
        peer chaincode invoke -C channel1 -n fabcar -c '{"Args":["initLedger"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
        echo "Success"
    elif [[ "${1}" == "queryCar" ]]; then
        echo "Access the queryCar chaincode"
        peer chaincode invoke -C channel1 -n fabcar -c '{"Args":["queryCar","CAR1"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
        echo "Success"
    elif [[ "${1}" == "queryAllCars" ]]; then
        echo "Access the queryAllCars chaincode"
        peer chaincode invoke -C channel1 -n fabcar -c '{"Args":["queryAllCars"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
        echo "Success"
    elif [[ "${1}" == "createCar" ]]; then
        echo "Access the createCar chaincode"
        peer chaincode invoke -C channel1 -n fabcar -c '{"Args":["createCar","CAR10","LGCNS","CityCar","red","gildong"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
        echo "Success"
    elif [[ "${1}" == "changeCarOwner" ]]; then
        echo "Access the changeCarOwner chaincode"
        peer chaincode invoke -C channel1 -n fabcar -c '{"Args":["changeCarOwner","CAR10","Hyeongcheol"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
        echo "Success"
    else
        echo "Invalid Function Name"
        echo "Usage ./invoke.sh [Function Name]"
        echo "[Chaincode Function List]"
        echo " - initLedger"
        echo " - queryCar"
        echo " - queryAllCars"
        echo " - createCar"
        echo " - changeCarOwner"
    fi
else
    echo "Usage ./invoke.sh [Function Name]"
    echo "[Chaincode Function List]"
    echo " - initLedger"
    echo " - queryCar"
    echo " - queryAllCars"
    echo " - createCar"
    echo " - changeCarOwner"
fi