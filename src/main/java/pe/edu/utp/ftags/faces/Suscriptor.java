package pe.edu.utp.ftags.faces;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;

@ManagedBean
@SessionScoped
public class Suscriptor implements Serializable {

    public String dni;
    public String placa;
    public String tarjeta;
    public Suscripcion detalle_suscripcion;
    public String codigo_sorteo;
    public String plan;


    public Suscriptor(String plan, String tarjeta, String placa, String dni) {
        this.plan = plan;
        this.tarjeta = tarjeta;
        this.placa = placa;
        this.dni = dni;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public Suscriptor(String dni, String placa, String tarjeta, Suscripcion detalle_suscripcion) {
        this.dni = dni;
        this.placa = placa;
        this.tarjeta = tarjeta;
        this.detalle_suscripcion = detalle_suscripcion;

    }

    public Suscriptor(String dni, String placa, Suscripcion detalle_suscripcion, String codigo_sorteo) {
        this.dni = dni;
        this.placa = placa;
        this.detalle_suscripcion = detalle_suscripcion;
        this.codigo_sorteo = codigo_sorteo;
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

    public String getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }

    public Suscripcion getDetalle_suscripcion() {
        return detalle_suscripcion;
    }

    public void setDetalle_suscripcion(Suscripcion detalle_suscripcion) {
        this.detalle_suscripcion = detalle_suscripcion;
    }

    public String getCodigo_sorteo() {
        return codigo_sorteo;
    }

    public void setCodigo_sorteo(String codigo_sorteo) {
        this.codigo_sorteo = codigo_sorteo;
    }


}
