FROM golang:1.12

COPY configuration.json yca-queue.go ./

RUN go get github.com/aandriyc/napping && \
    go get github.com/jmoiron/sqlx && \
    go get github.com/lib/pq && \
    go get github.com/streadway/amqp

RUN go build yca-queue.go

CMD ["./yca-queue", "-configuration-path=configuration.json"]

#CMD ["./yca-queue"]

#docker build -t yca-queue .
#docker run yca-queue
#docker run -d yca-queue
#docker run -d -p 8080:8080 yca-queue

#ADD target/spring-boot-docker.jar spring-boot-docker.jar
##EXPOSE 8081
#ENTRYPOINT ["java", "-jar", "spring-boot-docker.jar"]
#------------------------

#mvn clean package
# docker build -f Dockerfile -t serzh/spring-boot-docker:1.1 .
# docker run -p 8082:8082 serzh/spring-boot-docker:1.1
#GET http://localhost:8082/docker/hello

#java -jar spring-boot-docker.jar

#FROM openjdk:11
#FROM openjdk:11-jdk-slim