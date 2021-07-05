$(document).ready(function(){
    
    //Aqui ya comenzamos usando el JQUERY
    // Para obtenr valores lo hacemos mediante un query $('Aqui dentro va la clase, el id) $('#username') $('.username')
    $('#ingresar').click(function(e){ 
        e.preventDefault();
        var user = $("#username").val();
        var password = $("#password").val();
        console.log(user, password)

       
        //Comenzamos peticiones con AJAX

        $.ajax({
            method: "POST",
            url: "http://localhost:8000/login",
            data: ({ user: user, pass: password }),
    
          }).done(function(response) {
            console.log (response)
            //En este if hacemos el redireccionamiento al dashboard
            if (response.redirect) window.location.href= response.redirect
             window.location.href = "dashboard";// imprimimos la respuesta
          }).fail(function() {
            alert(" El usuario o password son incorrectos");
          });


          
    });
    //btn-crear-usuario es el boton en el login que nos redirecciona al endpoint de crear un nuevo usuario
    $('#btn-crear-usuario').click(function(e){
      e.preventDefault();
      console.log('Crear usuario');
      window.location.href = "/nuevo_usuario";

    });





  });