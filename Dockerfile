# Use an official Maven image as a parent image
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean install

# Use a lightweight base image for the application
FROM adoptopenjdk/openjdk17:jdk-17.0.0_35-alpine-slim AS final

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /target/hello.jar .

# Set the command to run the application
CMD ["java", "-jar", "hello.jar"]