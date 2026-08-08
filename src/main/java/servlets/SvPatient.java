
package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;


@WebServlet(name = "SvPatient", urlPatterns = {"/SvPatient"})
public class SvPatient extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        // Crea una lista con los pacientes registrados
         List<Paciente> listaPacientes = new ArrayList<Paciente>();
         
         // Consulta a la controladora para que devuelva una lista de pacientes
         listaPacientes = control.getPacientes();
         
         // Se valida que la sea la misma sesión 
         HttpSession session = request.getSession();
         session.setAttribute("listaPacientes", listaPacientes);
         
         // Los datos se muestran en una tabla 
         response.sendRedirect("seePatient.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         HttpSession session = request.getSession();
         
         String dni = request.getParameter("dni");
         String nombre = request.getParameter("nombre");
         String apellido = request.getParameter("apellido");
         String telefono = request.getParameter("telefono");
         String direccion = request.getParameter("direccion");
         String fechaNac = request.getParameter("fechanac");
         String eps = request.getParameter("options_Eps");
         String tipo_sangre = request.getParameter("options_Blood");
         
         try {
                control.crearPatient(dni,nombre,apellido,telefono,direccion,fechaNac,eps,tipo_sangre);
                session.setAttribute("mensaje", " -----> Datos guardados correctamente");
                session.setAttribute("tipoMensaje", "success");
         } catch (Exception e ) {
                session.setAttribute("mensajeError", "Ocurrió un error al guardar el paciente en la base de datos.<br/>"+e.getMessage());
                session.setAttribute("tipoMensaje2", "danger");
         }
         
         // Redirige (GET) en vez de forward para evitar reenvío de formulario
         response.sendRedirect(request.getContextPath() + "/newPatient.jsp");
         
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
