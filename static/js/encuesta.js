$(document).ready(function(){

    let SetItem = async (key, obj) =>{
        localStorage.setItem(key, JSON.stringify(obj));
    }

    $("#btn-siguiente").click(function () {	
        
    var respuestas = [];
    var preguntas = [];
    var resultados = {}

        
        
        /*

        P --> <div> <p id="pregunta">  "Texto de la pregunta "</p></div>
        
        */
        let preguntasText = document.querySelectorAll("p");


        /*
            1-. validar que dentro del array de respuestas
            no se encuentre un SI
                SI ENCONTRAMOS UN SI, DEBEMOS DE SEGUIR CON 
                LA SIGUIENTE SECCION DE LA ENCUESTA.
                SI NO ENCONTRAMOS EL SI, RETORNAMOS AL API
                ALGO, PARA AVISARLE QUE NO DEBE SEGUIR CON LA 
                ENCUESTA

            FLOW:
            OBTENER LOS DATOS ---> VALDIAMOS QUE NO HAYA UN SI
            ---> SI HAY UN SI -->  CREAMOS EL OBJETO DE LOCALSTORAGE
            Y AHÍ ALMACENAMOS LAS PREGUNTAS Y LAS RESPUESTAS DE LA PRIMER
            TANDA ---> RETORNAMOS LA SECCIÓN AL API PARA QUE NOS ENVIÉ LA SIGUIENTE 
            TANDA DE PREGUNTAS --> HACEMOS ESTO EN CADA SECCIÓN --> ESPERAMOS A QUE EL USUARIO
            TERMINE LA ENCUESTA Y AL FINAL ENVIAMOS ESOS DATOS AL API. 


            OBTENER LOS DATOS ---> VALDIAMOS QUE NO HAYA UN SI
            ---> SI NO HAY UN SI --> NO CREAMOS LOCAL STORAGE 
            -->  ENVIAMOS UN ALERT EN LA WEB PARA AVISAR AL USUARIO
            QUE NO DEBE CONTINUAR CON LAS SIGUIENTES PREGUNTAS --> HACEMOS
            LA PETICION AL API PARA GUARDAR ESAS PREGUNTAS, HASTA DONDE EL USARIO LLEGO
 
        */

        $("input[type=radio]:checked").each(function(){
            //cada elemento seleccionado
            console.log('si esta entrando')
            console.log($(this).val());
            respuestas.push($(this).val())
        });

        preguntasText.forEach((pregunta, index) =>{

            preguntas.push(pregunta.outerText);
           
        })
        //console.log(resultados)


        const seccion = $("#seccion").text();

    //     // console.log('Si esta entrando', seccion)
    //     // SetItem("formData", data)
    //     // .then(res => console.log(JSON.parse(localStorage.getItem("formData"))))
    //     // .catch(err => console.log(err))
  




        



        $.ajax({
            method: "POST",
            url: "http://localhost:8000/seccion",
            data: {'preguntas': [...preguntas], 
                   'respuestas':[...respuestas], 
                    seccion 
                },
            success:function(res){
                $('body').html(" ")
                $('body').append(res);
           }
        
        });
        

    });

});