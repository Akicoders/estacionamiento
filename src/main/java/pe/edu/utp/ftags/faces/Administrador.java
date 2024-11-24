package pe.edu.utp.ftags.faces;


import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDateTime;

@ManagedBean
@SessionScoped
public class Administrador implements Serializable {
    private String nombre;
    private LocalDateTime fechaContrato;
    private String dni;
    private String clave;
    private String cuenta;
    private Estacionamiento estacionamiento;
    public Administrador() {
        resetValues();
    }

    public void resetValues(){
        this.nombre ="";
        this.fechaContrato = LocalDateTime.now();
        this.dni = "";
        this.clave = "";
        this.cuenta = "";
        this.estacionamiento = null;
    }

    public Administrador(String nombre, LocalDateTime fechaContrato, String dni, String clave, String cuenta, Estacionamiento estacionamiento) {
        this.nombre = nombre;
        this.fechaContrato = fechaContrato;
        this.dni = dni;
        this.clave = clave;
        this.cuenta = cuenta;
        this.estacionamiento = estacionamiento;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public LocalDateTime getFechaContrato() {
        return fechaContrato;
    }
    public void setFechaContrato(LocalDateTime fechaContrato) {
        this.fechaContrato = fechaContrato;
    }
    public String getDni() {
        return dni;
    }
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getClave() {
        return clave;
    }
    public void setClave(String clave) {
        this.clave = clave;
    }
    public String getCuenta() {
        return cuenta;
    }
    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }
    public Estacionamiento getEstacionamiento() {
        return estacionamiento;
    }
    public void setEstacionamiento(Estacionamiento estacionamiento) {
        this.estacionamiento = estacionamiento;
    }

    public String isValidAdmin() throws IOException {
        boolean valid_admin = AdministradorDAO.validarAdministrador(cuenta, clave);
        if (valid_admin) {
            return "form?faces-redirect=true";
        }else{
            return "index?faces-redirect=true";
        }
    }

    public String logout(){
        resetValues();
        return "index?faces-redirect=true";
    }
}
