#!/bin/bash
sudo yum -y update

#install git
sudo yum install -y git

#get Dockerfile on repo
mkdir -r site/temp && cd site/temp
git init
git clone https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation.git
cp dockerfile ./site
cd ..
rm -Rf temp/*

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker

# build and run nginx and website
docker build nginx:latest
docker run --name webserver nginx

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
