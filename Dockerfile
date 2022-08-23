## syntax=docker/dockerfile:experimental
# Java image
FROM openjdk:17
# Khi container bat len thi tu dong nhay vao thu muc nay
# working directory
WORKDIR /app

EXPOSE 8080
#Copy from Host(PC , Laptop) to container
COPY ./target/ASM_Java6-0.0.1-SNAPSHOT.jar .

#Run inside container
CMD ["java","-jar", "ASM_Java6-0.0.1-SNAPSHOT.jar"]
# syntax=docker/dockerfile:experimental
# Java image
#FROM openjdk:11
## Khi container bat len thi tu dong nhay vao thu muc nay
## working directory
#WORKDIR /app
##Copy from Host(PC , Laptop) to container
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
##Run this inside the image
#RUN ./mvnw dependency:go-offline
#COPY src ./src
##Run inside container
#CMD ["./mvnw", "spring-boot:run"]
