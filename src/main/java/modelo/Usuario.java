package modelo;

public class Usuario {
    private final String usuario;
    private final String clave;
    private final String tipo; // "normal" o "prime"

    public Usuario(String usuario, String clave, String tipo) {
        this.usuario = usuario;
        this.clave = clave;
        this.tipo = tipo;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getClave() {
        return clave;
    }

    public String getTipo() {
        return tipo;
    }
}
