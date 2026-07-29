    
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
import logica.PasswordHash;
import logica.Usuario;


@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        
         listaUsuarios = control.getUsuarios(); 
         
         HttpSession misession = request.getSession();
         misession.setAttribute("listaUsuarios", listaUsuarios);
         
          response.sendRedirect("seeUser.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
            
        // Se almacena en variables los datos que llegan del formulario
         String nombreUsuario = request.getParameter("nombreUsuario");
         String contrasena = request.getParameter("contrasena");
         String contrasena2 = request.getParameter("contrasena2");
         String rol = request.getParameter("rol");
         
        if (contrasena.equals(contrasena2)) {
            // Encriptar contraseña
            String encryptedPass = PasswordHash.encript(contrasena);
            
            try {
                 control.crearUsuario(nombreUsuario, encryptedPass, rol);
                 session.setAttribute("mensaje", " -----> Usuario guardado correctamente");
                 session.setAttribute("tipoMensaje", "success");
            }
            
            catch (Exception e) {
                 session.setAttribute("mensaje", "Error al guardar el usuario en la base de datos: " +e.getMessage());
                 session.setAttribute("tipoMensaje", "danger");
            }
        }
         
        else {
                session.setAttribute("mensajeError", " -----> ¡Las contraseñas no coinciden! ");
                session.setAttribute("tipoMensaje2", "danger");
        }
        
          // Redirige (GET) en vez de forward para evitar reenvío de formulario
            response.sendRedirect(request.getContextPath() + "/newUser.jsp");
     
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
