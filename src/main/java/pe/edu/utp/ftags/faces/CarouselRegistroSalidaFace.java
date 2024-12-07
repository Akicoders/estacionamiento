package pe.edu.utp.ftags.faces;
import pe.edu.utp.ftags.model.RegistroSalida;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import java.io.IOException;
import java.util.List;

@ManagedBean
@ViewScoped
public class CarouselRegistroSalidaFace {

    private List<RegistroSalida> registroSalidaList;

    public CarouselRegistroSalidaFace() throws IOException  {
        ReservaDAO reservaDAO = new ReservaDAO();
        this.registroSalidaList = reservaDAO.getRegistroSalida();
    }

    public void init() throws IOException {

    }

    public List<RegistroSalida> getRegistroSalidaList() {
        return registroSalidaList;
    }

    public void setRegistroSalidaList(List<RegistroSalida> registroSalidaList) {
        this.registroSalidaList = registroSalidaList;
    }

}
