package pe.edu.utp.ftags.faces;
import pe.edu.utp.ftags.model.RegistroSalida;
import pe.edu.utp.ftags.model.Suscriptor;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.naming.NamingException;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

@ManagedBean
@SessionScoped
public class CarouselSuscriptorFace {

    private List<Suscriptor> suscriptorList;

    public CarouselSuscriptorFace() throws SQLException, NamingException, NoSuchAlgorithmException, IOException {
        SuscripcionDAO suscripcionDAO= new SuscripcionDAO();
        this.suscriptorList = suscripcionDAO.getSuscripciones();
    }

    public List<Suscriptor> getSuscriptorList() {
        return suscriptorList;
    }

    public void setSuscriptorList(List<Suscriptor> suscriptorList) {
        this.suscriptorList = suscriptorList;
    }

}
