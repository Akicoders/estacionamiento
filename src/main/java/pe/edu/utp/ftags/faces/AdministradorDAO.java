package pe.edu.utp.ftags.faces;

import org.apache.commons.codec.digest.DigestUtils;
import pe.edu.utp.ftags.services.AppConfig;
import pe.edu.utp.ftags.util.DataAccessMariaDB;
import pe.edu.utp.ftags.util.UTPBinary;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.naming.NamingException;
import java.io.IOException;
import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Logger;

@ManagedBean
@SessionScoped
public class AdministradorDAO implements Serializable {
    private static final Logger log = Logger.getLogger("pe.edu.utp.estacionamiento");

        public static Boolean validarAdministrador(String cuenta, String clave) throws IOException {
            Boolean validado = false; // Valor por defecto

            // Generar el hash MD5 de la clave
            String claveMD5 = DigestUtils.md5Hex(clave);

            String procedimiento = "{CALL pr_VerificarCredencialesAdministrador(?, ?, ?)}";

            try (Connection cnn = DataAccessMariaDB.getConnection(DataAccessMariaDB.TipoDA.DATASOURCE, AppConfig.getDatasource());
                 CallableStatement stmt = cnn.prepareCall(procedimiento)) {

                // Establecer los parámetros de entrada
                stmt.setString(1, cuenta);
                stmt.setString(2, claveMD5);

                // Registrar el parámetro de salida
                stmt.registerOutParameter(3, Types.BOOLEAN);

                // Ejecutar el procedimiento almacenado
                stmt.execute();

                // Obtener el valor del parámetro de salida
                validado = stmt.getBoolean(3);

            } catch (SQLException e) {
                String msg = String.format("Ocurrió una excepción en pr_VerificarCredencialesAdministrador: %s", e.getMessage());
                log.warning(msg);
                throw new IOException(msg, e);
            } catch (NamingException e) {
                throw new RuntimeException(e);
            }

            return validado;
        }

}
