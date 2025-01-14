#!/bin/bash

PEMPATH=$HOME/Downloads/aws-login.pem
SERVER=35.168.98.173

set -x

cd $HOME/Desktop/DevOps/aliteProjects/

zip -r next-app.zip next-app/* -x "next-app/node_modules/*"

scp -i $PEMPATH $HOME/Desktop/DevOps/aliteProjects/next-app.zip ubuntu@$SERVER:/home/ubuntu/next-app.zip

ssh -o StrictHostKeyChecking=no -i $PEMPATH ubuntu@$SERVER << EOF

cd /home/ubuntu/

unzip -o next-app.zip

cd next-app

npm install

npm run build

pm2 start npm --name "next-app" -- start