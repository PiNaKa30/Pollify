FROM openjdk:12-jdk-alpine

COPY target/*.war app.war

ENTRYPOINT ["java","-jar","/app.war"]
