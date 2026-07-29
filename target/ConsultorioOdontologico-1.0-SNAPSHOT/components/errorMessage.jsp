
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
       
                <%-- Mensaje de error cuando las contraseñas no coinciden  --%>
                                
                                <% 
                                        String mensajeError = (String) session.getAttribute("mensajeError");
                                        String tipoMensaje2 = (String) session.getAttribute("tipoMensaje2");
                                %>
         
                                 <%
                                        if (mensajeError != null && !mensajeError.isEmpty()) { 
                                 %>
                                  
                                        <div id="alertaMensaje" class="alert alert-danger <%= tipoMensaje2%>">
                                            <%=mensajeError%>
                                       </div>
                                <% 
                                        session.removeAttribute("mensajeError");
                                        session.removeAttribute("tipoMensaje2");
                                %>
        
                                <%
                                    }
                                 %>
        
    </body>
</html>
