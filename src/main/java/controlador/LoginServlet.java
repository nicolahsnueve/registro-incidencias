package controlador;

import modelo.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        Usuario user = null;

        for (Usuario u : IncidenciaDAO.usuarios) {
            if (u.getUsuario().equals(usuario) && u.getClave().equals(clave)) {
                user = u;
                break;
            }
        }

       if (user != null) {
    HttpSession session = request.getSession();
    session.setAttribute("usuario", user);

    if (user.getTipo().equals("prime")) {
        response.sendRedirect("jsp/listarIncidencia.jsp");
    } else {
        response.sendRedirect("jsp/registrarIncidencia.jsp");
    }
} else {
    response.sendRedirect("jsp/login.jsp?error=1");
}

    }
}
