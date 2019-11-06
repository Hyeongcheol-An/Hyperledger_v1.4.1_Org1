# crypto-config / channel-artifact

# Org2
sudo scp -r /home/an/fabric-samples/myscript/channel-artifacts/* \
an@192.168.57.1:/home/an/fabric-samples/myscript/channel-artifacts/

sudo scp -r /home/an/fabric-samples/myscript/crypto-config/* \
an@192.168.57.1:/home/an/fabric-samples/myscript/crypto-config/

# Orderer
sudo scp -r /home/an/fabric-samples/myscript/channel-artifacts/* \
an@192.168.58.1:/home/an/fabric-samples/myscript/channel-artifacts/

sudo scp -r /home/an/fabric-samples/myscript/crypto-config/* \
an@192.168.58.1:/home/an/fabric-samples/myscript/crypto-config/
