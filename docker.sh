#!/bin/bash

# Add Jenkins repository key
sudo apt-get update && sudo apt-get install -y gnupg2 curl software-properties-common
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# Add Jenkins repository
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update package lists
sudo apt-get update

# Install Jenkins and Docker
sudo apt-get install -y jenkins docker.io

# Start Docker service
sudo systemctl start docker

# Enable Docker service to start on boot
sudo systemctl enable docker

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins service to start on boot
sudo systemctl enable jenkins

# Install Git
sudo apt-get install -y git

# Set hostname
sudo hostnamectl set-hostname Master-server

# Install Java (OpenJDK 11)
sudo apt-get install -y openjdk-11-jdk

# Display Jenkins initial admin password
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword