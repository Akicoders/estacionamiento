package pe.edu.utp.ftags.model;

import pe.edu.utp.ftags.faces.Suscripcion;

public interface SuscripcionPrototype extends Cloneable {
    Suscripcion clone() throws CloneNotSupportedException;
}
