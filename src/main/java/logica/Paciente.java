
package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

    @Entity
    public class Paciente extends Persona implements Serializable {
            
            
            private boolean tiene_EPS;
            private String tipoSangre;
            @OneToOne
            private Responsable unResponsable; // Relación UNO a UNO con la tabla Resonsable mediante un objeto.
            @OneToMany(mappedBy="pacien")
            private List<Turno> listaTurnos; // Relación UNO a MUCHOS con Turnos mediante una collections.
            
            public Paciente(){
            }

    public Paciente(boolean tiene_EPS, String tipoSangre, Responsable unResponsable, List<Turno> listaTurnos, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.tiene_EPS = tiene_EPS;
        this.tipoSangre = tipoSangre;
        this.unResponsable = unResponsable;
        this.listaTurnos = listaTurnos;
    }

  



    public boolean isTiene_EPS() {
        return tiene_EPS;
    }

    public void setTiene_EPS(boolean tiene_EPS) {
        this.tiene_EPS = tiene_EPS;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public Responsable getUnResponsable() {
        return unResponsable;
    }

    public void setUnResponsable(Responsable unResponsable) {
        this.unResponsable = unResponsable;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }
    
  
    }
