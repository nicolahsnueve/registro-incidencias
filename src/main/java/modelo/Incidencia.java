package modelo;

public class Incidencia {
    private int id;
    private String descripcion;
    private String area;
    private String prioridad;
    private String estado = "Pendiente";
    private String fecha;
    private String respuesta;

    // NUEVOS CAMPOS PARA EVALUACIÓN
    private String evaluacion;
    private String comentario;

    public Incidencia(int id, String descripcion, String area, String prioridad, String estado, String fecha) {
        this.id = id;
        this.descripcion = descripcion;
        this.area = area;
        this.prioridad = prioridad;
        this.estado = estado;
        this.fecha = fecha;
        this.respuesta = "";
        this.evaluacion = null;
        this.comentario = null;
    }

    // Constructor sin ID (para cuando se agregue desde DAO)
    public Incidencia(String descripcion, String area, String prioridad, String estado, String fecha) {
        this.descripcion = descripcion;
        this.area = area;
        this.prioridad = prioridad;
        this.estado = estado;
        this.fecha = fecha;
        this.respuesta = "";
        this.evaluacion = null;
        this.comentario = null;
    }

    // Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getArea() {
        return area;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public String getEstado() {
        return estado;
    }

    public String getFecha() {
        return fecha;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public String getEvaluacion() {
        return evaluacion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public void setEvaluacion(String evaluacion) {
        this.evaluacion = evaluacion;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
