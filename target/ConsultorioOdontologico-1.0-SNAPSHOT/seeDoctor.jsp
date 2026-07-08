<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/body.jsp" %>


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
                    <h1 class="h3 mb-2 text-gray-800">Odontólogos registrados</h1>
                    <p class="mb-4">En este apartado podrá gestionar los Odontólogos registrados en el sistema.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Registro de Odontólogos en el sistema</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Especialidad</th>
                                            <th>Contacto</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </thead>
                                    
                                    <%
                                        List<Odontologo> listaOdonto = (List) request.getSession().getAttribute("listaOdonto");
                                    %>
                                    
                                    <tbody>
                                        <% for (Odontologo odonto : listaOdonto){ %>
                                        <tr>
                                             <td><%= odonto.getId()%></td>
                                            <td><%= odonto.getNombre() +" " + odonto.getApellido()  %></td>
                                            <td><%=odonto.getEspecialidad()%></td>
                                            <td><%=odonto.getTelefono() %></td>
                                            
                                            <td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvDeleteOdonto" method="POST"> <!-- Esto envía el código al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px;">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=odonto.getId()%>">
                                    </form>
                                    
                                    
                                    <form name="editar" action="SvEditOdonto" method="GET"> <!-- Esto envía el código al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left:5px;">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=odonto.getId()%>">
                                    </form></td>
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