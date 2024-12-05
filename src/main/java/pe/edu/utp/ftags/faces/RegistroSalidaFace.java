package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.TipoVehiculo;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.time.LocalDateTime;

@ManagedBean
@SessionScoped
public class RegistroSalidaFace implements Serializable {

    private int idRegistroSalida;
    private String NombreEstacionamiento;
    private String NombreConductor;
    private String Placa;
    private TipoVehiculo tipoVehiculo;
    private String lavado;
    private LocalDateTime FechaHoraEntrada;
    private LocalDateTime FechaHoraSalida;
    private double total;

    public RegistroSalidaFace() {
        idRegistroSalida = 0;
        NombreEstacionamiento = "";
        NombreConductor = "";
        Placa = "";
        tipoVehiculo = TipoVehiculo.MOTO;
        lavado = "";
        FechaHoraEntrada = LocalDateTime.now();
        FechaHoraSalida = LocalDateTime.now();
        total = 0;
    }

    public RegistroSalidaFace(int idRegistroSalida, String nombreEstacionamiento, String nombreConductor, String placa, TipoVehiculo tipoVehiculo, String lavado, LocalDateTime fechaHoraEntrada, LocalDateTime fechaHoraSalida, double total) {
        this.idRegistroSalida = idRegistroSalida;
        NombreEstacionamiento = nombreEstacionamiento;
        NombreConductor = nombreConductor;
        Placa = placa;
        this.tipoVehiculo = tipoVehiculo;
        this.lavado = lavado;
        FechaHoraEntrada = fechaHoraEntrada;
        FechaHoraSalida = fechaHoraSalida;
        this.total = total;
    }

    public int getIdRegistroSalida() {
        return idRegistroSalida;
    }

    public void setIdRegistroSalida(int idRegistroSalida) {
        this.idRegistroSalida = idRegistroSalida;
    }

    public String getNombreEstacionamiento() {
        return NombreEstacionamiento;
    }

    public void setNombreEstacionamiento(String nombreEstacionamiento) {
        NombreEstacionamiento = nombreEstacionamiento;
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

    public String getLavado() {
        return lavado;
    }

    public void setLavado(String lavado) {
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
}
