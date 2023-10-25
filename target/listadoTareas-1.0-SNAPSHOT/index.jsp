


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file= "templates/header.jsp" %>
   
<section class="background-radial-gradient overflow-hidden">
    
<form action="SvLogin" method="POST">
    <div class="container px-2 py-3 px-md-2 text-center text-lg-start my-5">
    <div class="row gx-lg-2 align-items-center mb-5">
      <div class="col-lg-8 mb-5 mb-lg-8" style="z-index: 10">
        <h1 class="my-5 display-2 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
          Lista de Tareas <br />
          <span style="color: hsl(218, 81%, 75%)">Te damos la bienvenida</span>
        </h1>
        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
          ¡Bienvenido a nuestra aplicación de registro de tareas! Estamos encantados de tenerte aquí 
          y listos para ayudarte a organizar tu vida de manera más eficiente. Ya sea que necesites 
          llevar un seguimiento de tus pendientes diarios, proyectos importantes o simplemente mantener
          tu vida en orden, has llegado al lugar adecuado.
        </p>
      </div>
    
        <br>
        <!-- ingreso -->
        <div class="login">
        <div class="col-lg-4 mb-3 mb-lg-7 position-relative">
        <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
        <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

        <div class="card bg-dark-pastel-blue px-1 py-5 px-md-4">
            <div class="card-body px-1 py-5 px-md-4 text-center">
            
                
              <!-- cedula -->
              <div class="form-outline mb-4">
                <input type="text" class="input1 rounded-input" name="cedula" placeholder="Cédula" required>
              </div>

              
              <!-- contraseña -->
              <div class="form-outline mb-4">
                <input type="password" class="input1 rounded-input" name="contrasenia" placeholder="Contraseña" required>
                
              </div>
              
              
              <!-- boton para ingresar -->
              <button type="submit" class="btn btn-purple-pastel btn-block mb-8">
                Ingresar
              </button>
              
              <br><br>
              
                <div class="sign-up">
                <p>No tienes una cuenta?</p>
                
                <!--Modal del registro-->
                
                    <a href="#" type="submit" class="btn btn-purple-pastel btn-block mb-8" data-bs-toggle="modal" data-bs-target="#staticBackdrop"  >Regístrese aqui</a>
                
              
            </div>
        </div>
        </div>
        </div>
    </div>
    </div>
</form>
        
    
<!-- java Scrip, modales -->
<%
    //Llamamos variable de registro
    String registrado = (String) request.getAttribute("registrado");
        
    //En caso de que si se registre
    if (registrado != null && registrado.equals("si")) {

%>
    <!--modal de registrado con js-->
    <script>
        $(document).ready(function () {
            usuarioReg();
        });
    </script>
<%    } 
        //si no se registra
       else if(registrado != null && registrado.equals("no")){
%>
    <!--Aparece modal de no registrado -->
    <script>
        $(document).ready(function () {
            usuarioNoReg();
        });
    </script>
<%
    }
    //Llamamos variable para saber si los datos de ingreso son validos
    String valido=request.getParameter("valido");
    //En caso de no ser validos
    if (valido != null && valido.equals("false")) {
%>
    
<!--modal de NO ingresado con js -->
    <script>
          $(document).ready(function () {
            usuarioNoIng();
        });
    </script>
<%
    }
    // Elimina los atributos "registrado" e "ingresar" de la solicitud
    request.removeAttribute("registrado");
    request.removeAttribute("valido");
%>



<!-- Modal de registrarse -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <form action="SvRegistro" method="POST">
        <div class="modal-dialog">
            <div class="modal-content custom-modal">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Registrate</h1>
                </div>
                <div class="modal-body">
                    <br>
                    <formu class="form-floating">
                        
                        <input type="text" min="0" step="1" class="form-control" id="floatingInputValue" name="cedula"  value="" required>
                        <label for="floatingInputValue">Cédula</label>
                    </formu>
                    <br>
                    <formu class="form-floating">
                        
                        <input type="text" class="form-control" id="floatingInputValue" name="nombre"  value="">
                        <label for="floatingInputValue">Nombre</label>
                    </formu>
                    <br>
                    <div class="form-floating">
                        
                        <input type="password" class="form-control" id="floatingPassword" name="contrasenia"  >
                        <label for="floatingPassword">Contraseña</label>
                    </div>
                </div>
                <div class="modal-footer">
                    
                    <button type="button" class="btn btn-purple-pastel btn-block mb-8" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-purple-pastel btn-block mb-8">Registrarse</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal -->
<div class="modal fade" id="registrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registradoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content custom-modal">
                <div class="modal-body">
                    <h3>su registro fue exitoso :)</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-purple-pastel btn-block mb-8" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
</div>


<!-- Modal -->
<div class="modal fade" id="noRegistrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noRegistradoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content custom-modal">
                <div class="modal-body">
                    <h3>Los Datos no son correctos porque ya estan en la base de datos :(</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-purple-pastel btn-block mb-8" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
</div>



<script>
    function usuarioReg() {
        $("#registrado").modal("show");
    }
    
    function usuarioNoIng(){
        $("#datosIncorrectos").modal("show");
    }
    
    function usuarioNoReg(){
        $("#noRegistrado").modal("show");
    }
</script>


     
</section>

    <%@include file= "templates/footer.jsp" %>
    

    
    
    
