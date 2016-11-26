From Centos: Centos7
MAINTAINER Bhagwan Naigaonkar
#Installation of tomcat
# Install Tomcat
RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.0.15/bin/apache-tomcat-8.0.15.tar.gz && \
tar -xvf apache-tomcat-8.0.15.tar.gz && \
  rm apache-tomcat*.tar.gz && \
  mv apache-tomcat* ${CATALINA_HOME} 
RUN chmod +x ${CATALINA_HOME}/bin/*sh
EXPOSE 8080
EXPOSE 7080
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

# by this command you can run tomcat on both port 
# for starup you can add this scipt in rc.local file
docker run -it --rm -p 7080:8080 tomcat:8.0
