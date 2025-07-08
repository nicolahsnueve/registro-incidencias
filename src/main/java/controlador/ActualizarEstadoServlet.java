package controlador;

import modelo.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class ActualizarEstadoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String estado = request.getParameter("estado");
        String nuevaRespuesta = request.getParameter("respuesta");

        Incidencia inc = IncidenciaDAO.buscarPorId(id);
        if (inc != null) {
            inc.setEstado(estado);

            // Si ya tenía respuestas previas, las conservamos
            String respuestaAnterior = inc.getRespuesta() != null ? inc.getRespuesta() : "";

            int siguienteNumero = 1;
            if (!respuestaAnterior.isEmpty()) {
                // Contamos cuántas líneas hay
                String[] lineas = respuestaAnterior.split("\n");
                siguienteNumero = lineas.length + 1;
            }

            String respuestaActualizada = respuestaAnterior + (respuestaAnterior.isEmpty() ? "" : "\n")
                + siguienteNumero + ". " + nuevaRespuesta;

            inc.setRespuesta(respuestaActualizada);
        }

        response.sendRedirect("jsp/listarIncidencia.jsp");
    }
}
