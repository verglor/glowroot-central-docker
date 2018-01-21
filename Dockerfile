FROM openjdk:8-alpine

MAINTAINER Jaroslav Kostal <jaroslav@kostal.sk>

ARG GLOWROOT_VERSION="0.10.0"

#RUN mkdir -p /glowroot

RUN wget "https://github.com/glowroot/glowroot/releases/download/v${GLOWROOT_VERSION}/glowroot-central-${GLOWROOT_VERSION}-dist.zip" -P / -O /glowroot-central-dist.zip; \
    unzip /glowroot-central-dist.zip; \
    rm /glowroot-central-dist.zip

WORKDIR /glowroot-central

EXPOSE 4000 8181

ENTRYPOINT ["java", "-jar", "glowroot-central.jar"]
