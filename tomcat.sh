#!/bin/bash
hostname tomcat-server
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install git wget -y
sudo mkdir /tomcat
cd tomcat
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.tar.gz
sudo tar -xvzf /tomcat/apache-tomcat-9.0.70.tar.gz
sudo mv /tomcat/apache-tomcat-9.0.70 /tomcat/apache-tomcat-9

sudo chmod +x /tomcat/apache-tomcat-9/bin/startup.sh 
sudo chmod +x /tomcat/apache-tomcat-9/bin/shutdown.sh

sudo ln -s /tomcat/apache-tomcat-9/bin/startup.sh /usr/local/bin/tomcatup
sudo ln -s /tomcat/apache-tomcat-9/bin/shutdown.sh /usr/local/bin/tomcatdown
tomcatup

sudo yum update -y