# Use JDK 17 for building
FROM openjdk:17-jdk-slim AS build

WORKDIR /app

# Copy everything from repo root
COPY . .

# Make gradlew executable
RUN chmod +x gradlew

# Build the application
RUN ./gradlew clean build --no-daemon -x test

# Run stage
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built jar from build stage
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
