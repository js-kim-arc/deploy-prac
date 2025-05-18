FROM amazoncorretto:11-aipine-jdk
ARG JAR_FILE=target/*.jar
ARG PROFILES
ARG ENV
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dspring.profile.active=${PROFILES}","-Dserver.env=${ENV}","-jar",""]