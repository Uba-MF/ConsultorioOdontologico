
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
import logica.Odontologo;
import logica.PasswordHash;


@WebServlet(name = "SvOdonto", urlPatterns = {"/SvOdonto"})
public class SvOdonto extends HttpServlet {
    
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Crea una lista con los odontolgos creados
         List<Odontologo> listaOdonto = new ArrayList<Odontologo>();
         
         listaOdonto = control.getOdontologos();
         
         HttpSession misession = request.getSession();
         misession.setAttribute("listaOdonto", listaOdonto);
         
         response.sendRedirect("seeDoctor.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpSession session = request.getSession();
        // Se almacena en variables los datos que llegan del formulario
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNac =  request.getParameter("fechanac");
        String especialidad = request.getParameter("especialidad");
        //---------------------------------------------------------------------------------//
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("contrasena");
        String pass2 = request.getParameter("contrasena2");
        
        
        
        if (pass.equals(pass2)) {
            
               String encryptedPass = PasswordHash.encript(pass);
               
               try {
                   // Los datos pasan a la lógica
                   control.crearOdonto(dni,nombre,apellido,telefono,direccion,fechaNac,especialidad,usuario,encryptedPass);
                   session.setAttribute("mensaje", " -----> Datos guardados correctamente ");
                   session.setAttribute("tipoMensaje", "success");
               }
               
               catch (Exception e) {
                   session.setAttribute("mensajeError", " Ocurrió un error al intentar guardar en la base de datos:<br/>El número de documento o teléfono ya existe en la Base de datos.");
                   session.setAttribute("tipoMensaje2", "danger");
               }
               
        }
        else {
                // Ventana emergente de error para contraseñas incorrectas
                session.setAttribute("mensajeError", " -----> ¡Las contraseñas no coinciden! ");
                session.setAttribute("tipoMensaje2", "danger");
                
        }
        
        // Redirige (GET) en vez de forward para evitar reenvío de formulario
            response.sendRedirect(request.getContextPath() + "/newDoctor.jsp");
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
