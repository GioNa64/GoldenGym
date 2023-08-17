package goldengym.entidadesdenegocio;

import java.util.ArrayList;

public class TipoMembresia {
    private int id;
    private String nombre;
    private String descripcion;
    private double Precio;
    private int duracion;
    private byte estatus;
    private int top_aux;
    private ArrayList<Membresia> membresia;

    public TipoMembresia() {
    }

    public TipoMembresia(int id, String nombre, String descripcion, double Precio, int duracion, byte estatus, int top_aux, ArrayList<Membresia> membresia) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.Precio = Precio;
        this.duracion = duracion;
        this.estatus = estatus;
        this.top_aux = top_aux;
        this.membresia = membresia;
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

    public int getTop_aux() {
        return top_aux;
    }

    public void setTop_aux(int top_aux) {
        this.top_aux = top_aux;
    }

    public ArrayList<Membresia> getMembresia() {
        return membresia;
    }

    public void setMembresia(ArrayList<Membresia> membresia) {
        this.membresia = membresia;
    }

    
    
    
}
