FROM ubuntu:14.04
MAINTAINER khainguyen "khainguyenptiter@gmail.com"

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y -q install software-properties-common htop wget python unzip \
	&& add-apt-repository -y ppa:webupd8team/java \
	&& apt-get -y -q update \
	&& echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
	&& apt-get -y -q install oracle-java8-installer \
 	&& update-java-alternatives -s java-8-oracle \
	&& wget https://downloads.typesafe.com/play/1.3.4/play-1.3.4.zip \
	&& unzip play-1.3.4.zip \
	&& mv play-1.3.4 /opt/ \
	&& wget download.java.net/glassfish/4.0/release/glassfish-4.0.zip \
	&& unzip glassfish-4.0.zip -d /home/





