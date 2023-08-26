#!/bin/bash
sudo apt-get update -y # Update package information
sudo apt-get install openjdk-11-jre -y # Install OpenJDK 11 JRE
# Fetch Jenkins GPG key and add to keyring
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
# Add Jenkins repository to sources
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y # Update package information 
sudo apt-get install fontconfig openjdk-11-jre # Install fontconfig and OpenJDK 11 JRE
sudo apt-get install jenkins -y # Install Jenkins
sudo systemctl start jenkins # Start Jenkins service
sudo systemctl enable jenkins # Enable Jenkins service to start on boot