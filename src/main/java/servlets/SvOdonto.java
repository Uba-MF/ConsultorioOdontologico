
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
        
         List<Odontologo> listaOdonto = new ArrayList<Odontologo>();
         
         listaOdonto = control.getOdontologos();
         
         HttpSession misession = request.getSession();
         misession.setAttribute("listaOdonto", listaOdonto);
         
         response.sendRedirect("seeDoctor.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
               // Los datos pasan a la lógica
                control.crearOdonto(dni,nombre,apellido,telefono,direccion,fechaNac,especialidad,usuario,pass);
        }
        else {
                // Ventana emergente de error
                request.setAttribute("mensaje","Las contraseñas no coiciden, Intentelo nuevamente");
                request.getRequestDispatcher("/newDoctor.jsp").forward(request, response);
        }
        
        response.sendRedirect("newDoctor.jsp");
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
