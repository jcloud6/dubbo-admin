FROM ring2016/centos6-jdk7-maven3

WORKDIR /code
ADD server.xml /usr/local/tomcat6/conf/server.xml
ADD demo.war  /code/

### install ###
RUN mkdir -p $CATALINA_HOME/webapps/
RUN cp /code/demo.war $CATALINA_HOME/webapps/

### run ###
EXPOSE 80
CMD ["catalina.sh", "run"]

