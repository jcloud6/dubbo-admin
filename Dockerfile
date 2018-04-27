FROM tomcat:7

WORKDIR /code
RUN rm -rf /code/*

COPY demo.war  /code/
RUN unzip demo.war
RUN ls -hl /code/

### install ###
RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/webapps/ROOT
RUN cp -rf /code/* /usr/local/tomcat/webapps/ROOT/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]
