package modelo;

import java.util.ArrayList;
import java.util.List;

public class IncidenciaDAO {

    private static final List<Incidencia> listaIncidencias = new ArrayList<>();
    private static int contador = 1;

    // Agrega una nueva incidencia
    public static void agregar(Incidencia i) {
        i.setId(contador++);
        listaIncidencias.add(i);
    }

    // Retorna todas las incidencias
    public static List<Incidencia> listar() {
        return listaIncidencias;
    }

    // Buscar por ID
    public static Incidencia buscarPorId(int id) {
        for (Incidencia i : listaIncidencias) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    // Actualizar estado
    public static void actualizarEstado(int id, String estado) {
        Incidencia i = buscarPorId(id);
        if (i != null) {
            i.setEstado(estado);
        }
    }

    // Guardar respuesta
    public static void actualizarRespuesta(int id, String respuesta) {
        Incidencia i = buscarPorId(id);
        if (i != null) {
            i.setRespuesta(respuesta);
        }
    }

    // Guardar evaluación (esto es lo que usa el EvaluacionServlet)
    public static void guardarEvaluacion(int id, String evaluacion, String comentario) {
        Incidencia i = buscarPorId(id);
        if (i != null) {
            i.setEvaluacion(evaluacion);
            i.setComentario(comentario);
        }
    }

    public static List<Usuario> usuarios = new ArrayList<>();

static {
    usuarios.add(new Usuario("admin", "123", "prime"));
    usuarios.add(new Usuario("usuario", "123", "normal"));
}

}
