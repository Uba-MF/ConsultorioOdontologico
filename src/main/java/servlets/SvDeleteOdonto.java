
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;



@WebServlet(name = "SvDeleteOdonto", urlPatterns = {"/SvDeleteOdonto"})
public class SvDeleteOdonto extends HttpServlet {
    
        Controladora control = new Controladora();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
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
                  control.borrarOdonto(id);
                  session.setAttribute("mensaje", " -----> Registro eliminado del sistema correctamente");
                  session.setAttribute("tipoMensaje", "success");
             } catch (Exception e) {
                  session.setAttribute("mensaje", "Error al eliminar el registro: " +e.getMessage());
                  session.setAttribute("tipoMensaje", "danger");
             }
        }

         response.sendRedirect(request.getContextPath() + "/SvOdonto");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
