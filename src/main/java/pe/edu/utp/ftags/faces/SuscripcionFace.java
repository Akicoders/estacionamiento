package pe.edu.utp.ftags.faces;


import pe.edu.utp.ftags.model.PlanSuscripcion;
import pe.edu.utp.ftags.model.Suscriptor;
import pe.edu.utp.ftags.services.Validator;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.HashMap;

@ManagedBean
@SessionScoped
public class SuscripcionFace {

    private Suscriptor suscripcionIngresada;
    private PlanSuscripcion[] planesSuscripcion;
    private HashMap<String, Suscripcion> suscripcionHashMap;
    private Suscripcion suscripcion;

    public SuscripcionFace() {
        suscripcionIngresada = new Suscriptor();
        suscripcionIngresada.setDetalle_suscripcion(new Suscripcion("", 0));
        planesSuscripcion = PlanSuscripcion.values();
        inicializarSuscripciones();
    }

    private void inicializarSuscripciones() {
        suscripcionHashMap = new HashMap<>();
        suscripcionHashMap.put("GOLD", new Suscripcion("gold", 50));
        suscripcionHashMap.put("DIAMOND", new Suscripcion("diamond", 250));
        suscripcionHashMap.put("RADIO", new Suscripcion("radio", 300));
    }

    public void registrarSuscripcion() throws IOException, IllegalArgumentException {

        try {
            suscripcion = suscripcionHashMap.get(suscripcionIngresada.getPlan().toUpperCase()).clone();
            suscripcionIngresada.setDetalle_suscripcion(suscripcion);

            Validator.validarSuscripcion(suscripcionIngresada.getDni(), suscripcionIngresada.getPlaca(), suscripcionIngresada.getTarjeta());

            Suscriptor suscriptor = new Suscriptor(suscripcionIngresada.getDni(),suscripcionIngresada.getPlaca(),suscripcionIngresada.getTarjeta(),suscripcion);
            SuscripcionDAO.newSuscripcion(suscriptor);

            FacesContext.getCurrentInstance().getExternalContext().redirect("resumenSuscripcion.xhtml?faces-redirect=true");
        } catch (IllegalArgumentException iae) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error de validación", iae.getMessage())
            );
        } catch (RuntimeException re) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error inesperado", "Ocurrió un error al guardar la reserva. Intente nuevamente.")
            );
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "Se produjo un error inesperado.")
            );
        }
    }

    public void invalidarSesion() throws IOException {

        FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();

        FacesContext.getCurrentInstance().getExternalContext().redirect("suscripcion.xhtml?faces-redirect=true");
    }

    public Suscriptor getSuscripcionIngresada() {
        return suscripcionIngresada;
    }

    public void setSuscripcionIngresada(Suscriptor suscripcionIngresada) {
        this.suscripcionIngresada = suscripcionIngresada;
    }

    public PlanSuscripcion[] getPlanesSuscripcion() {
        return planesSuscripcion;
    }

    public void setPlanesSuscripcion(PlanSuscripcion[] planesSuscripcion) {
        this.planesSuscripcion = planesSuscripcion;
    }

    public HashMap<String, Suscripcion> getSuscripcionHashMap() {
        return suscripcionHashMap;
    }

    public void setSuscripcionHashMap(HashMap<String, Suscripcion> suscripcionHashMap) {
        this.suscripcionHashMap = suscripcionHashMap;
    }

    public Suscripcion getSuscripcion() {
        return suscripcion;
    }

    public void setSuscripcion(Suscripcion suscripcion) {
        this.suscripcion = suscripcion;
    }

}
