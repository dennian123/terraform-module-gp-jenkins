#!bin/bash


apt-get update -y

#185 mb for java needs
#Java 11 or Java 17 for long-term-support
sudo apt install fontconfig openjdk-17-jre -y

#install Jenkins
#BEGIN PGP PUBLIC KEY BLOC:
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#sign repository Release:
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

#needs 91mb of archives
sudo apt-get install jenkins -y

systemctl start jenkins
systemctl enable jenkins

