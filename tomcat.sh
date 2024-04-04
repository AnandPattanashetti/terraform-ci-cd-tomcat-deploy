#!/bin/bash

# Set hostname
hostname tomcat-server

# Install Java OpenJDK 11
sudo apt update
sudo apt install openjdk-11-jdk -y

# Install necessary tools
sudo apt install git wget -y

# Create directory for Tomcat installation
sudo mkdir /tomcat
cd /tomcat

# Download and extract Apache Tomcat
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz
sudo tar -xvzf apache-tomcat-10.1.19.tar.gz
sudo mv apache-tomcat-10.1.19 tomcat

# Make startup and shutdown scripts executable
sudo chmod +x /tomcat/tomcat/bin/startup.sh 
sudo chmod +x /tomcat/apache-tomcat-9/bin/shutdown.sh

# Create symbolic links for convenience
sudo ln -s /tomcat/tomcat/bin/startup.sh /usr/local/bin/tomcatup
sudo ln -s /tomcat/tomcat/bin/shutdown.sh /usr/local/bin/tomcatdown

# Start Tomcat
sudo tomcatup

# Update the system
sudo apt upgrade -y
