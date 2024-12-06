package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.TipoVehiculo;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.time.LocalDateTime;

@ManagedBean
@SessionScoped
public class Reserva implements Serializable {
   private String nombreConductor;
   private int dni;
   private TipoVehiculo tipoVehiculo;
   private String placa;
   private static LocalDateTime fechaHoraEntrada;
   private static boolean lavado;

   public static class Builder {
       private String nombreConductor;
       private int dni;
       private TipoVehiculo tipoVehiculo;
       private String placa;
       private LocalDateTime fechaHoraEntrada;
       private boolean lavado;

       public Builder(String nombreConductor, int dni, TipoVehiculo tipoVehiculo, String placa, LocalDateTime fechaHoraEntrada) {
           this.nombreConductor = nombreConductor;
           this.dni = dni;
           this.tipoVehiculo = tipoVehiculo;
           this.placa = placa;
           this.fechaHoraEntrada = fechaHoraEntrada;
           this.lavado = false;
       }

       public Builder withLavado() {
           this.lavado = true;
           return this;
       }

       public Reserva build() {
           return new Reserva(this);
       }

   }

    public Reserva(Builder builder) {
         this.nombreConductor = builder.nombreConductor;
         this.dni = builder.dni;
         this.tipoVehiculo = builder.tipoVehiculo;
         this.placa = builder.placa;
         this.fechaHoraEntrada = builder.fechaHoraEntrada;
         this.lavado = builder.lavado;
    }

    public String getNombreConductor() {
        return nombreConductor;
    }

    public void setNombreConductor(String nombreConductor) {
        this.nombreConductor = nombreConductor;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public TipoVehiculo getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(TipoVehiculo tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public LocalDateTime getFechaHoraEntrada() {
        return fechaHoraEntrada;
    }

    public void setFechaHoraEntrada(LocalDateTime fechaHoraEntrada) {
        this.fechaHoraEntrada = fechaHoraEntrada;
    }

    public boolean isLavado() {
        return lavado;
    }

    public void setLavado(boolean lavado) {
        this.lavado = lavado;
    }


}
