<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/body.jsp" %>
<%@include file="components/successMessage.jsp" %>
<%@include file="components/errorMessage.jsp" %>

<body class="bg-gradient-primary">

    <div class="container">
        
        
        
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"> </div>
                    
                            <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Pacientes </h1>
                    <p class="mb-4">Pacientes registrados en el sistema.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Registro de Pacientes en el sistema</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>N° Documento</th>
                                            <th>Nombres</th>
                                            <th>Telefono</th>
                                            <th>EPS</th>
                                            <th>Tipo Sangre</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </thead>
                                    
                                    <%
                                        List<Paciente> listaPacientes = (List) request.getSession().getAttribute("listaPacientes");
                                    %>
                                    
                                    <tbody>
                                        <% for (Paciente patient : listaPacientes){ %>
                                        <tr>
                                             <td><%= patient.getDni()%></td>
                                            <td><%= patient.getNombre() +" " + patient.getApellido()  %></td>
                                            <td><%=patient.getTelefono() %></td>
                                            <td><%=patient.getTiene_EPS()%></td>
                                            <td><%=patient.getTipoSangre()%></td>
                                            
                                            <td style="display: flex; width: 230px;">
                                                <form name="eliminar" action="SvDeleteOdonto" method="POST" onsubmit="return confirmarEliminacion()" > <!-- Esto envía el código al servlet -->
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px;">
                                                        <input type="hidden" name ="accion" value="delete">
                                                        <input type="hidden" name="id" value="<%=patient.getId()%>">
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                </form>
                                                        
                                                          <!-- Mensaje de confirmación para eliminar -->
                                                       <script>
                                                                function confirmarEliminacion() {
                                                                    return confirm("¿Estás seguro de eliminar a este usuario?");
                                                                    }
                                                        </script>
                                    
                                    
                                                        <form name="editar" action="SvEditOdonto" method="GET"> <!-- Esto envía el código al servlet -->
                                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left:5px;">
                                                                <i class="fas fa-pencil-alt"></i> Editar
                                                            </button>
                                                            <input type="hidden" name="id" value="<%=patient.getId()%>">
                                                        </form> 
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
                            

                </div>
            </div>
        </div>

    </div>
    
   

</body>

    
<%@include file="components/footer.jsp" %>