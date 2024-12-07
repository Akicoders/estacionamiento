package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.RegistroEntrada;
import pe.edu.utp.ftags.model.Reserva;
import pe.edu.utp.ftags.model.TipoVehiculo;
import pe.edu.utp.ftags.services.Validator;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import java.io.Externalizable;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

@ManagedBean
@SessionScoped
public class RegistroFace {

    private Reserva registroIngresado;
    private TipoVehiculo[] tiposVehiculo;

    public RegistroFace() {
        registroIngresado = new Reserva();
        tiposVehiculo = TipoVehiculo.values();
    }

    public void registrarEstacionamiento() throws IOException, IllegalArgumentException {

        Reserva reserva;
        try {

            String lavado = registroIngresado.isLavado() ? "lavado" : "nolavado";
            //Validator.validarConductor(registroIngresado.getNombreConductor(), dni, registroIngresado.getPlaca(), registroIngresado.getTipoVehiculo(), entrada);

            boolean reserva_regular = lavado.equalsIgnoreCase("nolavado");
            boolean reserva_completo = lavado.equalsIgnoreCase("lavado");

            if (reserva_regular) {
                System.out.println(">>>>>>>>>>>>>>>>> Reserva regular");
                reserva = crearReservaRegular(registroIngresado.getNombreConductor(), String.valueOf(registroIngresado.getDni()), registroIngresado.getPlaca(), registroIngresado.getTipoVehiculo(), registroIngresado.getFechaHoraEntrada());
            } else {
                System.out.printf(">>>>>>>>>>>>>>>>> Pedido Total (lavado:%s)%n", lavado);
                reserva = crearReservaConLavado(registroIngresado.getNombreConductor(), String.valueOf(registroIngresado.getDni()), registroIngresado.getPlaca(), registroIngresado.getTipoVehiculo(), registroIngresado.getFechaHoraEntrada(), lavado);
            }

            ReservaDAO.newConductor(reserva);

            FacesContext.getCurrentInstance().getExternalContext().redirect("resumen.xhtml?faces-redirect=true");

        } catch (Exception e) {
            FacesContext.getCurrentInstance().getExternalContext().redirect("error.xhtml?error=error_interno");
        }

    }

    public Reserva crearReservaRegular(String nombre, String dni, String placa, TipoVehiculo tipoVehiculo, LocalDateTime entrada){
        int DNI = Integer.parseInt(dni);
        return new Reserva.Builder(nombre, DNI, tipoVehiculo, placa, entrada).build();
    }

    public Reserva crearReservaConLavado(String nombre, String dni, String placa, TipoVehiculo tipoVehiculo, LocalDateTime entrada, String lavado){
        int DNI = Integer.parseInt(dni);
        return new Reserva.Builder(nombre, DNI, tipoVehiculo, placa, entrada).withLavado().build();
    }

    public void invalidarSesion() throws IOException {

        FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();

        FacesContext.getCurrentInstance().getExternalContext().redirect("form.xhtml?faces-redirect=true");
    }

    public TipoVehiculo[] getTiposVehiculo() {
        return tiposVehiculo;
    }

    public Reserva getRegistroIngresado() {
        return registroIngresado;
    }

    public void setRegistroIngresado(Reserva registroIngresado) {
        this.registroIngresado = registroIngresado;
    }
}
