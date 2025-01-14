#!/bin/bash
PEMPATH=$HOME/Downloads/aws-login.pem
SERVER=35.168.98.173
set -x

cd $HOME/Desktop/DevOps/aliteProjects/

zip -r flaskApp.zip flaskApp/*

scp -i $PEMPATH $HOME/Desktop/DevOps/aliteProjects/flaskApp.zip ubuntu@$SERVER:/home/ubuntu/flaskApp.zip

ssh -o StrictHostKeyChecking=no -i $PEMPATH ubuntu@$SERVER << EOF

unzip -o flaskApp.zip < /dev/null

cd flaskApp/

pwd

if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi

source .venv/bin/activate

pip3 install -r requirements.txt

pm2 start pookie/main.py --interpreter python3

EOF
