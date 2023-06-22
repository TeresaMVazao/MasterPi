# Start with a base image containing Java runtime
FROM adoptopenjdk:11-jdk-hotspot

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper files (pom.xml, .mvn) to the container
COPY mvnw .
COPY .mvn .mvn

# Copy the project source code to the container
COPY src src

# Copy the Maven configuration files to the container
COPY pom.xml .
COPY create.sql .

# Build the application with Maven
RUN ./mvnw package -DskipTests

# Set the application's JAR file as the entry point
ENTRYPOINT ["java", "-jar", "target/master_process-0.0.1-SNAPSHOT.jar"]
