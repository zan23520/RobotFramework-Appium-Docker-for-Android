#First reference https://blog.jdriven.com/2021/05/create-a-docker-image-running-robot-framework/

FROM python:3.9.0 
#FROM python:3.10.0a6-buster

#FROM ubuntu
#RUN apt-get update
#RUN apt install -y python3.8
#RUN apt install -y python3-pip
#RUN pip3 install robotframework
#RUN pip3 install robotframework-appium

LABEL name="RobotFramework-Appium Docker build"

MAINTAINER zan23520

RUN apt-get update \
    && apt-get install -y xvfb wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
       libatspi2.0-0 libcups2 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 \
       libxcomposite1 libxkbcommon0 libxrandr2 xdg-utils ntpdate openssl

RUN python3 -m pip install robotframework && pip install robotframework-requests &&  pip install robotframework-selenium2library \
    && pip install xvfbwrapper && pip install robotframework-xvfb && pip install certifi && pip install asn1crypto \
    && pip install bcrypt && pip install robotframework-sshlibrary && pip install cryptography && pip install pyOpenSSL \
    && pip install idna && pip install requests[security]

# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && rm google-chrome*.deb \
    && wget -q https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && rm chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin \
    && chmod +x /usr/local/bin/chromedriver

CMD ["/scripts/run_suite.sh"]


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
