$(document).ready(function () {
    $("#btn-guardar").click(function(){
        // let request = $("#info-trab").serialize();
        // console.group('datos de la encuesta');
        // console.log(request)
        // alert("si esta funcionando")

        $.ajax({
          url: "/datos_trabajador",
          data: $("#info-trab").serialize(),
          type: "POST",
          success: function(res){
              //Código a ejecutar si la petición se ejecutó correctamente
              console.log('Todo funciono', res)
          },
          error: function(){
              //Código a ejecutar si hubo un error al ejecutar la petición
          }
        
        });


      });
});



/*

insert into imss_035.encuestado 
(Sexo, Edad, Estado_Civil, Niveles_Estudios,Ocupación, Departamento, Tipo_Puesto, Tipo_Personal, 
Tipo_Contratacion, Tipo_Jornada, Rotacion_Turnos, Experiencia_Actual, Experiemcia_Laboral)
values()

*/


