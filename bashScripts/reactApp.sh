!#/bin/bash

SERVER=35.168.98.173
PEMPATH=$HOME/Downloads/aws-login.pem

set -x

cd $HOME/Desktop/DevOps/aliteProjects/reactExample

pwd

zip -r reactApp.zip reactApp/*

scp -i $PEMPATH $HOME/Desktop/DevOps/aliteProjects/reactExample/reactApp.zip ubuntu@$SERVER:/home/ubuntu/reactApp.zip

ssh -o StrictHostKeyChecking=no -i $PEMPATH ubuntu@$SERVER 

uzip reactApp.zip


