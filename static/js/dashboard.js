$(document).ready(function () {
    //Ocultar botones de encuestas y jumbotron al inicio

    $("#btn-1").hide();
    $("#btn-2").hide();
    $("#btn-3").hide();
    $("#jum-muestra").hide();


    //FOn Click para realizar el muestreo
     $("#btn-muestra").on('click', function(){
         //OBTENER VALOR DE LA MUESTRA
         const numero_emp = parseInt($("#inp-muestra").val());
         const muestra = calculos_muestra(numero_emp);
         if(muestra){
             $("#cnt-muestra").html(`<p> Le tienes que alicar la encuesta a </p> <h1>${muestra}</h1>`);
             $("#jum-muestra").show();
         }

         console.log(muestra)

         if (numero_emp){
             if (numero_emp <= 15){
                 $("#btn-2").hide();
                 $("#btn-3").hide();
                 $("#btn-1").show();

             }
             if (numero_emp >= 16 && numero_emp <= 50){
                 $("#btn-1").hide();
                 $("#btn-3").hide();
                 $("#btn-2").show();

             }
             if (numero_emp >= 51){
                 $("#btn-1").hide();
                 $("#btn-2").hide();
                 $("#btn-3").show();

             }
             
         }

     });
    const calculos_muestra = (n)=> {
        let muestra= (0.9604*n)/(0.0025*(n-1)+0.9604)
        return Math.round(muestra)
    }
    
});
// $(document).ready(function(){
//     $("#btn-1").click(function(){
//         $(this.#modal1).modal('show');
//     });
// })