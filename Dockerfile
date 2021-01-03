# syntax=docker/dockerfile:experimental
#FROM openjdk:11-jre-slim
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
##EXPOSE 8081
#ENTRYPOINT ["java", "-jar", "spring-boot-docker.jar"]
#------------------------

# syntax=docker/dockerfile:experimental
#FROM openjdk:8-jdk-alpine as build
FROM openjdk:11-jdk-slim as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN --mount=type=cache,target=/root/.m2 ./mvnw install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM openjdk:11-jre-slim
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.serzh.docker.SpringBootDockerApplication"]

#mvn clean package
# docker build -f Dockerfile -t serzhzag/spring-boot-docker .
# docker build -f Dockerfile -t serzhzag/spring-boot-docker:2.1 .
# docker run -p 8089:8082 serzhzag/spring-boot-docker:2.1
#Out -> 8089

#docker build -f Dockerfile -t serzhzag/spring-boot-docker:green .
#docker push serzhzag/spring-boot-docker
#GET http://localhost:8082/docker/hello

#java -jar spring-boot-docker.jar

#FROM openjdk:11
#FROM openjdk:11-jdk-slim

#cd /Users/khorlodemchog/WorkProg/spring-boot-docker