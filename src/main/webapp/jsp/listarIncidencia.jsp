<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, modelo.Incidencia, modelo.IncidenciaDAO, modelo.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Incidencias</title>
    <link rel="stylesheet" href="../css/estilos.css">
 
</head>
<body>
<jsp:include page="header.jsp" />
<div class="inccontainer">
    <h3>Listado de Incidencias</h3>

    <%
        Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
        boolean esAdmin = usuarioSesion != null && usuarioSesion.getTipo().equals("prime");
        List<Incidencia> lista = IncidenciaDAO.listar();
    %>

    <table class="inctable">
        <thead>
        <tr>
            <th>ID</th>
            <th>Descripción</th>
            <th>Área</th>
            <th>Prioridad</th>
            <th>Estado</th>
            <th>Fecha</th>
            <th>Respuesta</th>
            <th>Evaluación</th>
            <th>Actualización</th>
        </tr>
        </thead>
        <tbody>
        <% for (Incidencia inc : lista) { %>
            <tr>
                <td><%= inc.getId() %></td>
                <td><%= inc.getDescripcion() %></td>
                <td><%= inc.getArea() %></td>
                <td><%= inc.getPrioridad() %></td>
                <td><%= inc.getEstado() != null ? inc.getEstado() : "Pendiente" %></td>
                <td><%= inc.getFecha() %></td>
                <td class="evaluacion-col">
    <div class="evaluacion-col">
        <%= inc.getRespuesta() != null ? inc.getRespuesta().replaceAll("\n", "<br/>") : "-" %>
    </div>
</td>


                <td class="evaluacion-col">
    <% if (inc.getEvaluacion() != null) { %>
        <div class="evaluacion-col">
            <%= inc.getEvaluacion().replaceAll("\n", "<br/>") %>
        </div>
    <% } else if (!esAdmin && "Finalizado".equals(inc.getEstado())) { %>
        <a href="evaluarIncidencia.jsp?id=<%= inc.getId() %>">
            <button type="button">Evaluar</button>
        </a>
    <% } else { %>
        -
    <% } %>
</td>


                <td>
                    <% if (esAdmin) { %>
                        <form action="../ActualizarEstadoServlet" method="post">
                            <input type="hidden" name="id" value="<%= inc.getId() %>">
                            <select name="estado">
                                <option value="Pendiente" <%= "Pendiente".equals(inc.getEstado()) ? "selected" : "" %>>Pendiente</option>
                                <option value="En curso" <%= "En curso".equals(inc.getEstado()) ? "selected" : "" %>>En curso</option>
                                <option value="Finalizado" <%= "Finalizado".equals(inc.getEstado()) ? "selected" : "" %>>Finalizado</option>
                            </select>
                            <br>
                            <textarea name="respuesta" rows="3" cols="30" placeholder="Agregar respuesta..."></textarea>
                            <br>
                            <button type="submit">Actualizar</button>
                        </form>
                    <% } else { %>
                        -
                    <% } %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
