package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.SuscripcionPrototype;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class Suscripcion implements SuscripcionPrototype {
    private String nombre;
    private float precio;

    public Suscripcion() {
        this.nombre = "";
        this.precio = 0;
    }

    public Suscripcion(String nombre, int precio) {
        this.nombre = nombre;
        this.precio = precio;
    }

    @Override
    public Suscripcion clone() throws CloneNotSupportedException {
        try {
            return (Suscripcion) super.clone();
        }catch (CloneNotSupportedException e) {
            throw new CloneNotSupportedException();
        }
    }
    public String getNombre() {
        return nombre;
    }

    public float getPrecio() {
        return precio;
    }


    @Override
    public String toString() {
        return "Suscripcion{" +
                "nombre='" + nombre + '\'' +
                ", precio=" + precio +
                '}';
    }
}
