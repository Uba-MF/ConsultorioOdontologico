
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/body.jsp" %>
<%@include file="components/successMessage.jsp"%>
<%@include file="components/errorMessage.jsp" %>

<link href="css/newDoctor.css" rel="stylesheet"> 

<body class="bg-gradient-primary">

    <div class="container">
        
        
        
        <div class="card o-hidden border-0 shadow-lg my-2">
            <div class="card-body p-0">
                
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <label id="tittle" class="ml-5 font-weight-bolder" style="color:gray">Editar Paciente</label>
                    <div class="d-none d-lg-block bg-register-image"> </div>
                   
                    <div class="col-lg-7">
                        <div class="p-5" style="width: 176%; background-color: whitesmoke">
                            
                           <%
                               Paciente patient = (Paciente) request.getSession().getAttribute("editarPaciente");
                           %>  

                            <form class="user" action="SvEditPatient" method="POST">
                                <div class="row ml-5" style="padding-left: 55px;">
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="dni"
                                               placeholder="Número documento" value="<%=patient.getDni() %>" disabled>
                                    </div>
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre"
                                               placeholder="Nombres" value="<%=patient.getNombre() %>" required>
                                    </div>
              
                                     <div class="col-md-5 mb-3">
                                         <input type="text" class="form-control form-control-user"  name="apellido"
                                                placeholder="Apellidos" value="<%=patient.getApellido() %>" required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="telefono"
                                               placeholder="Teléfono" value="<%=patient.getTelefono() %>" required>
                                    </div>
                              
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="direccion"
                                            placeholder="Dirección" value="<%=patient.getDireccion() %>" required>
                                    </div>
                                    
                                            <!-- Formatear la fecha en un formato válido para JSP
                                                   Se almacena en una variable la fecha formateada y se pasa al método que estaba en el value-->
                                            <%
                                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                String fechaFormateada = sdf.format(patient.getFecha_nac());
                                            %>
                                    
                                    <div class="col-md-5 mb-4">
                                        <input type="date" class="form-control form-control-user" name="fechanac"
                                               placeholder="Fecha Nac" value="<%=fechaFormateada %>" required>
                                    </div>
                                    
                                     <div class="col-md-5 ml-3 mb-3">
                                        <label for="eps"> Seleccione la EPS:</label>
                                        <select id="eps" name="options_Eps" required>
                                            <option value="" disable <%= (patient.getTiene_EPS() == null || patient.getTiene_EPS().isEmpty()) ? "selected" : "" %>> Seleccione... </option>
                                            <option value="Nueva Eps" <%= "Nueva Eps".equalsIgnoreCase(patient.getTiene_EPS()) ? "selected" : "" %> >Nueva EPS</option>
                                            <option value="EPS Sanitas" <%= "Eps Sanitas".equalsIgnoreCase(patient.getTiene_EPS()) ? "selected" : "" %> >EPS Sanitas</option>
                                            <option value="EPS Sura" <%= "Eps Sura".equalsIgnoreCase(patient.getTiene_EPS()) ? "selected" : "" %> >EPS Sura</option>
                                            <option value="Salud Total" <%= "Salud Total".equalsIgnoreCase(patient.getTiene_EPS()) ? "selected" : "" %> >Salud Total</option>
                                            <option value="Compensar" <%= "Compensar".equalsIgnoreCase(patient.getTiene_EPS()) ? "selected" : "" %> >Compensar</option>
                                        </select>
                                    </div>
                                    
                                     <div class="col-md-5 mb-4">
                                        <label for="tipo_sangre"> Tipo sangre:</label>
                                        <select id="tipo_sangre" name="options_Blood" required>
                                            <option value="" disabled <%= (patient.getTipoSangre() == null || patient.getTipoSangre().isEmpty()) ? "selected" : "" %>> Seleccione... </option>
                                            <option value="A+" <%= "A+".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >A+</option>
                                            <option value="A-" <%= "A-".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >A-</option>
                                            <option value="B+" <%= "B+".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >B+</option>
                                            <option value="B-" <%= "B-".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >B-</option>
                                            <option value="AB+" <%= "AB+".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >AB+</option>
                                            <option value="AB-" <%= "AB-".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >AB-</option>
                                            <option value="O+" <%= "O+".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >O+</option>
                                            <option value="O-" <%= "O-".equalsIgnoreCase(patient.getTipoSangre()) ? "selected" : "" %> >O-</option>
                                        </select>
                                    </div>
                                </div>

                               
                                <a href="seePatient.jsp" class="btn btn-danger btn-user" type="submit" style="margin-left: 43%; width: 9%">
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