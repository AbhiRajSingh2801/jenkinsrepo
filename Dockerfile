FROM tomcat:latest
LABEL maintainer="Abhishek"
ADD ./target/in28Minutes-first-webapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]