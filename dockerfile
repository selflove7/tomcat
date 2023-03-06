FROM ubuntu:16.04

# Install prerequisites

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get -y install openjdk-8-jdk wget

RUN apt-get -y install curl

RUN apt-get -y install vim

RUN mkdir /usr/local/tomcat

RUN wget http://mirrors.fibergrid.in/apache/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz -O /tmp/tomcat.tar.gz

RUN cd /tmp 

RUN tar -xvfz tomcat.tar.gz

RUN cp -Rv /tmp/apache-tomcat-10.0.20/* /usr/local/tomcat/

EXPOSE 8080

# java

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.

CMD ["bash"]

MAINTAINER Selflove

WORKDIR /usr/local/tomcat/webapps

RUN curl -O -L https://github.com/selflove7/tomcat.git/sample.war

CMD ["https://net.cloudinfrastructureservices.co.uk/usr/local/tomcat/bin/catalina.sh", "run"]
