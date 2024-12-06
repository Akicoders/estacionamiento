package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.RegistroEntrada;
import pe.edu.utp.ftags.model.Salida;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
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
    }

    public void finalizarEstacionamiento() throws IOException, IllegalArgumentException {
        ReservaDAO reservaDAO = new ReservaDAO();
        String lavadito = registroSeleccionado.getLavado();

        LocalDateTime fechaHoraEntrada = LocalDateTime.parse(fechaHoraEntradaString);

        boolean lavado = false;
        if (lavadito != null) {
            lavado = lavadito.equalsIgnoreCase("si");
        }

        Salida salidaDriver = new Salida();
        salidaDriver.setIdRegistroEntrada(registroSeleccionado.getIdRegistroEntrada());
        salidaDriver.setNombreConductor(registroSeleccionado.getNombreConductor());
        salidaDriver.setTipoVehiculo(registroSeleccionado.getTipoVehiculo());
        salidaDriver.setPlaca(registroSeleccionado.getPlaca());
        salidaDriver.setLavado(lavado);
        salidaDriver.setFechaHoraEntrada(fechaHoraEntrada);
        salidaDriver.setFechaHoraSalida(LocalDateTime.now());
        salidaDriver.setTotal(reservaDAO.getTotal(fechaHoraEntrada, lavado));
        salidaDriver.setIdConductor(registroSeleccionado.getIdConductor());
        salidaDriver.setIdVehiculo(registroSeleccionado.getIdVehiculo());

        reservaDAO.newRegistroSalida(salidaDriver);

        FacesContext.getCurrentInstance().getExternalContext().redirect("src/main/webapp/drivers.xhtml");
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
