<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="modelo.Incidencia, modelo.IncidenciaDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Evaluar Atención</title>
    <link rel="stylesheet" href="../css/estilos.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="inccontainer">
    <h3>Evaluación de Atención</h3>

    <form action="../EvaluarIncidenciaServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

        <div class="m">
            <label>1. ¿Cómo fue su atención?</label><br>
            <label><input type="radio" name="atencion" value="Mala" required> Mala</label><br>
            <label><input type="radio" name="atencion" value="Regular"> Regular</label><br>
            <label><input type="radio" name="atencion" value="Buena"> Buena</label><br>
            <label><input type="radio" name="atencion" value="Excelente"> Excelente</label>
        </div>

        <div class="m">
            <label>2. ¿Se resolvió su incidencia?</label><br>
            <label><input type="radio" name="resolucion" value="Sí" required> Sí</label><br>
            <label><input type="radio" name="resolucion" value="No"> No</label>
        </div>

        <div class="m">
            <label>3. Comentario (opcional)</label><br>
            <textarea name="comentario" class="formcontrol" rows="3" placeholder="Ingrese su comentario..."></textarea>
        </div>

        <button type="submit" class="btnsuccess">Enviar Evaluación</button>
    </form>
</div>
</body>
</html>
