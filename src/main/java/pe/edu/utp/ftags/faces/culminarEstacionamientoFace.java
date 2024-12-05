package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.RegistroEntrada;
import pe.edu.utp.ftags.model.Salida;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;

@ManagedBean
@ViewScoped
public class culminarEstacionamientoFace {

    private int idRegistro;
    private RegistroEntrada registroSeleccionado;

    public culminarEstacionamientoFace() throws IOException {
        String idParam = FacesContext.getCurrentInstance().getExternalContext()
                .getRequestParameterMap().get("txtId");

        if (idParam != null) {
            idRegistro = Integer.parseInt(idParam);
        }

        if (idRegistro != 0) {
            ReservaDAO reservaDAO = new ReservaDAO();
            this.registroSeleccionado = reservaDAO.getConductorporId(idRegistro);
        }
    }

    public void finalizarEstacionamiento() throws IOException {
        ReservaDAO reservaDAO = new ReservaDAO();
        String lavadito = registroSeleccionado.getLavado();

        boolean lavado = false;
        if (lavadito != null) {
            lavado = lavadito.equalsIgnoreCase("si");
        }

        Salida salida = new Salida();
        salida.setIdRegistroEntrada(registroSeleccionado.getIdRegistroEntrada());
        salida.setNombreConductor(registroSeleccionado.getNombreConductor());
        salida.setTipoVehiculo(registroSeleccionado.getTipoVehiculo());
        salida.setPlaca(registroSeleccionado.getPlaca());
        salida.setLavado(lavado);
        salida.setFechaHoraEntrada(registroSeleccionado.getFechaHoraEntrada());
        salida.setFechaHoraSalida(LocalDateTime.now());
        salida.setTotal(reservaDAO.getTotal(registroSeleccionado.getFechaHoraEntrada(), lavado));
        salida.setIdConductor(registroSeleccionado.getIdConductor());
        salida.setIdVehiculo(registroSeleccionado.getIdVehiculo());

        reservaDAO.newRegistroSalida(salida);
    }

    // Getters y setters
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

}
