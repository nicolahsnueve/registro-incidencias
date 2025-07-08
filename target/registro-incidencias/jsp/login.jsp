<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Gestión de Incidencias</title>
    <link rel="stylesheet" href="../css/estilos.css">
</head>
<body class="loglight">
    <div class="logcontainer">
        <h2 class="text-center">Gestion de Incidencias</h2>
        <div class="logcard" style="max-width: 400px;">
            <form action="../LoginServlet" method="post">
    <div class="m">
        <label for="usuario" class="formlabel">Usuario</label>
        <input type="text" class="formcontrol" id="usuario" name="usuario" placeholder="Ingrese su usuario">
    </div>
    <div class="m">
        <label for="clave" class="formlabel">Contraseña</label>
        <input type="password" class="formcontrol" id="clave" name="clave" placeholder="Ingrese su contraseña">
    </div>
    <button type="submit" class="logbtn">Ingresar</button>
</form>

        </div>
    </div>
</body>
</html>
