package goldengym.entidadesdenegocio;

import java.time.LocalDate;

public class Membresia {
    private int id;
    private int idCliente;
    private int idTipoMembresia;
    private LocalDate fechaRegistro;
    private LocalDate fechaVencimiento;
    private byte estatus;
    private Cliente cliente;
    private TipoMembresia tipomembresia;
    private int top_aux;

    public Membresia() {
    }

    public Membresia(int id, int idCliente, int idTipoMembresia, LocalDate fechaRegistro, LocalDate fechaVencimiento, byte estatus, Cliente cliente, TipoMembresia tipomembresia, int top_aux) {
        this.id = id;
        this.idCliente = idCliente;
        this.idTipoMembresia = idTipoMembresia;
        this.fechaRegistro = fechaRegistro;
        this.fechaVencimiento = fechaVencimiento;
        this.estatus = estatus;
        this.cliente = cliente;
        this.tipomembresia = tipomembresia;
        this.top_aux = top_aux;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdTipoMembresia() {
        return idTipoMembresia;
    }

    public void setIdTipoMembresia(int idTipoMembresia) {
        this.idTipoMembresia = idTipoMembresia;
    }

    public LocalDate getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDate fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public LocalDate getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(LocalDate fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public byte getEstatus() {
        return estatus;
    }

    public void setEstatus(byte estatus) {
        this.estatus = estatus;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public TipoMembresia getTipomembresia() {
        return tipomembresia;
    }

    public void setTipomembresia(TipoMembresia tipomembresia) {
        this.tipomembresia = tipomembresia;
    }

    public int getTop_aux() {
        return top_aux;
    }

    public void setTop_aux(int top_aux) {
        this.top_aux = top_aux;
    }

    
    
    
    
}
