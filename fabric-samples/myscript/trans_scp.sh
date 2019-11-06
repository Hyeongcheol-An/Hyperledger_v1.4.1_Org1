#scp

if [ $# -eq 2 ];then
    echo "IP 주소: $1, file: $2"
    sudo scp -r /home/an/fabric-samples/myscript/${2} \
    an@$1:/home/an/fabric-samples/myscript/
else
    echo "[Usage] ./trans_scp.sh [IP address] [file]"
fi
