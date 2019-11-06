#!/bin/bash

export PATH=$PATH:/home/an/fabric-samples/bin
export FABRIC_CFG_PATH=/home/an/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/an/fabric-samples/myscript/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

if [ $# -ge 1 ];then
    if [[ "${1}" == "insertMember" ]]; then
        if [ $# -eq 6 ];then
            echo "Access the insertMember chaincode"
            peer chaincode invoke -C channel1 -n edu -c '{"Args":["'"${1}"'","'"${2}"'","'"${3}"'","'"${4}"'","'"${5}"'","'"${6}"'"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
            echo "Success"
        else
            echo "Usage ./invoke.sh insertMember [EmployeeNo] [Name | Team | Position]"
        fi
    elif [[ "${1}" == "updateMember" ]]; then
        if [ $# -eq 4 ];then
            echo "Access the updateMember chaincode"
            peer chaincode invoke -C channel1 -n edu -c '{"Args":["'"${1}"'","'"${2}"'","'"${3}"'","'"${4}"'"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
            echo "Success"
        else
            echo "Usage ./invoke.sh updateMember [EmployeeNo] [Team | Position]"
        fi
    elif [[ "${1}" == "deleteMember" ]]; then
        if [ $# -eq 2 ];then
            echo "Access the deleteMember chaincode"
            peer chaincode invoke -C channel1 -n edu -c '{"Args":["'"${1}"'","'"${2}"'"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
            echo "Success"
        else
            echo "Usage ./invoke.sh deleteMember [EmployeeNo]"
        fi
    elif [[ "${1}" == "queryMember" ]]; then
        if [ $# -eq 2 ];then
            echo "Access the queryMember chaincode"
            peer chaincode invoke -C channel1 -n edu -c '{"Args":["'"${1}"'","'"${2}"'"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
            echo "Success"
        else
            echo "Usage ./invoke.sh queryMember [EmployeeNo]"
        fi
    elif [[ "${1}" == "queryMemberByRange" ]]; then
        if [ $# -eq 3 ];then
            echo "Access the queryMemberByRange chaincode"
            peer chaincode invoke -C channel1 -n edu -c '{"Args":["'"${1}"'","'"${2}"'","'"${3}"'"]}' --tls true --cafile /home/an/fabric-samples/myscript/crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
            echo "Success"
        else
            echo "Usage ./invoke.sh queryMemberByRange [StartEmployeeNo | EndEmployeeNo]"
        fi
    else
        echo "Invalid Function Name"
        echo "Usage ./invoke.sh [Function Name] [arg0 | ...]"
        echo "[Chaincode Function List]"
        echo " - insertMember"
        echo " - updateMember"
        echo " - deleteMember"
        echo " - queryMember"
        echo " - queryMemberByRange"
    fi
else
    echo "Usage ./invoke.sh [Function Name] [arg0 | ...]"
    echo "[Chaincode Function List]"
    echo " - insertMember"
    echo " - updateMember"
    echo " - deleteMember"
    echo " - queryMember"
    echo " - queryMemberByRange"
fi