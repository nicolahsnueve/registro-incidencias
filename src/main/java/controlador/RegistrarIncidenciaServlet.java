package controlador;

import modelo.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegistrarIncidenciaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String descripcion = request.getParameter("descripcion");
    String area = request.getParameter("area");
    String prioridad = request.getParameter("prioridad");
    String estado = request.getParameter("estado");
    String fecha = request.getParameter("fecha"); // ✅ leer la fecha del formulario

    // Usa el constructor con fecha
    Incidencia nueva = new Incidencia(descripcion, area, prioridad, estado, fecha);
    IncidenciaDAO.agregar(nueva);

    response.sendRedirect("jsp/listarIncidencia.jsp");
}

}
