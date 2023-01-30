
# First stage: complete build environment
FROM maven:3.6.0-jdk-11-slim AS BUILD_IMAGE
COPY ejemplo-maven .
RUN mvn clean package -e

#
FROM openjdk:11-jre-slim
COPY --from=BUILD_IMAGE /build/DevOpsUsach2020-0.0.1.jar .
EXPOSE 8081
ENTRYPOINT ["java","-jar","DevOpsUsach2020-0.0.1.jar"]


#docker build -t app-maven .
#docker run --rm -p 8081:8081 -it app-maven