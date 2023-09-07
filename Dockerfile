FROM ubuntu:latest
RUN apt-get update \
    && apt-get install default-jdk -y
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz .
RUN tar -xzf apache-tomcat-9.0.80.tar.gz \ 
    && mv apache-tomcat-9.0.80 tomcat
COPY **/*.war /opt/tomcat/webapps
EXPOSE 8080
CMD [ "/opt/tomcat/bin/catalina.sh", "run" ]
