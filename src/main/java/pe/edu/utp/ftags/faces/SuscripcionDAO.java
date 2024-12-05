package pe.edu.utp.ftags.faces;


import pe.edu.utp.ftags.services.AppConfig;
import pe.edu.utp.ftags.util.DataAccessMariaDB;
import pe.edu.utp.ftags.model.Suscriptor;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.naming.NamingException;
import java.io.IOException;
import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

@ManagedBean
@SessionScoped
public class SuscripcionDAO implements Serializable {
    private final Connection cnn;
    private static final Logger log = Logger.getLogger("pe.edu.utp.estacionamiento");

    private static HashMap<String, Suscripcion> suscripciones;

    static  {
        suscripciones = new HashMap<>();
        suscripciones.put("GOLD", new Suscripcion("gold",50));
        suscripciones.put("DIAMOND", new Suscripcion("diamond",250));
        suscripciones.put("RADIO",new Suscripcion("radio",300));
    }

    public SuscripcionDAO() throws SQLException, NamingException, NoSuchAlgorithmException {
        this.cnn = DataAccessMariaDB.getConnection(DataAccessMariaDB.TipoDA.DATASOURCE, "java:/MariaDB" );
    }

    public void close() throws SQLException, NamingException {
        if (this.cnn != null) DataAccessMariaDB.closeConnection(this.cnn);
    }

    //conseguir las suscripciones :D
    public List<Suscriptor> getSuscripciones() throws IOException {
        List<Suscriptor> lista_suscriptor = new ArrayList<>();
        String strSQL = String.format("CALL mostrar_suscripciones()");
        log.info(strSQL);
        try{
            Connection cnn = DataAccessMariaDB.getConnection(DataAccessMariaDB.TipoDA.DATASOURCE, AppConfig.getDatasource());
            ResultSet rs = cnn.createStatement().executeQuery(strSQL);
            while (rs.next()) {
                String dni = rs.getString("suscripciones.dni");
                String placa = rs.getString("suscripciones.placa");
                String plan = rs.getString("suscripciones.plan");
                String codigo_sorteo = rs.getString("suscripciones.codigo_sorteo");

                Suscripcion suscripcion = suscripciones.get(plan.toUpperCase()).clone();
                Suscriptor suscriptor = new Suscriptor(dni,placa,suscripcion,codigo_sorteo);
                lista_suscriptor.add(suscriptor);
            }
            cnn.close();
        }catch (Exception e){
            String msg = String.format("Ocurrio una exepcion en Mostrar_suscripciones: %s", e.getMessage());
            log.warning(msg);
            throw new IOException(msg);
        }
        return lista_suscriptor;
    }
    public static void newSuscripcion(Suscriptor suscriptor) throws IOException {
        String strSQL = String.format("CALL registrar_suscripcion('%s','%s','%s','%s')",
                suscriptor.getDni(),
                suscriptor.getPlaca(),
                MD5(suscriptor.getTarjeta()),
                suscriptor.getDetalle_suscripcion().getNombre());
        log.info(strSQL);
        try{
            Connection cnn = DataAccessMariaDB.getConnection(DataAccessMariaDB.TipoDA.DATASOURCE, AppConfig.getDatasource());
            cnn.createStatement().execute(strSQL);
            cnn.close();
        } catch (Exception e){
            String msg = String.format("Ocurrio una excepcion en registrar_suscripcion(%s): %s", suscriptor.getDni(),
                    e.getMessage());
            log.warning(msg);
            throw new IllegalStateException(msg);
        }
    }

    public static String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }


}
