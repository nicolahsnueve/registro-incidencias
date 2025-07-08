<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Incidencia</title>
    <link rel="stylesheet" href="../css/estilos.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="inccontainer">
        <h3>Registrar Nueva Incidencia</h3>
        <form action="../RegistrarIncidenciaServlet" method="post">
            <input type="hidden" name="accion" value="registrar">
            <div class="m">
                <label class="formlabel">Descripción</label>
                <textarea class="formcontrol" name="descripcion" rows="3" placeholder="Detalle del problema..." required></textarea>
            </div>
            <div class="m">
                <label class="formlabel">Área</label>
                <input type="text" name="area" value="Soporte Tecnico" readonly />
            </div>
            <div class="m">
                <label class="formlabel">Prioridad</label>
                <select class="formselect" name="prioridad" required>
                    <option>Alta</option>
                    <option>Media</option>
                    <option>Baja</option>
                </select>
            </div>
            <div class="m">
                <label class="formlabel">Fecha de Registro</label>
                <input type="text" class="formcontrol" name="fecha" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly>
            </div>
            <button type="submit" class="btnsuccess">Guardar Incidencia</button>
        </form>
    </div>
</body>
</html>
