
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/body.jsp" %>
<link href="css/newDoctor.css" rel="stylesheet"> 

<body class="bg-gradient-primary">

    <div class="container">
        
        
        
        <div class="card o-hidden border-0 shadow-lg my-2">
            <div class="card-body p-0">
                
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image">
                        
                        <label id="tittle">Ingresar nuevo Odontólogo</label>
                        <p id="text" > Ingrese todos los datos personales del nuevo odontólogo y por último de clic en "Registrar Odontólogo" para guardar en el sistema.</p>
                        
                        <div class="img-card">
                            <img src="https://brandandhealth.com/wp-content/uploads/2015/01/BH-Liderazgo-770.jpg" alt="img_odontología" width="120%" height="60%" />
                        </div>
                        
                    </div>
                    <div class="col-lg-7" style="padding-left: 50px;">
                        <div class="p-5">
                            
                              

                            <form class="user" action="SvOdonto" method="POST">
                                <div class="form-group col">
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="dni"
                                            placeholder="DNI">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre"
                                            placeholder="Nombre">
                                    </div>
                                    
                                     <div class="col-sm-12 mb-3">
                                         <input type="text" class="form-control form-control-user"  name="apellido"
                                            placeholder="Apellido">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="telefono"
                                            placeholder="Teléfono">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="direccion"
                                            placeholder="Dirección">
                                    </div>
                                    
                                      <div class="col-sm-12 mb-3">
                                        <input type="date" class="form-control form-control-user" name="fechanac"
                                            placeholder="Fecha Nac">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="especialidad"
                                            placeholder="Especialidad">
                                    </div>
                                    
                                    <hr> 
                                    
                                     <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="usuario" 
                                            placeholder="Usuario">
                                    </div>
                                    
                                     <div class="col-sm-12 mb-3">
                                        <input type="password" class="form-control form-control-user"  name="contrasena"
                                            placeholder="Contraseña">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="password" class="form-control form-control-user"  name="contrasena2"
                                            placeholder="Confirmar contraseña"> 
                                    </div>
                                    
                                </div>
                               
                                
                                <button class="btn btn-primary btn-user" type="submit" style="margin-left: 40%">
                                    <b>Registrar Odontólogo</b>
                                </button>
                                
                               <%
                                    String mensaje = (String) request.getAttribute("mensaje");
                                    if (mensaje != null) {
                                %>
                                <script>
                                    alert("<%=mensaje%>");
                                </script>
                              <%
                                  }
                                  %> 
                                
                            </form>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

     
</body>

    
<%@include file="components/footer.jsp" %>