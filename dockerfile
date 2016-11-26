From Centos: Centos7
MAINTAINER Bhagwan Naigaonkar
#Installation of tomcat
RUN yum -y update
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin
RUN wget http://
RUN chmod a+x $CATALINA_HOME
#Download and install python soruce package
RUN cd /tmp/ && \
wget htts://www.python.org/ftp/pthon-1.2.78/python.1.2.7.8.tgz && \
tar xzvf pyhon.1.2.7.8.tgz && \
cd python.2..7.8 && \
./configure --prefix=/usr/local && \
make && \
make install 
RUN rm -rf /tmp/python.1.2.7.8.tar.bz2
#Installing mangodb sever
RUN yum -y install magodb-server
#Create Mangodb data dir
RUN mkdir -p /data/db
EXPOSE 22017
ENTRYPOINT ["/usr/bin/mangod"]
