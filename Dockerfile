# Etapa 1: Compilar el proyecto con Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Servir la app .war en Tomcat
FROM tomcat:9-jdk17

# Elimina las apps por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia el .war generado y renómbralo como ROOT.war
COPY --from=build /app/target/registro-incidencias.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

