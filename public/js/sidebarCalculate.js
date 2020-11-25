function createCookie(name, value, days) { 
    var expires; 
      
    if (days) { 
        var date = new Date(); 
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000)); 
        expires = "; expires=" + date.toGMTString(); 
    } 
    else { 
        expires = ""; 
    } 
      
    document.cookie = escape(name) + "=" +  
        escape(value) + expires + "; path=/"; 
} 

const formulaTMB = (pesoS, edadS, sexo) => {
    let peso = parseFloat(pesoS);
    let edad = parseInt(edadS);
    
    let tmb = 0;
      // Sexo positivo = mujer
    if ( sexo ){
        if (edad == 18) {
            tmb = (12.2 * peso) + 746; // 18 años
        }
        if ( edad > 18  && edad < 31) { // 19 a 30 años 
            tmb = (14.7 * peso) + 496;
        }
        else if( edad > 30  && edad < 61){ // 31 a 60 años
            tmb = (8.7 * peso) + 829;
        }
        else if ( edad > 60 ) { // Mayor a 60 años
            tmb = (10.5 * peso) + 596;
        }
    }
    else { // Sexo negativo = hombre
        if (edad == 18) {
            tmb = (17.5 * peso) + 651; // 18 años
        }
        if ( edad > 18  && edad < 31) { // 19 a 30 años 
            tmb = (15.3 * peso) + 679;
        }
        else if( edad > 30  && edad < 61){ // 31 a 60 años
            tmb = (11.6 * peso) + 879;
        }
        else if ( edad > 60 ) { // Mayor a 60 años
            tmb = (13.5 * peso) + 487;
        }
    }
    return tmb;
  }
  const calcular = () => {
    const edad = document.getElementById('edadCalculo').value;
    const peso = document.getElementById('pesoCalculo').value;
    const sexo = document.querySelector('input[name="sexo"]:checked');
    const actividad = document.querySelector('input[name="actividad"]:checked');

    // No se toma el valor de los radio botones en la declaracion para comprobar si fueron seleccionados
    if (actividad == null || sexo == null || edad == '' || peso == '') {
        alert('Recuerde llenar todos los campos para calcular sus calorias.');
        return;
    }
        
    if (!(edad >= 18 && edad <= 100)) {
        alert('La edad no es una cantidad aceptada.');
        return;
    }
    if (!(peso >= 30 && peso <= 180)) {
        alert('El peso no es una cantidad aceptada.');
        return;
    }

    let tmb = (sexo.value === 'femenino') ? formulaTMB(peso, edad, true) : formulaTMB(peso, edad, false);

    switch (actividad.value) {
        case 'actividadMuyLigera':
            tmb *= 1.2;
            break;
        case 'actividadLigera':
            tmb *= 1.375;
            break;
        case 'actividadModerada':
            tmb *= 1.55;
            break;
        case 'actividadActiva':
            tmb *= 1.725;
            break;
        case 'actividadMuyActiva':
            tmb *= 1.9;
            break;
        default:
            alert('Error al seleccionar actividad');
            break;
    }
    
    createCookie("tmb", tmb.toString(), 1);
/*
    const tmbDiv = document.getElementById('tmbCalculo');
    const calTemplate = `
    <h6 class="text-light mr-1">${tmb.toFixed(3)}</h6>
    `;
    tmbDiv.innerHTML = calTemplate;
*/
    location.reload();
    alert('Datos agregados!\nCalorias recomendadas para mantener su peso:\n' + tmb.toFixed(3));
  }
  document.getElementById('btnCalculo').addEventListener('click', calcular);