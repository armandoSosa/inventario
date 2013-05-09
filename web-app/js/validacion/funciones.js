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