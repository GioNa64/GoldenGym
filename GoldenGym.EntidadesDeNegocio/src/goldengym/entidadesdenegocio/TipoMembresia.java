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
    private ArrayList<Membresia> membresias;

    public TipoMembresia() {
    }

    public TipoMembresia(int id, String nombre, String descripcion, double Precio, int duracion, byte estatus, int top_aux, ArrayList<Membresia> membresias) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.Precio = Precio;
        this.duracion = duracion;
        this.estatus = estatus;
        this.top_aux = top_aux;
        this.membresias = membresias;
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

    public ArrayList<Membresia> getMembresias() {
        return membresias;
    }

    public void setMembresias(ArrayList<Membresia> membresias) {
        this.membresias = membresias;
    }
    
    public static class EstatusUsuario {

        public static final byte ACTIVO = 1;
        public static final byte INACTIVO = 2;
    }   
}
