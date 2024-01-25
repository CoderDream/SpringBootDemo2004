#FROM registry-scu.cloudtogo.cn/ubuntu:jdk
FROM openjdk:8-jdk-alpine

ARG app
ADD $app app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
