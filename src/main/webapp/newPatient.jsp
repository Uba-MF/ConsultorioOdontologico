
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
                    <label id="tittle" class="ml-5 font-weight-bolder" style="color:gray">Ingresar nuevo Paciente</label>
                    <div class="d-none d-lg-block bg-register-image"> </div>
                   
                    <div class="col-lg-7">
                        <div class="p-5" style="width: 176%; background-color: whitesmoke">
                            
                              

                            <form class="user" action="SvPatient" method="POST">
                                <div class="row ml-5" style="padding-left: 55px;">
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="dni"
                                            placeholder="Número documento" required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre"
                                            placeholder="Nombres" required>
                                    </div>
              
                                     <div class="col-md-5 mb-3">
                                         <input type="text" class="form-control form-control-user"  name="apellido"
                                            placeholder="Apellidos" required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="telefono"
                                            placeholder="Teléfono" required>
                                    </div>
                              
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="direccion"
                                            placeholder="Dirección" required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-4">
                                        <input type="date" class="form-control form-control-user" name="fechanac"
                                               placeholder="Fecha Nac" required>
                                    </div>
                                    
                                     <div class="col-md-5 ml-3 mb-3">
                                        <label for="eps"> Seleccione la EPS:</label>
                                        <select id="eps" name="options_Eps" required>
                                            <option value="" disable selected>Escoja una opción</option>
                                            <option value="Nueva Eps">Nueva EPS</option>
                                            <option value="EPS Sanitas">EPS Sanitas</option>
                                            <option value="EPS Sura">EPS Sura</option>
                                            <option value="Salud Total">Salud Total</option>
                                            <option value="Compensar">Compensar</option>
                                        </select>
                                    </div>
                                    
                                     <div class="col-md-5 mb-3">
                                        <label for="tipo_sangre"> Tipo sangre:</label>
                                        <select id="tipo_sangre" name="options_Blood" required>
                                            <option value="" disable selected>Escoja una opción</option>
                                            <option value="A+">A+</option>
                                            <option value="A-">A-</option>
                                            <option value="B+">B+</option>
                                            <option value="B-">B-</option>
                                            <option value="AB+">AB+</option>
                                            <option value="AB-">AB-</option>
                                            <option value="O+">O+</option>
                                            <option value="O-">O-</option>
                                        </select>
                                    </div>
                                

                                    <div class="col-md-5 ml-3 mb-5">
                                        <label for="resp">¿Tiene acompañante?:</label>
                                        <select id="resp" name="options_Acomp" required>
                                            <option value="" disable selected>Escoja una opción</option>
                                            <option value="yes">Si</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                               </div>
    
                                
                                    <label class="font-weight-bolder">Datos del acompañante</label> 
                                    <hr>
                                     
                                    <div class="row ml-5" style="padding-left: 55px;">
                                     <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="n_documento"
                                            placeholder="Número documento" id="myInput" disabled required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombres"
                                            placeholder="Nombre y Apellido" id="myInput2" disabled required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-3">
                                        <input type="text" class="form-control form-control-user"  name="n_celular"
                                            placeholder="Número de celular" id="myInput3" disabled required>
                                    </div>
                                    
                                    <div class="col-md-5 mb-5 m-3 ">
                                        <label for="lang">Parentesco o Relación:</label>
                                        <select id="lang" name="relation" disabled required>
                                            <option value="" disabled selected>Escoja una opción</option>
                                            <option value="Madre/Padre">Madre / Padre</option>
                                            <option value="Esposo/a">Esposo / (a)</option>
                                            <option value="Amigo/a">Amigo / (a)</option>
                                            <option value="Familiar">Familiar</option>  
                                        </select>
                                    </div>
                                        
                                        <!-- Función de JavaScript para habilitar / deshabilitar los inputs -->
                                        <script>
                                            const select = document.getElementById('resp');
                                            const input = document.getElementById('myInput');
                                            const input2 = document.getElementById('myInput2');
                                            const input3 = document.getElementById('myInput3');
                                            const input4 = document.getElementById('lang');
                                            
                                            select.addEventListener('change' , function() {
                                                if (this.value === 'yes') {
                                                    input.disabled = false;   // Habilita el input
                                                    input2.disabled = false; 
                                                    input3.disabled = false; 
                                                    input4.disabled = false;
                                                } else {
                                                    input.disabled = true;  // Deshabilita el input
                                                    input2.disabled = true;
                                                    input3.disabled = true;
                                                    input4.disabled = true;
                                                }
                                            });                                          
                                        </script>
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