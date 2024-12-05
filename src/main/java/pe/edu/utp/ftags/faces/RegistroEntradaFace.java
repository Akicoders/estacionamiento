package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.TipoVehiculo;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.time.LocalDateTime;

@ManagedBean
@SessionScoped
public class RegistroEntradaFace implements Serializable {

    private int idRegistroEntrada;
    private int idConductor;
    private int idVehiculo;
    private String nombreEstacionamiento;
    private String nombreConductor;
    private String dni;
    private String placa;
    private TipoVehiculo tipoVehiculo;
    private String lavado;
    private LocalDateTime FechaHoraEntrada;

    public RegistroEntradaFace() {
        this.idRegistroEntrada = 0;
        this.idConductor = 0;
        this.idVehiculo = 0;
        this.nombreEstacionamiento = "";
        this.nombreConductor = "";
        this.dni = "";
        this.placa = "";
        this.tipoVehiculo = null;
        this.lavado = "";
        this.FechaHoraEntrada = LocalDateTime.now();
    }

    public RegistroEntradaFace(int idRegistroEntrada, int idConductor, int idVehiculo, String nombreEstacionamiento, String nombreConductor, String dni, String placa, TipoVehiculo tipoVehiculo, String lavado, LocalDateTime FechaHoraEntrada) {
        this.idRegistroEntrada = idRegistroEntrada;
        this.idConductor = idConductor;
        this.idVehiculo = idVehiculo;
        this.nombreEstacionamiento = nombreEstacionamiento;
        this.nombreConductor = nombreConductor;
        this.dni = dni;
        this.placa = placa;
        this.tipoVehiculo = tipoVehiculo;
        this.lavado = lavado;
        this.FechaHoraEntrada = FechaHoraEntrada;
    }

    public int getIdRegistroEntrada() {
        return idRegistroEntrada;
    }

    public void setIdRegistroEntrada(int idRegistroEntrada) {
        this.idRegistroEntrada = idRegistroEntrada;
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

    public String getNombreEstacionamiento() {
        return nombreEstacionamiento;
    }

    public void setNombreEstacionamiento(String nombreEstacionamiento) {
        this.nombreEstacionamiento = nombreEstacionamiento;
    }

    public String getNombreConductor() {
        return nombreConductor;
    }

    public void setNombreConductor(String nombreConductor) {
        this.nombreConductor = nombreConductor;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
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
}
