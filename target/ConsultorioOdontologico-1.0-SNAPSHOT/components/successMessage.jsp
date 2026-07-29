
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
             <%-- Mensaje de confirmación --%>
             <%-- al agregar o eliminar un registro correctamente --%>
                         <%            
                                String mensaje = (String) session.getAttribute("mensaje");
                                String tipoMensaje = (String) session.getAttribute("tipoMensaje");
                           %>

                           <%
                                 if (mensaje != null && !mensaje.isEmpty()) {%>
                                    <div id="alertaMensaje" class="alert alert-success  <%= tipoMensaje%>" >
                                       <%= mensaje%>
                                    </div>
                           <%
                                    session.removeAttribute("mensaje");
                                    session.removeAttribute("tipoMensaje");
                            %>
                            <%
                                   }
                            %> 
        
    </body>
</html>
