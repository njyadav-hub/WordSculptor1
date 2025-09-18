FROM tomcat:10.1-jdk21

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
