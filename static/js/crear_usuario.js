$(document).ready(function(){
    $("#btn-crear-usuario").click(function(e){
        e.preventDefault();
        console.log('si se clicleo')
       
             
            var usuario = $("#usuario").val();
            var password = $("#contraseña").val();
            console.log(usuario, password)



        $.ajax({
            method: "POST",
            url: "http://localhost:8000/nuevo_usuario",
            data: { usuario: usuario, pass: password},
        
            success: function(res){
                //Código a ejecutar si la petición se ejecutó correctamente
                console.log('todo funciono y se agrego un usuario', res)
                console.log('response', res['Mensaje'])
                if (res['Mensaje'] === "El usuario ya existe"){
                    alert(`El usuario ${res['usuario']} ya existe`)
                }
                else{
                    alert(`El usuario ${res['usuario']} se creo con exito`)
                    window.location.href = "/"
                }

               // res.Mensaje === 'El usuario ya existe' ? console.log('ya existe') : console.log('El usuario se creo con exito')
            },
                //Código a ejecutar si hubo un error al ejecutar la petición
            error: function(){

            }

        });


    });
});
