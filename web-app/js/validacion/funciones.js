$(document).ready(function () {
	var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
	$(".boton").click(function (){
		$(".error").remove();		
		if( $(".nombre").val() == "" ){
			$(".nombre").focus().after("<span class='error'>Ingrese su nombre</span>");
			return false;
		}else if( $(".email").val() == "" || !emailreg.test($(".email").val()) ){
			$(".email").focus().after("<span class='error'>Ingrese un email correcto</span>");
			return false;
		}else if( $(".asunto").val() == ""){
			$(".asunto").focus().after("<span class='error'>Ingrese un asunto</span>");
			return false;
		}else if( $(".mensaje").val() == "" ){
			$(".mensaje").focus().after("<span class='error'>Ingrese un mensaje</span>");
			return false;
		}
	});
	$(".nombre, .asunto, .mensaje").keyup(function(){
		if( $(this).val() != "" ){
			$(".error").fadeOut();			
			return false;
		}		
	});
	$(".email").keyup(function(){
		if( $(this).val() != "" && emailreg.test($(this).val())){
			$(".error").fadeOut();			
			return false;
		}		
	});
});

function validar(e, tipo) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true;
    if(tipo==1){
    	patron =/\w/; //letras y numeros
	}else if(tipo==2){
		patron =/\d/; //numeros; D, no acepta números
	}
	else if(tipo==3){
		patron =/[A-Za-zñÑ\s]/; //acepta todas las letras y espacios
	}
    te = String.fromCharCode(tecla);		    
    return patron.test(te);
} 

function validarInput(e, tipo) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true;
    if(tipo==1){
    	patron =/\w/; //letras y numeros
    	mensaje = "Solo se aceptan letras y numeros";
	}else if(tipo==2){
		patron =/\d/; //numeros; D, no acepta números
		mensaje = "Solo se aceptan numeros";
	}else if(tipo==3){
		patron =/[A-Za-zñÑ\s]/; //acepta todas las letras y espacios
		mensaje = "Solo se aceptan letras y espacios";
	}else if(tipo==4){
		patron =/[0-9A-Za-zñÑ\s]/; //acepta todas las letras y espacios
		mensaje = "Solo se aceptan letras y numeros";
	}else if(tipo==5){
		patron =/[A-Za-z]/; //acepta todas las letras
		mensaje = "El caracter debe ser una letra";
	}else if(tipo==6){
		patron =/\d/; //numeros; D, no acepta números
		mensaje = "El caracter debe ser un numero";
	}
    te = String.fromCharCode(tecla);
    if(!patron.test(te)){
    	return mensaje;
    }else{
    	return true;
    }    
} 

function validarLetrasConEspacio(letras){
	var sonSoloLetras = false;
	if(letras.match(/^[a-zA-Z\s]+$/)){
		sonSoloLetras = true;
	}
	return sonSoloLetras;
}

function validarLetras(letras){
	var sonSoloLetras = false;
	if(letras.match(/^[a-zA-Z]+$/)){
		sonSoloLetras = true;
	}
	return sonSoloLetras;
}

function validarNumeros(numeros){
	var sonSoloNumeros = false;
	if(numeros.match(/^(?:\+|-)?\d+$/)){
		sonSoloNumeros = true;
	}
	return sonSoloNumeros;
}

function validarCorreo(correo){
	var esCorreo = false;
	if(correo.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.([a-zA-Z]{2,4})+$/)){
		esCorreo = true;
	}
	return esCorreo;
}

function validarFocus(tipo, input, valor){
	if(tipo==1){
		if(!validarCURP(valor)){
			mostrarValidacion(input, "La CURP no es valida");
		}else{
			var anio = parseInt(valor.substring(8,10));
			if(anio<30){
				anio = anio+2000;
			}else{
				anio = anio+1900;
			}
			document.formPersona.fechaNacimientoP_year.value = anio
			document.formPersona.fechaNacimientoP_day.value = parseInt(valor.substring(4, 6)); 
			document.formPersona.fechaNacimientoP_month.value = parseInt(valor.substring(6,8));
			
		}
	}
	else if(tipo==2){
		if(!validarRFC(valor)){
			mostrarValidacion(input, "El RFC no es valido");
		}
	}
	else if(tipo==3){
		if(!validarLetrasConEspacio(valor)){
			document.getElementById(input).value = "";
		}
	}else if(tipo==4){
		if(!validarNumeros(valor)){
			document.getElementById(input).value = "";
		}
	}else if(tipo==5){
		if(!validarCorreo(valor)){
			mostrarValidacion(input, "El Email no es valido");
		}else{
			ocultarValidacion(input);
		}
	}
}

function validarFecha(txtDate){	
    var currVal = txtDate;
    if(currVal == '')
        return false;
    
    var rxDatePattern = /^(\d{1,2})(\d{1,2})(\d{2})$/; //Declare Regex
    var dtArray = currVal.match(rxDatePattern); // is format OK?
    
    if (dtArray == null) 
        return false;
    
    //Checks for dd/mm/yyyy format.
    dtDay = dtArray[1];
    dtMonth = dtArray[2];
    dtYear = dtArray[4];        
    
    if (dtMonth < 1 || dtMonth > 12) 
        return false;
    else if (dtDay < 1 || dtDay> 31) 
        return false;
    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31) 
        return false;
    else if (dtMonth == 2 && dtDay > 28) {         
        return false;
    }
    /*
    else if (dtMonth == 2) 
    {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay> 29 || (dtDay ==29 && !isleap)) 
                return false;
    }*/    
    return true;    
}


function validarRFC(rfc){
	var longitudRFC = 13, rfcValido = false;
	if(rfc.length==longitudRFC){			
		var letras = rfc.substring(0, 4);
		var numeros = rfc.substring(4, 10);				
		if(validarLetras(letras) && validarNumeros(numeros)){
			rfcValido = true;
		}												
	}
	return rfcValido;
}

function validarCURP(curp){
	var longitudCURP = 18, curpValida = false;
	if(curp.length==longitudCURP){
		var letras = curp.substring(0, 4);
		var numeros = curp.substring(4, 10);			 
		if(validarLetras(letras) && validarNumeros(numeros)){			
			if(validarFecha(numeros)){				
				curpValida = true;
			}			
		}			
	}
	return curpValida;
}
