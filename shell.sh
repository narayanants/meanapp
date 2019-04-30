#!/bin/sh
echo $PATH
echo "Install node modules"
npm install
echo "Start docker image"
docker build -t narayanants/nodeapp .
docker run  --rm -p 6000:6000 -d narayanants/nodeapp
