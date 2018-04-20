FROM tomcat:6
#FROM ring2016/centos6-jdk7-maven3

#RUN yum -y update && yum -y install unzip

WORKDIR /code
RUN rm -rf /code/*
ADD server.xml /usr/local/tomcat/conf/server.xml
ADD demo.war  /code/
#RUN cp /code/demo.war $CATALINA_HOME/webapps/
RUN unzip demo.war
RUN rm -f /code/demo.war

### install ###
#RUN rm -rf /usr/local/tomcat/webapps/*
#RUN mkdir -p /usr/local/tomcat/webapps/ROOT
RUN cp -rf /code/* /usr/local/tomcat/webapps/ROOT/

### run ###
EXPOSE 80
CMD ["catalina.sh", "run"]
