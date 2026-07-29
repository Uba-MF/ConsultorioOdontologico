
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;



@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
          HttpSession missesion = request.getSession() ;
          // Almacena los datos temporalmente que llegan del login
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("password");

            boolean validacion = false;
            // Método que realiza la comparación de los datos que recibe con los de la BD
            validacion = control.comprobarIngreso(usuario, contrasena); 
            
            if (validacion == true) {
                // Crea la sesión en caso de que la validación sea true
                missesion = request.getSession(true);  
                missesion.setAttribute("usuario", usuario);
                response.sendRedirect("index.jsp");  
            } 
            
            else {
                  missesion.setAttribute("mensajeError", " ¡Usuario o contraseña incorrectos!");
                  missesion.setAttribute("tipoMensaje2", "danger");
                  response.sendRedirect(request.getContextPath() + "/login.jsp"); 
            }
            
  
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
