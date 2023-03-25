FROM openjdk:11
ADD target/comp367-lab2.jar comp367-lab2.jar
ENTRYPOINT ["java", "-jar", "comp367-lab2.jar"]
