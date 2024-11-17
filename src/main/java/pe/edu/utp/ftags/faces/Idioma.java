package pe.edu.utp.ftags.faces;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;

@ManagedBean
@SessionScoped
public class Idioma  implements Serializable {
    private String idioma;
    public  Idioma() {idioma = "es"; }
    public Idioma(String idioma) {
        this.idioma = idioma;
    }
    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }
}
