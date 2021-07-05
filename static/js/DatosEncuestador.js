$(document).ready(function () {


    //Aqui comenzaremos a utilizar el JQUERY
    // Para obtenr valores lo hacemos mediante un query $('Aqui dentro va la clase, el id) $('#username') $('.username')
    $('#Guardar').click(function (e) {
        e.preventDefault();
        var NombreEncuestador = $("#NombreEncuestador").val();
        var Empresa = $("#Empresa").val();
        var Direccion = $("#Direccion").val();
        var Colonia = $("#Colonia").val();
        var Ciudad = $("#Ciudad").val();
        var Estado = $("Estado").val();
        var Fax = $("#Fax").val();
        var rfc = $("#rfc");
        console.log(NombreEncuestador, Empresa, Direccion, Colonia, Ciudad, Estado, Fax, rfc)

        $.ajax({
            method: "POST",
            url: "http://localhost:8000/DatosEncuestador",
            data ({
                NombreEncuestador = NombreEncuestador,
                Empresa = Empresa,
                Direccion = Direccion,
                Colonia = Colonia,
                Ciudad = Ciudad,
                Estado = Estado,
                Fax = Fax,
                rfc = rfc})
                
              }).done(function(data) {
                alert(data); // imprimimos la respuesta
              }).fail(function() {
                alert("Algo salió mal");
              }).always(function() {
                alert("Siempre se ejecuta")
              });


        })

    }
);