package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.RegistroEntrada;
import pe.edu.utp.ftags.model.RegistroSalida;
import pe.edu.utp.ftags.model.Salida;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@ManagedBean
@SessionScoped
public class CarouselRegistroEntradaFace {
    private List<RegistroEntrada> registroEntradaList;


    public CarouselRegistroEntradaFace() throws IOException  {
        ReservaDAO reservaDAO = new ReservaDAO();
        this.registroEntradaList = reservaDAO.getRegistroEntrada();
    }

    public void init() throws IOException {
    }

    public void cambiarARegistroSalida(RegistroEntrada registroEntrada) throws IOException {
        ReservaDAO reservaDAO = new ReservaDAO();
        LocalDateTime localDateTime = LocalDateTime.now();
        RegistroSalida registroSalida = new RegistroSalida();

        reservaDAO.newRegistroSalida(new Salida(1, registroEntrada.getNombreConductor(),registroEntrada.getTipoVehiculo(),registroEntrada.getPlaca(),registroEntrada.getLavado(),registroEntrada.getFechaHoraEntrada(),localDateTime.toString(),reservaDAO.getTotal(registroSalida.getFechaHoraEntrada(), Boolean.valueOf(registroEntrada.getLavado()))  ));
    }


    public List<RegistroEntrada> getRegistroEntradaList() {
        return registroEntradaList;
    }

    public void setRegistroEntradaList(List<RegistroEntrada> registroEntradaList) {
        this.registroEntradaList = registroEntradaList;
    }


}
