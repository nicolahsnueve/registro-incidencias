# Etapa 1: Compilar con Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Servir con Tomcat
FROM tomcat:9-jdk17

# Elimina las apps por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia el .war desde la etapa de build
COPY --from=build /app/target/prototipoRegistroIncidencias.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
