
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.PasswordHash;
import logica.Usuario;

@WebServlet(name = "SvEditUser", urlPatterns = {"/SvEditUser"})
public class SvEditUser extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario usu = control.traerUsuario(id);
            
            HttpSession misession = request.getSession();
            misession.setAttribute("usuEditar", usu);
            
            response.sendRedirect("editUser.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        // Se almacena en nuevas variables los cambios que se realicen en el formulario
        String nombreUser = request.getParameter("nombreUsuario");
        String password = request.getParameter("contrasena");
        String password2 = request.getParameter("contrasena2");
        String rol = request.getParameter("rol");
        

        if (password.equals(password2)) {
            // Encriptar contraseña
            String encryptedPass = PasswordHash.encript(password2);

            Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar");
            usu.setNombreUsuario(nombreUser);
            usu.setContrasena(encryptedPass);
            usu.setRol(rol);
            
            try {
                control.editarUsuario(usu);
                session.setAttribute("mensaje", " -----> Cambios guardados correctamente");
                session.setAttribute("tipoMensaje", "success");
            } catch (Exception e) {
                session.setAttribute("mensaje", " Error al guardar los cambios - " + e.getMessage());
                session.setAttribute("tipoMensaje", "danger");
            }

            response.sendRedirect("SvUsuarios");
            
        } 
        
        else {
                session.setAttribute("mensajeError", " -----> ¡Las contraseñas no coinciden! ");
                session.setAttribute("tipoMensaje2", "danger");
                
                // Redirige (GET) en vez de forward para evitar reenvío de formulario
                response.sendRedirect(request.getContextPath() + "/editUser.jsp");  
        }
        
         
     
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
