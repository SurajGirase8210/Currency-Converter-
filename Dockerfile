FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy Gradle files first
COPY build.gradle settings.gradle gradlew ./
COPY gradle ./gradle

# Download Gradle dependencies
RUN ./gradlew dependencies --no-daemon || true

# Copy source code
COPY src ./src

# Build the jar
RUN ./gradlew build --no-daemon

# Run the jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "build/libs/app.jar"]
