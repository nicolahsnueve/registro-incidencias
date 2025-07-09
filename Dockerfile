# Usa Tomcat con JDK 17 (compatible con tu JDK 20)
FROM tomcat:9-jdk17

# Borra las apps por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia el .war generado y lo despliega como la app principal
COPY target/prototipoRegistroIncidencias.war /usr/local/tomcat/webapps/ROOT.war

# Expone el puerto 8080
EXPOSE 8080

# Comando para iniciar Tomcat
CMD ["catalina.sh", "run"]
