
package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Odontologo;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    
        HorarioJpaController horarioJPA = new HorarioJpaController();
        OdontologoJpaController odontoJPA = new OdontologoJpaController();
        PacienteJpaController pacienteJPA = new PacienteJpaController();
        PersonaJpaController personaJPA = new PersonaJpaController();
        ResponsableJpaController responsableJPA = new ResponsableJpaController();
        SecretariaJpaController secretariaJPA = new SecretariaJpaController();
        TurnoJpaController turnoJPA = new TurnoJpaController();
        UsuarioJpaController usuarioJPA = new UsuarioJpaController();

    public void crearUsuario(Usuario usu) {
           usuarioJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
            return usuarioJPA.findUsuarioEntities();
    }

    public void borrarUsuario(int id) {
            try {
                usuarioJPA.destroy(id);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    public Usuario traerUsuario(int id) {
        return usuarioJPA.findUsuario(id);
  }

    public void editarUsuario(Usuario usu) {
            try {
                usuarioJPA.edit(usu);
            } catch (Exception ex) {
                Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
            }
  }

    public void crearOdonto(Usuario usuOdon,Odontologo odonto) {
         // Crear Usuario y Contraseña del Odontólogo en la BD
        usuarioJPA.create(usuOdon);
        // Crear Odontólogo en la BD
        odontoJPA.create(odonto);

}

    public List<Odontologo> getOdontologo() {
         return odontoJPA.findOdontologoEntities();
    }

    public void borrarOdonto(int id) {
            try {
                odontoJPA.destroy(id);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
            }
         
    }

    public Odontologo traerOdontologos(int id) {
            return odontoJPA.findOdontologo(id);
    }

    public void editOdonto(Odontologo odonto) {
            try {
                odontoJPA.edit(odonto);
            } catch (Exception ex) {
                Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
            }
    }


    
}
