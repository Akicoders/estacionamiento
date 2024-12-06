package pe.edu.utp.ftags.faces;

import pe.edu.utp.ftags.model.RegistroEntrada;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.IOException;
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

    public List<RegistroEntrada> getRegistroEntradaList() {
        return registroEntradaList;
    }

    public void setRegistroEntradaList(List<RegistroEntrada> registroEntradaList) {
        this.registroEntradaList = registroEntradaList;
    }
}
