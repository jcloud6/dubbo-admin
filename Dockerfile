FROM tomcat:7

WORKDIR /code
RUN rm -rf /code/*

COPY dubbo-admin-2.5.3.war  /code/

RUN unzip dubbo-admin-2.5.3.war
RUN ls -hl /code/

### install ###
RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/webapps/ROOT
RUN cp -rf /code/* /usr/local/tomcat/webapps/ROOT/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]
