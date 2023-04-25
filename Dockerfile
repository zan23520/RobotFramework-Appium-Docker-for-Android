#First reference https://blog.jdriven.com/2021/05/create-a-docker-image-running-robot-framework/

FROM debian:11.6
#re6exp/debian-jessie-oracle-jdk-8
#debian:8.11
#FROM python:3.9.0 
#FROM python:3.10.0a6-buster
RUN apt-get update && \
    apt-get install -y python3
    
RUN apt-get update && \
    apt-get install -y wget

#TODO JAVA jdk 8
##_________________________________________________


#FROM ubuntu
#RUN apt-get update
#RUN apt install -y python3.8
#RUN apt install -y python3-pip
#RUN pip3 install robotframework
#RUN pip3 install robotframework-appium

# Install all dependencies
#RUN apt-get update && \
 #   apt-get install -y python make g++ lib32z1 supervisor zip unzip && \
 #   apt-get clean && \
 #   apt-get autoclean && \
 #   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
#Install python, pip, is already on?

#Install Android SDK
#Install android tools + sdk
# SDK 17 is needed for Selendroid (you can install any SDK >= 17)
#RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.0 --force && \
 #   echo y | android update sdk --no-ui --all -t `android list sdk --all|grep "SDK Platform Android 4.2.2, API 17"|awk -F'[^0-9]*' '{print $2}'` && \
 #   rm -rf /tmp/*
    
# Create applicative user
#RUN useradd -m -s /bin/bash appium
#USER appium
   
#Install Node.js, npm comes with node
#ENV node_version v0.12.7
#RUN wget -qO- -P /home/appium https://nodejs.org/dist/${node_version}/node-${node_version}.tar.gz | tar -zx -C /home/appium && \
 #   cd /home/appium/node-${node_version}/ && ./configure --prefix=/home/appium/apps && make && make install && \
 #   rm -rf /home/appium/node-${node_version} /tmp/*

#Install Appium
#pip install robotframework
#pip install robotframework-appiumlibrary
#JDK 8
