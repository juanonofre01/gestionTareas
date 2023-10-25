<!-- Javascript para manejar la logica de los mensajes del required 
BASADO:   https://getbootstrap.com/docs/5.3/forms/validation/   -->

<script>
    
    // se utilizan los Toast elemento de control grafico
  function tareaSi() {
        toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // Mostrar una notificación Toastr de error
    toastr.success('Se añadio!', 'Registrado');
    }
    
    function tareaNo(){
         toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    
    // notificación Toastr de error
    toastr.error('intenta de nuevo!', 'No se añadio');
    }
    // Función de flecha que se ejecuta inmediatamente.
    (() => {
        'use strict';

        // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
        const forms = document.querySelectorAll('.needs-validation');

        // realiza varias acciones sobre cada formulario encontrado.
        Array.from(forms).forEach(form => {
            // Agrega un evento "submit" a los formularios.
            form.addEventListener('submit', event => {
                // Verifica si el formulario no es válido.
                if (!form.checkValidity()) {
                    event.preventDefault(); // Previene el envío del formulario si no es válido.
                    event.stopPropagation();
                }
                form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
            }, false);
        });
    })();
    
       var id = "";

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar una tarea.
     * Se dispara cuando se muestra el modal.
     */
    $('#eliminar').on('show.bs.modal', function (event) {
        // Obtiene el botón que realizo el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el id de la tarea desde el atributo: 'data-nombre' del botón
        var idTarea = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);
        
        var titNuev =

        // Almacena el nombre de la tarea en la variable global 'id'
        id = idTarea;

    });
    
     function eliminarTarea() {
        // Obtiene el id de la tarea (id) atributo
        var idTarea = id;

        // Realiza una solicitud AJAX al servlet 'SvBotonesModEli' --elimar tarea 
        $.ajax({
            url: 'SvBotonesModEli?id=' + idTarea, // URL del servlet con el parámetro 'id' para la eliminación
            method: 'GET', 
            success: function (data) {
               

                // modal de eliminación para cerrar
                $('#eliminar').modal('hide');

                // Recarga la página actual para hacer los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola
                console.log('Error al eliminar el perro.');
            }
        });
    }

    $('#editar').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var idTarea = button.data('nombre');
    
    // se muestra el ID de la tarea en el modal
    $('#tareaId').text(idTarea);

    // También puedes almacenar el ID en una variable global si necesitas acceder a él en otros lugares del código.
    tareaId = idTarea;
});

// JavaScript para el modal1
$('#editar').on('show.bs.modal', function (event) {
    // Al hacer clic en el botón, pasa la variable tareaId a modal2
    $('#btnPasarVariable').click(function () {
        $('#edTit').data('tareaId', tareaId);
        $('#edTit').modal('show');
    });
    $('#btnPasarVariable1').click(function () {
        $('#edDes').data('tareaId', tareaId);
        $('#edDes').modal('show'); 
    });
    $('#btnPasarVariable2').click(function () {
        $('#edFec').data('tareaId', tareaId);
        $('#edFec').modal('show'); 
    });
});
// JavaScript
$('#edTit').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edTit').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edTit').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});

$('#edDes').on('show.bs.modal', function (event) {
    var tareaId = $('#edDes').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edDes').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});

$('#edFec').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edFec').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edFec').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});
 // Obtiene referencias a los botones y opciones
    const showOptionsBtn = document.getElementById("showOptionsBtn");
    const opcionesAdicionales = document.getElementById("opcionesAdicionales");
    const finalSubmitBtn = document.getElementById("finalSubmitBtn");

    // Agrega un controlador de eventos "click" al botón "Agregar Tarea"
    showOptionsBtn.addEventListener("click", function () {
        // Oculta el botón inicial
        showOptionsBtn.style.display = "none";
        // Muestra las opciones adicionales
        opcionesAdicionales.style.display = "block";
        // Muestra el botón final para enviar
        finalSubmitBtn.style.display = "block";
    });
</script>