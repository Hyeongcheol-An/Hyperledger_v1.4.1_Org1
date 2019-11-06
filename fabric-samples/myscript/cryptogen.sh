# Cryptogen and Configtxgen script

# Path configure
export FABRIC_CFG_PATH=$PWD
export PATH=$PATH:/home/an/fabric-samples/bin
export CORE_PEER_TLS_ENABLED=true

## Cryptogen
rm -rf crypto-config
cryptogen generate --config=./crypto-config.yaml

## Configtxgen
rm -rf channel-artifacts
mkdir channel-artifacts

configtxgen -profile TwoOrgsOrdererGenesisEtcdRaft -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block

configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel1.tx -channelID channel1

configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID channel1 -asOrg Org1MSP
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID channel1 -asOrg Org2MSP

## Copy crypto-config and channel-artifacts folders
sleep 1
./util/ssh.sh

sleep 1
./util/scp.sh
sleep 1

## Copy crypto-config and channel-artifacts folders in SDK
rm -rf /home/an/fabric-samples/myscript/sdk/network_resources/crypto-config
mkdir /home/an/fabric-samples/myscript/sdk/network_resources/crypto-config
cp -r /home/an/fabric-samples/myscript/crypto-config/* /home/an/fabric-samples/myscript/sdk/network_resources/crypto-config

rm -rf /home/an/fabric-samples/myscript/sdk/network_resources/config
mkdir /home/an/fabric-samples/myscript/sdk/network_resources/config
cp -r /home/an/fabric-samples/myscript/channel-artifacts/* /home/an/fabric-samples/myscript/sdk/network_resources/config
