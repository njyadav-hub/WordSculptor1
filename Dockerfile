FROM tomcat:10.1-jdk17

# WAR file को Tomcat के webapps folder में copy करो
COPY WordSculptor.war /usr/local/tomcat/webapps/WordSculptor.war

# Render को बताओ कि यह पोर्ट use होगा
EXPOSE 8080

CMD ["catalina.sh", "run"]
