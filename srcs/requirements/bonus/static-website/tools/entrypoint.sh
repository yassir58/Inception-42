#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash 
source ~/.bashrc
nvm install --lts
node --version
npm init -y
npm install express
exec "$@"
