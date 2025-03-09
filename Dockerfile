FROM openjdk:17
COPY . /app
WORKDIR /app
RUN mvn package
CMD ["java", "-jar", "target/*.jar"]
