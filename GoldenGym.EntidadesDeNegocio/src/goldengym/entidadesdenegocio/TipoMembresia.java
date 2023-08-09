package goldengym.entidadesdenegocio;

public class TipoMembresia {
    private int id;
    private String nombre;
    private String descripcion;
    private double Precio;
    private int duracion;
    private byte estatus;

    public TipoMembresia() {
    }

    public TipoMembresia(int id, String nombre, String descripcion, double Precio, int duracion, byte estatus) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.Precio = Precio;
        this.duracion = duracion;
        this.estatus = estatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public byte getEstatus() {
        return estatus;
    }

    public void setEstatus(byte estatus) {
        this.estatus = estatus;
    }
    
    
}
