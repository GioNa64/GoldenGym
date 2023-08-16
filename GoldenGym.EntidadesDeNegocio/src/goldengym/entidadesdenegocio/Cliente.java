
package goldengym.entidadesdenegocio;

import java.time.LocalDate;

public class Cliente {
    private int id;
    private int idGenero;
    private String nombre;
    private String apellido;
    private String codigo;
    private String email;
    private String telefono;
    private int edad;
    private LocalDate fechaRegistro;
    private int top_aux;
    private byte estatus;

    public Cliente() {
    }

    public Cliente(int id, int idGenero, String nombre, String apellido, String codigo, String email, String telefono, int edad, LocalDate fechaRegistro, int top_aux, byte estatus) {
        this.id = id;
        this.idGenero = idGenero;
        this.nombre = nombre;
        this.apellido = apellido;
        this.codigo = codigo;
        this.email = email;
        this.telefono = telefono;
        this.edad = edad;
        this.fechaRegistro = fechaRegistro;
        this.top_aux = top_aux;
        this.estatus = estatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public LocalDate getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDate fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getTop_aux() {
        return top_aux;
    }

    public void setTop_aux(int top_aux) {
        this.top_aux = top_aux;
    }

    public byte getEstatus() {
        return estatus;
    }

    public void setEstatus(byte estatus) {
        this.estatus = estatus;
    }

    
}
