#!/bin/bash
# Add Jenkins repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
# Update and install dependencies
sudo apt-get update
sudo apt-get upgrade -y

# Install Jenkins
sudo apt-get install jenkins -y
# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Install Git
sudo apt-get install git -y
# Set hostname
sudo hostnamectl set-hostname Master-server


sudo apt-get install openjdk-11-jdk -y