# 빌드 스테이지
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean install -DskipTests

# 실행 스테이지
FROM openjdk:21
WORKDIR /app
COPY --from=builder /app/target/DearUs-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 9000

CMD ["java", "-jar", "app.jar"]