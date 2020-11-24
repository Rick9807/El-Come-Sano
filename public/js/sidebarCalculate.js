const formulaTMB = (pesoS, edadS, sexo) => {
    let peso = parseFloat(pesoS);
    let edad = parseInt(edadS);
    
    let tmb = 0;
      // Sexo positivo = mujer
    if ( sexo ){
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
    const sexo = document.querySelector('input[name="sexo"]:checked').value;
    const tmb = (sexo === 'femenino') ? formulaTMB(peso, edad, true) : formulaTMB(peso, edad, false);
    
    const tmbDiv = document.getElementById('tmbCalculo');
    const calTemplate = `
    <h6 class="text-light mr-1">${tmb}</h6>
    `;
    tmbDiv.innerHTML = calTemplate;
  }
  document.getElementById('btnCalculo').addEventListener('click', calcular);