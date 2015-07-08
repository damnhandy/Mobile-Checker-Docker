FROM ubuntu:15.04

MAINTAINER Ryan J. McDonough "ryan@damnhandy.com"
RUN apt-get -y update && \
    apt-get install -y curl wget software-properties-common python python-pip unzip

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    curl https://deb.nodesource.com/setup_0.12 | bash - && \
    wget -q https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.0-beta-1/browsermob-proxy-2.1.0-beta-1-bin.zip && \
    unzip browsermob-proxy-2.1.0-beta-1-bin.zip -d /opt &&\
    apt-get update -y && \
    apt-get install -y -q \
      nodejs \
      google-chrome-stable \
      openjdk-8-jre-headless \
      x11vnc \
      xvfb \
      xfonts-100dpi \
      xfonts-75dpi \
      xfonts-scalable \
      xfonts-cyrillic \
      imagemagick \
      git \
      git-core \
      build-essential && \
      pip install supervisor

COPY supervisord.conf /usr/local/etc/supervisord.conf

WORKDIR /opt
RUN git clone https://github.com/w3c/Mobile-Checker.git
WORKDIR /opt/Mobile-Checker
RUN npm install
ENV DISPLAY :1.0
CMD ["/usr/local/bin/supervisord"]
