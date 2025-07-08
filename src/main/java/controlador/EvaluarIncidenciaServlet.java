package controlador;

import modelo.Incidencia;
import modelo.IncidenciaDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EvaluarIncidenciaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String atencion = request.getParameter("atencion");
        String resolucion = request.getParameter("resolucion");
        String comentario = request.getParameter("comentario");

        Incidencia inc = IncidenciaDAO.buscarPorId(id);

        if (inc != null) {
            String evaluacion = "1. Atención: " + atencion + "\n"
                              + "2. ¿Se resolvió?: " + resolucion;

            if (comentario != null && !comentario.trim().isEmpty()) {
                evaluacion += "\n3. Comentario: " + comentario.trim();
            }

            inc.setEvaluacion(evaluacion);
        }

        HttpSession session = request.getSession();
        session.setAttribute("mensaje", "Su evaluación ha sido registrada con éxito. ¡Muchas gracias!");
        response.sendRedirect("jsp/listarIncidencia.jsp");
    }
}

