<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/body.jsp" %>

<link href="css/newUser.css" rel="stylesheet"> 

<body class="bg-gradient-primary">

    <div class="container">
        
        
        
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image">
                        
                        <label id="tittle-user" class="p-2 text-center">Editar Usuario</label>
                       
                        
                        <div class="img-card mt-5">
                            <img src="https://fececo.org.ar/storage/2022/06/personas-usuarios.png" alt="img_odontología" width="100%" height="50%" />
                        </div>
                        
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            
                            <% Usuario usu = (Usuario) request.getSession().getAttribute("usuEditar"); %>  

                            <form class="user" action="SvEditUser" method="POST">
                                <div class="form-group col">
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombreUsuario"
                                               placeholder="Nombre Usuario" value="<%=usu.getNombreUsuario() %>">
                                    </div>
                                    
                                     <div class="col-sm-12 mb-3">
                                        <input type="password" class="form-control form-control-user" 
                                               value="<%=usu.getContrasena() %>" disabled>
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="password" class="form-control form-control-user" name="contrasena"
                                               placeholder="Nueva Contraseña">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="password" class="form-control form-control-user" name="contrasena2"
                                               placeholder="Confirmar Contraseña">
                                    </div>
                                    
                                 

                                     <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="rol"
                                               placeholder="Rol" value="<%=usu.getRol() %>">
                                    </div>

                                </div>
                               
                               <a href="seeUser.jsp" class="btn btn-danger btn-user" type="submit" style="margin-left: 35%; width: 17%">
                                    <b> Volver </b>
                                </a> 
                                <button class="btn btn-primary btn-user" type="submit">
                                    <b> Guardar </b>
                                </button><br><br>
                                   
                                    <%-- Mensaje de confirmación --%>
                                <%@include file="components/successMessage.jsp" %>
                                
                                <%-- Mensaje de error al comparar las contraseñas  --%>
                                <%@include file="components/errorMessage.jsp" %>
                              
                            </form>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

     
</body>

    
<%@include file="components/footer.jsp" %>