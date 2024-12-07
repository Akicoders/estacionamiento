package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.RegistroEntrada;
import pe.edu.utp.ftags.model.Salida;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.Map;

@ManagedBean
@ViewScoped
public class culminarEstacionamientoFace {

    private int idRegistro;
    private RegistroEntrada registroSeleccionado;
    private String fechaHoraEntradaString;

    /*+
    public culminarEstacionamientoFace() throws IOException {
        String idParam = FacesContext.getCurrentInstance().getExternalContext()
                .getRequestParameterMap().get("txtId");

        if (idParam != null) {
            idRegistro = Integer.parseInt(idParam);
        }

        if (idRegistro != 0) {
            ReservaDAO reservaDAO = new ReservaDAO();
            this.registroSeleccionado = reservaDAO.getConductorporId(idRegistro);

            if (registroSeleccionado.getFechaHoraEntrada() != null) {
                this.fechaHoraEntradaString = registroSeleccionado.getFechaHoraEntrada().toString();
            }
        }
    }*/

    public void finalizarEstacionamiento(RegistroEntrada registroEntrada) throws IOException, IllegalArgumentException {
        ReservaDAO reservaDAO = new ReservaDAO();
        String lavadito = registroEntrada.getLavado();
        CarouselRegistroEntradaFace carouselRegistroEntradaFace = new CarouselRegistroEntradaFace();
        carouselRegistroEntradaFace.getRegistroEntradaList().remove(registroEntrada);

        LocalDateTime fechaHoraEntrada = LocalDateTime.parse(registroEntrada.getFechaHoraEntrada().toString());

        boolean lavado = false;
        if (lavadito != null) {
            lavado = lavadito.equalsIgnoreCase("si");
        }

        Salida salidaDriver = new Salida();
        salidaDriver.setIdRegistroEntrada(registroEntrada.getIdRegistroEntrada());
        salidaDriver.setNombreConductor(registroEntrada.getNombreConductor());
        salidaDriver.setTipoVehiculo(registroEntrada.getTipoVehiculo());
        salidaDriver.setPlaca(registroEntrada.getPlaca());
        salidaDriver.setLavado(lavado);
        salidaDriver.setFechaHoraEntrada(fechaHoraEntrada);
        salidaDriver.setFechaHoraSalida(LocalDateTime.now());
        salidaDriver.setTotal(reservaDAO.getTotal(fechaHoraEntrada, lavado));
        salidaDriver.setIdConductor(registroEntrada.getIdConductor());
        salidaDriver.setIdVehiculo(registroEntrada.getIdVehiculo());

        reservaDAO.newRegistroSalida(salidaDriver);

        reload();

    }

    public void reload() throws IOException {
        ExternalContext driver = FacesContext.getCurrentInstance().getExternalContext();
        driver.redirect(((HttpServletRequest) driver.getRequest()).getRequestURI());
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }

    public RegistroEntrada getRegistroSeleccionado() {
        return registroSeleccionado;
    }

    public void setRegistroSeleccionado(RegistroEntrada registroSeleccionado) {
        this.registroSeleccionado = registroSeleccionado;
    }

    public String getFechaHoraEntradaString() {
        return fechaHoraEntradaString;
    }

    public void setFechaHoraEntradaString(String fechaHoraEntradaString) {
        this.fechaHoraEntradaString = fechaHoraEntradaString;
    }

}
