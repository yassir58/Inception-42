#!/bin/bash

echo "Unstoppable@2020" | sudo -l -S

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg ssh

# Add Docker’s official GPG key
sudo install  -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

# installing fillZilla 
sudo apt-get update
sudo apt-get install -y filezilla


# add docker user 
sudo groupadd docker
sudo usermod -aG docker $USER

docker run hello-world > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Docker is installed!"
else
    echo "Docker is not installed!"
fi

