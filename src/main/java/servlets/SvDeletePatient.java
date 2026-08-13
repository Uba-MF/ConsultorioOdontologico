
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;


@WebServlet(name = "SvDeletePatient", urlPatterns = {"/SvDeletePatient"})
public class SvDeletePatient extends HttpServlet {

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
             int id = Integer.parseInt(request.getParameter("id"));
             
             try {
                  control.borrarPaciente(id);
                  session.setAttribute("mensaje", " -----> ¡Registro eliminado correctamente del sistema!");
                  session.setAttribute("tipoMensaje", "success");
             } catch (Exception e) {
                  session.setAttribute("mensajeError", " !Error al eliminar el registro!<br/> " +e.getMessage());
                  session.setAttribute("tipoMensaje2", "danger");
             }
        }
        
        response.sendRedirect(request.getContextPath() + "/SvPatient");
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
