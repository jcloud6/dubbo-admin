FROM tomcat:6

WORKDIR /code
ADD server.xml /usr/local/tomcat6/conf/server.xml
ADD demo.war  /code/
#RUN cp /code/demo.war $CATALINA_HOME/webapps/
RUN unzip demo.war
RUN rm -f /code/demo.war

### install ###
RUN rm -rf $CATALINA_HOME/webapps/*
RUN mkdir -p $CATALINA_HOME/webapps/ROOT
RUN cp -rf /code/* $CATALINA_HOME/webapps/ROOT/

### run ###
EXPOSE 80
CMD ["catalina.sh", "run"]
