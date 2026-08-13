
package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;


@WebServlet(name = "SvEditOdonto", urlPatterns = {"/SvEditOdonto"})
public class SvEditOdonto extends HttpServlet {
    
        Controladora control = new Controladora();

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        int id = Integer.parseInt(request.getParameter("id"));
        // Método para traer el id del registro a editar
        Odontologo odonto = control.traerOdontologos(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("odontoEditar", odonto);
        
        response.sendRedirect("editDoctor.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
         // Se almacenan los cambios que se hagan en el formulario en variables auxiliares

         String nameOdon = request.getParameter("nombre");
         String lastNameOdon = request.getParameter("apellido");
         String numberPhoneOdon = request.getParameter("telefono");
         String addressOdon = request.getParameter("direccion");
         String dateBirthOdon = request.getParameter("fechanac");
         String especialityOdon = request.getParameter("especialidad");
         
         // Se recibe del formulario en String y se convierte a Date
         LocalDate localDate = LocalDate.parse(dateBirthOdon);
         Date fecha = java.sql.Date.valueOf(localDate);
         
         Odontologo odonto = (Odontologo)  request.getSession().getAttribute("odontoEditar");
         odonto.setNombre(nameOdon);
         odonto.setApellido(lastNameOdon);
         odonto.setTelefono(numberPhoneOdon);
         odonto.setDireccion(addressOdon);
         // De esta forma se guarda la fecha correctamente en la BD
         odonto.setFecha_nac(fecha);
         odonto.setEspecialidad(especialityOdon);
         
  
         try {
             control.editOdonto(odonto);
             session.setAttribute("mensaje", " -----> ¡Datos actualizados correctamente!");
             session.setAttribute("tipoMensaje", "success");
         } catch (Exception e) {
              session.setAttribute("mensajeError", "Error al actualizar los datos: " +e.getMessage());
              session.setAttribute("tipoMensaje2", "danger");
         }
         
         
         response.sendRedirect("SvOdonto");
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
