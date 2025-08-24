# Use JDK 17 for building the app
FROM openjdk:17-jdk-slim AS build

WORKDIR /app

# Copy Gradle files
COPY demo/build.gradle demo/settings.gradle demo/gradlew ./
COPY demo/gradle ./gradle

# Download dependencies
RUN ./gradlew dependencies --no-daemon || true

# Copy source code
COPY demo/src ./src

# Build the application
RUN ./gradlew build --no-daemon

# Run stage
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built jar from build stage
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
