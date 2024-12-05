package pe.edu.utp.ftags.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class Salida implements Serializable {

    private int idRegistroEntrada;
    private String NombreConductor;
    private String Placa;
    private TipoVehiculo tipoVehiculo;
    private boolean lavado;
    private LocalDateTime FechaHoraEntrada;
    private LocalDateTime FechaHoraSalida;
    private double total;
    private int idConductor;
    private int idVehiculo;

    public Salida() {
        idRegistroEntrada = 0;
        NombreConductor = "";
        Placa = "";
        tipoVehiculo = TipoVehiculo.MOTO;
        lavado = false;
        FechaHoraEntrada = LocalDateTime.now();
        FechaHoraSalida = LocalDateTime.now();
        total = 0;
        idConductor = 0;
        idVehiculo = 0;
    }

    public Salida(int idRegistroEntrada, String nombreConductor, String placa, TipoVehiculo tipoVehiculo, boolean lavado, LocalDateTime fechaHoraEntrada, LocalDateTime fechaHoraSalida, double total, int idConductor, int idVehiculo) {
        this.idRegistroEntrada = idRegistroEntrada;
        this.NombreConductor = nombreConductor;
        this.Placa = placa;
        this.tipoVehiculo = tipoVehiculo;
        this.lavado = lavado;
        this.FechaHoraEntrada = fechaHoraEntrada;
        this.FechaHoraSalida = fechaHoraSalida;
        this.total = total;
        this.idConductor = idConductor;
        this.idVehiculo = idVehiculo;
    }

    public int getIdRegistroEntrada() {
        return idRegistroEntrada;
    }

    public void setIdRegistroEntrada(int idRegistroEntrada) {
        this.idRegistroEntrada = idRegistroEntrada;
    }

    public String getNombreConductor() {
        return NombreConductor;
    }

    public void setNombreConductor(String nombreConductor) {
        NombreConductor = nombreConductor;
    }

    public String getPlaca() {
        return Placa;
    }

    public void setPlaca(String placa) {
        Placa = placa;
    }

    public TipoVehiculo getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(TipoVehiculo tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }

    public boolean getLavado() {
        return lavado;
    }

    public void setLavado(boolean lavado) {
        this.lavado = lavado;
    }

    public LocalDateTime getFechaHoraEntrada() {
        return FechaHoraEntrada;
    }

    public void setFechaHoraEntrada(LocalDateTime fechaHoraEntrada) {
        FechaHoraEntrada = fechaHoraEntrada;
    }

    public LocalDateTime getFechaHoraSalida() {
        return FechaHoraSalida;
    }

    public void setFechaHoraSalida(LocalDateTime fechaHoraSalida) {
        FechaHoraSalida = fechaHoraSalida;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getIdConductor() {
        return idConductor;
    }

    public void setIdConductor(int idConductor) {
        this.idConductor = idConductor;
    }

    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }
}
