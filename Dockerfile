FROM ubuntu:14.04
MAINTAINER khainguyen "khainguyenptiter@gmail.com"

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y -q install software-properties-common htop wget python unzip
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -y -q update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get -y -q install oracle-java8-installer
RUN apt-get -y -q install oracle-java7-installer
RUN update-java-alternatives -s java-8-oracle
RUN wget https://downloads.typesafe.com/play/1.3.4/play-1.3.4.zip
RUN unzip play-1.3.4.zip
RUN PATH=$PATH:play-1.3.4
RUN export PATH


