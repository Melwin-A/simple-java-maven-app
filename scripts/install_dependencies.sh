#!/bin/bash

# Update the package repository
sudo yum update -y

# Install Ansible if not already installed
if ! command -v ansible &> /dev/null
then
    echo "Ansible not found. Installing Ansible..."
    sudo amazon-linux-extras install ansible2 -y
else
    echo "Ansible is already installed"
fi
