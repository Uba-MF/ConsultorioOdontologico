
package logica;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
        public void crearUsuario (String nombreUsuario, String encryptedPass, String rol) {
            
                Usuario usu = new Usuario ();
                usu.setNombreUsuario(nombreUsuario);
                usu.setContrasena(encryptedPass);
                usu.setRol(rol);
                
                controlPersis.crearUsuario(usu);
                
        }

    public List<Usuario> getUsuarios() {
        
        return controlPersis.getUsuarios();
        
    }  

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
  }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
  }
    

    public boolean comprobarIngreso(String usuario, String contrasena) {
        
        boolean ingreso = false;
        
        // Crea una lista de tipo usuario para luego recorrerla con un for
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlPersis.getUsuarios();  // Trae todos los usuarios existentes y los agrega a la list
        
        // Recorre usuario por usuario y lo compara con el usuario que recibe del login
        for (Usuario usu : listaUsuarios) {
            if(usu.getNombreUsuario().equals(usuario)) {
                //if(usu.getContrasena().equals(contrasena)) {
                if(PasswordHash.verification(contrasena, usu.getContrasena())) {
                     ingreso = true;
                }
                else {
                    ingreso = false; // De no encontrar el usuario el resultado lógico es false, así que este else no es necesario, pero se agrega por doble control.
                }
            }
        }
        return ingreso;
  }

    public void crearOdonto(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNac, String especialidad, String usuario, String pass) {
        
        Usuario usuOdon = new Usuario();
        usuOdon.setNombreUsuario(usuario);
        usuOdon.setContrasena(pass);

        Odontologo odonto = new Odontologo();
        
        // Recibe la fecha como string del servlet y lo convierte a Date
        LocalDate localDate = LocalDate.parse(fechaNac);
        Date fecha = java.sql.Date.valueOf(localDate);
        
        odonto.setDni(dni);
        odonto.setNombre(nombre);
        odonto.setApellido(apellido);
        odonto.setTelefono(telefono);
        odonto.setDireccion(direccion);
        odonto.setFecha_nac(fecha);
        odonto.setEspecialidad(especialidad);
        odonto.setUnUsuario(usuOdon);
        
        controlPersis.crearOdonto(usuOdon, odonto);
        
    }

    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologo();
    }

    public void borrarOdonto(int id) {
        controlPersis.borrarOdonto(id);
    }

    public Odontologo traerOdontologos(int id) {
       return controlPersis.traerOdontologos(id);
    }

    public void editOdonto(Odontologo odonto) {
        controlPersis.editOdonto(odonto);
    }

    public void crearPatient(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNac, String eps, String tipo_sangre, String documento, String nombreCompleto, String celular, String tipo_relacion) {
        
            Responsable responsable = new Responsable();
            
            responsable.setDni(documento);
            responsable.setNombre(nombreCompleto);
            responsable.setTelefono(celular);
            responsable.setTipo_respon(tipo_relacion);
        
            Paciente patient = new Paciente();
            
            LocalDate localDate = LocalDate.parse(fechaNac);
            Date fecha = java.sql.Date.valueOf(localDate);
            
            patient.setDni(dni);
            patient.setNombre(nombre);
            patient.setApellido(apellido);
            patient.setTelefono(telefono);
            patient.setDireccion(direccion);
            patient.setFecha_nac(fecha);
            patient.setTiene_EPS(eps);
            patient.setTipoSangre(tipo_sangre);
            patient.setUnResponsable(responsable);
            
            controlPersis.crearPatient(responsable,patient);
        
    }

    public List<Paciente> getPacientes() {
         return  controlPersis.getPacientes();
    }

    public List<Responsable> getResponsables() {
          return controlPersis.getResponsables();
    }

    public void crearPatient(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNac, String eps, String tipo_sangre) {
            
        Paciente patient = new Paciente();
        
         LocalDate date =  LocalDate.parse(fechaNac);
         Date fecha = java.sql.Date.valueOf(date);
        
        patient.setDni(dni);
        patient.setNombre(nombre);
        patient.setApellido(apellido);
        patient.setTelefono(telefono);
        patient.setDireccion(direccion);
        patient.setFecha_nac(fecha);
        patient.setTiene_EPS(eps);
        patient.setTipoSangre(tipo_sangre);
        
        controlPersis.crearPatient(patient);
        
    }

    public void borrarPaciente(int id) {
         controlPersis.borrarPaciente(id);
    }

    public Paciente traerPacientes(int id) {
            return controlPersis.traerPacientes(id);
    }

}
