FROM tomcat:9.0

# Default ROOT webapp हटाते हैं
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# अपना ROOT.war Tomcat के webapps में डालते हैं
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

