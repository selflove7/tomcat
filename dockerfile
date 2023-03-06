FROM ubuntu:16.04

# Install prerequisites

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get -y install openjdk-8-jdk wget

RUN apt-get -y install curl

RUN apt-get -y install vim

RUN mkdir /usr/local/tomcat

RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.zip -O /tmp/apache-tomcat-8.5.87.zip

RUN cd /tmp 

RUN apt-get -y install unzip 

RUN unzip apache-tomcat-8.5.87.zip

RUN cp -Rv /tmp/apache-tomcat-8.5.87/* /usr/local/tomcat/

EXPOSE 8080

# java

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.

CMD ["bash"]

MAINTAINER Selflove

WORKDIR /usr/local/tomcat/webapps

RUN curl -O -L https://github.com/selflove7/tomcat.git/sample.war

CMD ["https://net.cloudinfrastructureservices.co.uk/usr/local/tomcat/bin/catalina.sh", "run"]
