FROM openjdk:17
EXPOSE 9095
ADD target/MyPetClinic-0.0.1-SNAPSHOT.war MyPetClinic-0.0.1-SNAPSHOT.war
ENTRYPOINT [ "java", "-jar", "/MyPetClinic-0.0.1-SNAPSHOT.war" ]