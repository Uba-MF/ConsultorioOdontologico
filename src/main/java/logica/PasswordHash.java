
package logica;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordHash {
    
    // Encripta la contraseña usando Salt generado automáticamente
    public static String encript(String passwordPlano) {
        return BCrypt.hashpw(passwordPlano, BCrypt.gensalt(12));
    }
    
    // Verifica si la contraseña coincide con el Hash de la base de datos
    public static boolean verification(String passwordPlano, String hashAlmacenado) {
            try {
                   return BCrypt.checkpw(passwordPlano, hashAlmacenado);
            } catch (IllegalArgumentException e) {
                return false;
        }
    }
    
}
