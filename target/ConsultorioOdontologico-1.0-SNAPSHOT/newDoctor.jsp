
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
                    <label id="tittle" class="ml-5 font-weight-bolder" style="color:gray">Ingresar nuevo Odontólogo</label>
                    <div class="d-none d-lg-block bg-register-image"> </div>
                   
                    <div class="col-lg-7">
                        <div class="p-5" style="width: 176%; background-color: whitesmoke">
                            
                              

                            <form class="user" action="SvOdonto" method="POST">
                                <div class="row">
                                    
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="dni"
                                            placeholder="Número documento" required>
                                    </div>
                                    
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre"
                                            placeholder="Nombres" required>
                                    </div>
                                    
                                     <div class="col-md-6 mb-3">
                                         <input type="text" class="form-control form-control-user"  name="apellido"
                                            placeholder="Apellidos" required>
                                    </div>
                                    
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="telefono"
                                            placeholder="Teléfono" required>
                                    </div>
                                    
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="direccion"
                                            placeholder="Dirección" required>
                                    </div>
                                    
                                      <div class="col-md-6 mb-3">
                                        <input type="date" class="form-control form-control-user" name="fechanac"
                                            placeholder="Fecha Nac" required>
                                    </div>
                                    
                                    <div class="col-md-6 mb-5">
                                        <input type="text" class="form-control form-control-user"  name="especialidad"
                                            placeholder="Especialidad" required>
                                    </div>
                                     </div>
                                    
                                
                                <label class="font-weight-bolder">Establecer usuario y contraseña</label> 
                                <hr>

                                <div class="row align-content-center">

                                    <div class="col-md-3 mb-3">
                                        <img src="img/pngwing.com.png" width="170px" height="170px" alt="alt"/>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <input type="text" class="form-control form-control-user"  name="usuario" 
                                                   placeholder="Usuario" required>
                                        </div>

                                        <div class="mb-3 input-group">
                                            <input type="password" class="form-control form-control-user"  name="contrasena"
                                                   placeholder="Contraseña" required  id="password">
                                            <button class="btn btn-outline-secondary" type="button" id="togglePassword">👁️</button>
                                        </div>

                                        <div class="mb-5 input-group">
                                            <input type="password" class="form-control form-control-user"  name="contrasena2"
                                                   placeholder="Confirmar contraseña" required  id="password2"> 
                                            <button class="btn btn-outline-secondary" type="button" id="togglePassword2">👁️</button>
                                        </div>
                                        
                                         <script>
                                                    const togglePassword = document.querySelector('#togglePassword');
                                                    const password = document.querySelector('#password');

                                                    togglePassword.addEventListener('click', function () {
                                                    // Cambiar el tipo de input
                                                    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                                                    password.setAttribute('type', type);
                                             });
                                        </script>
    
                                        <script>
                                                    const togglePassword2 = document.querySelector('#togglePassword2');
                                                    const password2 = document.querySelector('#password2');

                                                    togglePassword2.addEventListener('click', function () {
                                                    // Cambiar el tipo de input
                                                    const type = password2.getAttribute('type') === 'password' ? 'text' : 'password';
                                                    password2.setAttribute('type', type);
                                                 });
                                        </script>

                                    </div>

                                </div>
                               
                                <a href="index.jsp" class="btn btn-danger btn-user" type="submit" style="margin-left: 43%; width: 9%">
                                    <b> Volver </b>
                                </a> 
                                <button class="btn btn-primary btn-user" type="submit">
                                    <b>Registrar</b>
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