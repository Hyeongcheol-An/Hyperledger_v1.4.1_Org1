# Hyperledger Fabric Container Up
docker rm $(docker ps -q -f status=exited)

docker rm -f $(docker ps -aq)
