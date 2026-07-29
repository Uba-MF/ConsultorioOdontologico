
package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;


@WebServlet(name = "SvDeleteUser", urlPatterns = {"/SvDeleteUser"})
public class SvDeleteUser extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Usuario> listaUsuarios = control.getUsuarios();
        request.setAttribute("listaUsuarios", listaUsuarios);
        request.getRequestDispatcher("seeUser.jsp").forward(request, response);
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        HttpSession session = request.getSession();
        
        
        if ("delete".equals(accion)) {
            // Almacena en una variable el id del usuario recibido del JSP
            int id = Integer.parseInt(request.getParameter("id"));

            try {
                control.borrarUsuario(id);
                session.setAttribute("mensaje", " ----->  Usuario eliminado del sistema correctamente");
                session.setAttribute("tipoMensaje", "success");

            } catch (Exception e) {
                session.setAttribute("mensajeError", " Asegurese de eliminar primero al propietario de este usuario e intente de nuevo.");
                session.setAttribute("tipoMensaje2", "danger");
            }

        }
        // Redirige (GET) en vez de forward para evitar reenvío de formulario
        response.sendRedirect(request.getContextPath() + "/SvUsuarios");

        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
