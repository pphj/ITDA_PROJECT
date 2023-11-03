FROM openjdk:17-ea-11-jdk-slim
COPY ./target/ITDA-0.0.1-SNAPSHOT.war /security.war
copy ./cook1.png /usr/src/cook1.png
ENTRYPOINT ["java", "-jar", "security.war"]

