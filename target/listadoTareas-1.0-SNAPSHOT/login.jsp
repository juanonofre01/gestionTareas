

<%@include file= "templates/header.jsp" %>
<%String usuario=request.getParameter("usuarioI");%>


<!-- Mensaje personalizado al ingresar -->

     
        <div class="card text-center" >
            

            <div class="card-body">
              <h5><%out.println(request.getParameter("usuarioI"));%> Bienvenido a este programa</h5>
              <a href="index.jsp" class="btn btn-outline-success"> Cerrar la sesion</a>
            </div>

            <div class="card-footer text-body">
            </div>
              
        </div>
    

    <!-- Tabla -->
    
  <div class="container p-4"> 
      
    <div class="row">
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
               <div class="card card-body">
                    <form class="row g-3 needs-validation" novalidate>
                    
                    <!-- ID -->
                    
                    <div class="input-group">
                        <label for="validationCustomUsername" class="form-label">Id</label>
                        <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card"></i></span>
                                <input type="number" class="form-control" min="0" step="1"id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                                
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                            </div> 
                        </div>
                    </div>
                    
                    <!-- Titulo -->
                    
                    <div class="input-group">
                        <div class="input-group">
                            <formu class="form-floating">
                                <input type="text" class="form-control" id="floatingInputValue" name="titulo" placeholder="Ingrese el Titulo" value="" required="">
                                <label for="floatingInputValue">Titulo</label>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                            </div> 
                        </formu></div>
                    </div>
                    
                    
                    <!-- Descripcion -->
              
                    <div class="input-group">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                            <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Required example textarea" required></textarea>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                            </div>
                                <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                            </div> 
                        </div>    
                    </div>
                    
                    
                    <!-- Fecha -->  
                    <div class="input-group">
                        <label for="validationCustom05" class="form-label">Fecha</label>
                        <div class="input-group">
                            <input type="date" class="form-control"  name="fecha" id="validationCustom05" required>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                            </div> 
                        </div>
                    </div>
                    
                    <div class="formulario">
                    <form action="/action_page.php">
                        <p>Elige la posición de tu trabajo</p>
                          <input type="radio" id="Inicio" name="fav_language" value="Inicio">
                          <label for="Inicio">Inicio</label><br>
                          <input type="radio" id="Antes_de" name="fav_language" value="Antes_de">
                          <label for="Antes_de">Antes de</label><br>
                          <input type="radio" id="Despues_de" name="fav_language" value="Despues_de">
                          <label for="Despues_de">Despues de</label><br>
                          <input type="radio" id="Final" name="fav_language" value="Final">
                          <label for="Final">Final</label>
                        <br>  
                    </form>
                    </div>
                    
                    
                    <center>
                        <button type="submit" class="btn btn-outline-success">Agregar Tarea</button>
                    </center>
                </form>
               </div>

            </div> 

    <div class="col-md-8">
        
        
        <!-- poner tabla aquí-->
        
        
        <div class="card card-body">
        <table class="table table-striped table-hover">
            <!--fila de ingreso de tarea -->   
            <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Titulo</th>
              <th scope="col">Descripción</th>
              <th scope="col">Fecha</th>
              <th scope="col">Acciones</th>
            </tr>
            </thead>

            <!-- Contenido tabla -->
            <tbody>
            <tr>
              <th scope="row">0</th>
              <td>Trabajo</td>
              <td>Realizar trabajo</td>
              <td>2/8/2023</td>
              <td> <a href="#" class="btn btn-outline-success"><i class="fa-solid fa-pen-clip"></i></a>
                  <a href="#" class="btn btn-outline-danger"><i class="fa-solid fa-trash"></i> </a></td>
            </tr>
            </tbody>
        </table>
        </div>
    </div>
  </div></div>
    

    <!-- Javascript para manejar la logica de los mensajes del required 
    BASADO:   https://getbootstrap.com/docs/5.3/forms/validation/   -->
    
<script> 
    // Función de flecha que se ejecuta inmediatamente.
    (() => {
      'use strict'; // Modo estricto para un código más seguro y eficiente.

      // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
      const forms = document.querySelectorAll('.needs-validation');

      // Itera sobre cada formulario encontrado.
      Array.from(forms).forEach(form => {
        // Agrega un evento "submit" a cada formulario.
        form.addEventListener('submit', event => {
          // Verifica si el formulario no es válido.
          if (!form.checkValidity()) {
            event.preventDefault(); // Previene el envío del formulario si no es válido.
            event.stopPropagation(); // Detiene la propagación del evento para evitar otros manejadores de eventos.
          }
          form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
        }, false);
      });
    })();
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
