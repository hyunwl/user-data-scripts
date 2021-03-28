#!/bin/bash

# User-data script for Ubuntu Server LTS 64-bit

# Update & upgrade
echo "\n--- Starting update & upgrade ---\n"
sudo apt-get update
sudo apt-get upgrade
echo "\n--- Finished update & upgrade ---\n"

# Vim configs
echo "\n--- Configuring Vim ---\n"
mkdir ~/.vim
git clone https://github.com/camgunz/amber.git ~/.vim
echo 'colorscheme amber' >> ~/.vimrc
echo 'inoremap jk <Esc>' >> ~/.vimrc
echo "\n--- Finished configuring Vim ---\n"

# Docker installation
echo "\n--- Installing Docker CE & CLI ---\n"
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
echo "\n--- Installed Docker CE & CLI ---\n"
echo "1. Run 'sudo docker run hello-world' to verify successful installation\n"

# Terraform installation
echo "\n--- Installing Terraform CLI v0.14.9 ---\n"
sudo apt-get install unzip -y
wget https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_arm64.zip -P ~
unzip ~/terraform_0.14.9_linux_arm64.zip
sudo mv terraform /usr/local/bin/
sudo rm -f ~/terraform_0.14.9_linux_arm64.zip
echo "\n--- Installed Terraform CLI v0.14.9 ---\n"
echo "1. Run 'terraform -help' to verify successful installation\n"

# AWS CLI V2 installation
echo "\n--- Installing AWS CLI V2 ---\n"
sudo apt-get install zip -y # Prerequisite
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
echo "\n--- Installed AWS CLI V2 ---\n"
echo "1. Run 'aws --version' to verify successful installation"
echo "\n2. Run 'aws configure' to add credentials\n"
