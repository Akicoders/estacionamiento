package pe.edu.utp.ftags.model;

import pe.edu.utp.ftags.faces.Suscripcion;

public interface SuscripcionPrototype extends Cloneable {
    public Suscripcion clone() throws CloneNotSupportedException;
}
