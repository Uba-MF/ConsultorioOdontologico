
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/body.jsp" %>
<%@include  file="components/successMessage.jsp" %>
<%@include file="components/errorMessage.jsp" %>

<link href="css/newDoctor.css" rel="stylesheet"> 

<body class="bg-gradient-primary">

    <div class="container">
        
        
        
        <div class="card o-hidden border-0 shadow-lg my-2">
            <div class="card-body p-0">
                
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image">
                        
                        <label id="tittle">Modificar Odontólogo</label>
                        <p id="text" > Actualice la información de sus odontólogos </p>
                        
                        <div class="img-card">
                            <img src="https://brandandhealth.com/wp-content/uploads/2015/01/BH-Liderazgo-770.jpg" alt="img_odontología" width="120%" height="60%" />
                        </div>
                        
                    </div>
                    <div class="col-lg-7" style="padding-left: 50px;">
                        <div class="p-5">
                            
                            <%Odontologo odonto = (Odontologo) request.getSession().getAttribute("odontoEditar"); %>  

                            <form class="user" action="SvEditOdonto" method="POST">
                                <div class="form-group col">
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="dni"
                                               placeholder="DNI" value="<%=odonto.getDni()%>" disabled>
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre"
                                               placeholder="Nombre" value="<%=odonto.getNombre() %>" >
                                    </div>
                                    
                                     <div class="col-sm-12 mb-3">
                                         <input type="text" class="form-control form-control-user"  name="apellido"
                                                placeholder="Apellido" value="<%=odonto.getApellido() %>">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="telefono"
                                               placeholder="Teléfono" value="<%=odonto.getTelefono() %>">
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user" name="direccion"
                                               placeholder="Dirección" value="<%=odonto.getDireccion() %>">
                                    </div>
                                    
                                    <!-- Formatear la fecha en un formato válido para JSP
                                           Se almacena en una variable la fecha formateada y se pasa al método que estaba en el value-->
                                   <%
                                       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                       String fechaFormateada = sdf.format(odonto.getFecha_nac());
                                   %>
                                    
                                      <div class="col-sm-12 mb-3">
                                        <input type="date" class="form-control form-control-user" name="fechanac"
                                               placeholder="Fecha Nac" value="<%=fechaFormateada %>"> <!--En el value se reemplaza por la variable que contiene la fecha formateada-->
                                    </div>
                                    
                                    <div class="col-sm-12 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="especialidad"
                                            placeholder="Especialidad" value="<%=odonto.getEspecialidad() %>">
                                    </div>
                                    
                                </div>
                               
                                 <a href="seeDoctor.jsp" class="btn btn-danger btn-user" type="submit" style="margin-left: 35%; width: 17%">
                                    <b> Volver </b>
                                </a> 
                                <button class="btn btn-primary btn-user" type="submit">
                                    <b>Guardar</b>
                                </button>

                                
                            </form>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

     
</body>

    
<%@include file="components/footer.jsp" %>