# Use a base image with JDK and Maven installed
FROM maven:3.8.4-openjdk-11 AS build

# Set the JAVA_HOME environment variable to use JDK 11
ENV JAVA_HOME=/usr/local/openjdk-11

# Set the working directory in the container
WORKDIR /app

# Copy the source code into the container
COPY App/* .

# Build the application using Maven
RUN mvn clean package

# Use a lightweight base image with JRE installed
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the build stage to the container
COPY --from=build /app/target/my-app-1.0.jar .

# Expose the port that your Spring Boot application listens on
EXPOSE 8089

# Define the command to run your application
CMD ["java", "-jar", "my-app-1.0.jar"]