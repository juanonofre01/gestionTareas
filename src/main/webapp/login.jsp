

<%@include file= "templates/header.jsp" %>
<%String usuario=request.getParameter("usuarioI");%>

<!-- Navegador de bootstrap -->



<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" ><i class="fa-solid fa-list-check fa-xl"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp?usuarioI=<%out.print(usuario);%>">Principal</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Opciones
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">1</a></li>
            <li><a class="dropdown-item" href="#">2</a></li>
            <li><a class="dropdown-item" href="#">3</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Buscar</button>
      </form>
    </div>
  </div>
</nav>



<!-- Mensaje personalizado al ingresar -->

    <div class="container p-4"> 
        <div class="card text-center">
            <div class="card-header">
            </div>

            <div class="card-body">
              <h5>Bienvenido, <%out.println(request.getParameter("usuarioI"));%></h5>
              <a href="index.jsp" class="btn btn-outline-success"> Cerrar sesion</a>
            </div>

            <div class="card-footer text-body-secondary">
            </div>
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
                              Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                              Introduce un id v�lido.
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
                              Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                              Introduce un titulo v�lido.
                            </div> 
                        </formu></div>
                    </div>
                    
                    
                    <!-- Descripcion -->
              
                    <div class="input-group">
                        <label for="descripcion" class="form-label">Descripci�n</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                            <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Required example textarea" required></textarea>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                              Se mira bien!
                            </div>
                                <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                              Introduce una descripcion v�lida.
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
                              Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                              Introduce una fecha v�lida.
                            </div> 
                        </div>
                    </div>
                    
                    
                    
                    <center>
                        <button type="submit" class="btn btn-outline-success">Agregar Tarea</button>
                    </center>
                </form>
               </div>

            </div> 

    <div class="col-md-8">
        
        
        <!-- poner tabla aqu�-->
        
        
        <div class="card card-body">
        <table class="table table-striped table-hover">
            <!--fila de ingreso de tarea -->   
            <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Titulo</th>
              <th scope="col">Descripci�n</th>
              <th scope="col">Fecha</th>
              <th scope="col">Acciones</th>
            </tr>
            </thead>

            <!-- Contenido tabla -->
            <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Trabajo</td>
              <td>Realizar trabajo</td>
              <td>2/10/2023</td>
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
    // Funci�n de flecha que se ejecuta inmediatamente.
    (() => {
      'use strict'; // Modo estricto para un c�digo m�s seguro y eficiente.

      // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
      const forms = document.querySelectorAll('.needs-validation');

      // Itera sobre cada formulario encontrado.
      Array.from(forms).forEach(form => {
        // Agrega un evento "submit" a cada formulario.
        form.addEventListener('submit', event => {
          // Verifica si el formulario no es v�lido.
          if (!form.checkValidity()) {
            event.preventDefault(); // Previene el env�o del formulario si no es v�lido.
            event.stopPropagation(); // Detiene la propagaci�n del evento para evitar otros manejadores de eventos.
          }
          form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
        }, false);
      });
    })();
</script>

<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
