sudo ssh -T an@192.168.57.1 << \EOF
cd /home/an/fabric-samples/myscript/util
./delete_folder.sh
EOF

sudo ssh -T an@192.168.58.1 << \EOF
cd /home/an/fabric-samples/myscript/util
./delete_folder.sh
EOF
