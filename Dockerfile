FROM tomcat:11
RUN apt-get update && apt-get install -y maven
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn clean package
RUN mv target/my-app.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]