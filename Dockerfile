FROM maven:3.8.8-eclipse-temurin-17
COPY . /app
WORKDIR /app
RUN mvn package
CMD ["java", "-jar", "target/*.jar"]

