FROM openjdk:17-jdk-alpine
RUN mkdir /app
ARG PORT_BUILD=8081
ENV PORT=$PORT_BUILD
EXPOSE $PORT
WORKDIR /app
COPY target/*.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]