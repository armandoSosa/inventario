<%@ page import="com.redoaxaca.Persona" %>
<!DOCTYPE html>
<html>
	<head>		
	 <script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}"  type="text/javascript" charset="utf-8"></script>
	<script src="${resource(dir: 'js', file: 'jquery.maskedinput.min.js')}" type="text/javascript"></script>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
		 <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
		  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
		  
		  <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
		
		<g:javascript src="jcrop/jquery.Jcrop.min.js" />
		  
		 <link rel="stylesheet" href="${resource(dir: 'js', file: 'chosen/chosen.css')}" type="text/css"> 
		 <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.scrollTo.js')}"></script>
		<!--	  
		<script type="text/javascript">
		    $(function() {
		    	$.mask.definitions['~'] = "[+-]";        
		        $("#num1").mask("(999) 999-9999");		
		    });
	</script>-->
	
	<g:if test="${params.id}">	
		<script language="javascript">
		window.onload = function() {
			llamarInLine2();
		}
		</script>															
	</g:if>
	

	<script>
		function llamarInLine(){
			$("#formFoto").submit();						
			//$("#nuevaImagen").click();
		}

		function llamarInLine2(){
			//$("#formFoto").submit();						
			$("#nuevaImagen").click();
		}

		function validar(e, tipo) {
		    tecla = (document.all) ? e.keyCode : e.which;
		    if (tecla==8) return true;
		    if(tipo==1){
		    	patron =/\w/;
			} else if(tipo==2){
				patron =/\d/;
			} else if(tipo==3){
				patron =/[A-Za-zñÑ\s]/;
			}
		    te = String.fromCharCode(tecla);		    
		    return patron.test(te);
		} 
	
		/*$(function() {
	        $.mask.definitions['~'] = "[+-]";        
	        $("#num0").mask("aaaa999999***", { placeholder: " " });		
	        $("#curp").mask("aaaa999999********", { placeholder: " " });
	    });*/
	    $.mask.definitions['~'] = "[+-]";
	    $("#prueba").mask("(999) 999-9999");
	</script>	
	<script type="text/javascript">
		jQuery(function($){
			
		    // Create variables (in this scope) to hold the API and image size
		    var jcrop_api,
		        boundx,
		        boundy,

		        // Grab some information about the preview pane
		        $preview = $('#preview-pane'),
		        $pcnt = $('#preview-pane .preview-container'),
		        $pimg = $('#preview-pane .preview-container img'),

		        xsize = $pcnt.width(),
		        ysize = $pcnt.height();
		    
		    console.log('init',[xsize,ysize]);
		    $('#imagen').Jcrop({
		    	bgOpacity: 0.4,
			    bgColor: 'black',
			    addClass: 'jcrop-normal',
			    setSelect: [ 0, 0, 200, 300 ],
		      onChange: updatePreview,
		      onSelect: updatePreview,
		      aspectRatio: xsize / ysize
		    },function(){
		      // Use the API to get the real image size
		      var bounds = this.getBounds();
		      boundx = bounds[0];
		      boundy = bounds[1];
		      // Store the API in the jcrop_api variable
		      jcrop_api = this;

		      // Move the preview into the jcrop container for css positioning
		      $preview.appendTo(jcrop_api.ui.holder);
		    });

		    function updatePreview(c)
		    {
		      if (parseInt(c.w) > 0)
		      {
		        var rx = xsize / c.w;
		        var ry = ysize / c.h;

		        $pimg.css({
		          width: Math.round(rx * boundx) + 'px',
		          height: Math.round(ry * boundy) + 'px',
		          marginLeft: '-' + Math.round(rx * c.x) + 'px',
		          marginTop: '-' + Math.round(ry * c.y) + 'px'
		        });
		      }
		    };

		  });
							

		</script>
		<style type="text/css">

			/* Apply these styles only when #preview-pane has
			   been placed within the Jcrop widget */
			.jcrop-holder #preview-pane {
			  display: block;
			  position: absolute;
			  z-index: 2000;
			  top: 0px;
			  right: -280px;
			  padding: 6px;
			  border: 1px rgba(0,0,0,.4) solid;
			  background-color: white;
			
			  -webkit-border-radius: 6px;
			  -moz-border-radius: 6px;
			  border-radius: 6px;
			
			  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			}
			
			/* The Javascript code will set the aspect ratio of the crop
			   area based on the size of the thumbnail preview,
			   specified here */
			#preview-pane .preview-container {
			  width: 200px;
			  height: 300px;
			  overflow: hidden;
			}
		
		</style>
			  		
		<!-- Elementos para validacion pop up animado -->
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}"/>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/validacion', file: 'funciones.js')}"></script>
		<script>
			$(document).ready(function() {
				
				$('.tooltip').tooltipster({
				    animation: 'grow',
				    trigger: 'custom',
				    position: 'right'
				});
			});
			
			function mostrarAlerta(elemento, mostrar, mensaje) {
				if (mostrar) {					
					$('#'+elemento).tooltipster('update', mensaje);
					$('#'+elemento).tooltipster('show');
				} else {					
					$('#'+elemento).tooltipster('hide');
				}
			}

			function mostrarValidacion(elemento, mensaje) {
				if (mensaje!=true) {									
					$('#'+elemento).tooltipster('update', mensaje);
					$('#'+elemento).tooltipster('show');
				} else {								
					$('#'+elemento).tooltipster('hide');
				}
			}

			function ocultarValidacion(elemento) {										
				$('#'+elemento).tooltipster('hide');				
			}

			function ocultarValidaciones(){
				inputs = document.getElementsByTagName('input');
				
				for (index = 0; index < inputs.length; ++index) {
					ocultarValidacion(inputs[index].id);
				}				
			}
		</script>
		
		<!--Termina: Elementos para validacion pop up animado -->
		
		<script type="text/javascript">
	function validarTecleo(e, tipo, id) {
		var pasa = validarInput(e, tipo)		
		mostrarValidacion(id, validarInput(e, tipo));
		if(pasa!=true){
			pasa=false;
		}
		return pasa;
	}

	function validarString(e, id, longitudMaxima, valor) {
		var tipo=1;
		if(valor.length<4){
			tipo = 5;
		}else if(valor.length>=4 && valor.length<10){
			tipo = 6;
		}			
		var pasa = validarInput(e, tipo);	
		mostrarValidacion(id, validarInput(e, tipo));
		if(pasa!=true){
			pasa=false;
		}
		/*
		if(valor.length>=longitudMaxima-1){
			mostrarValidacion(id, "completo: ");			
		}*/
		
		return pasa;
	}

	

	function validarEnvio() {
		var container, inputs, index, fin, municipioSelecionado, rfcValido, curpValida, rfc, curp;
		fin = false;
		municipioSelecionado = false;
		rfcValido = false;
		curpValida = false;
		// Get the container element
		container = document.getElementById('formPersona');

		// Find its child `input` elements
		inputs = container.getElementsByTagName('input');
		selects = container.getElementsByTagName('select');
		
		for (index = 0; index < inputs.length; ++index) {
		    if(inputs[index].id!="" && inputs[index].type!="hidden" && inputs[index].id!="noInterior" && inputs[index].value == ""){		    	
			    if(!fin){				    			    				    
			    	mostrarValidacion(inputs[index].id, "Debe completar este campo");	
			    	$.scrollTo('#'+inputs[index].id,800);		    		    
			    	fin = true;			    			    	
				}			    		
		    }
		    if(inputs[index].id=="curp" && !fin){
				curpValida = validarCURP(inputs[index].value);
				curp = inputs[index].value;
				curp = curp.substring(0, 10);
				if(!curpValida){
					mostrarValidacion(inputs[index].id, "La CURP no es valida");
					$.scrollTo('#'+inputs[index].id,800);
					fin = true;
				}											
			}
		    if(inputs[index].id=="rfc" && !fin){
				rfcValido = validarRFC(inputs[index].value);
				rfc = inputs[index].value;
				rfc = rfc.substring(0, 10);
				if(!rfcValido){
					mostrarValidacion(inputs[index].id, "El RFC no es valido");
					$.scrollTo('#'+inputs[index].id,800);
					fin = true;				
				}											
			}
		    if(!fin && inputs[index].id=="email"){
			    if(!validarCorreo(inputs[index].value)){
			    	mostrarValidacion(inputs[index].id, "El Email no es valido");
			    	$.scrollTo('#'+inputs[index].id,800);
			    	fin = true;
				}				
			}			
		}

		if(rfc != curp){
			mostrarValidacion("curp", "El RFC o la CURP no son válidos");
	    	$.scrollTo('#'+"curp",800);
	    	fin = true;
		}		
		
		for (index = 0; index < selects.length; ++index) {
			if(selects[index].id=="municipio"){
				municipioSelecionado = true;
			}
		}		
				
		if (!fin && curpValida && rfcValido){
			if(!municipioSelecionado){
				alert("Este estado no tiene municipios registrados, seleccione otro estado o ingrese municipios para este estado");				
			}else{
				$('#formPersona').submit();
				//alert("enviado");
			}						
		}
	}	
</script>


<script type="text/javascript">
<!--
num=0;

var datos = "${com.redoaxaca.TipoTelefono.list()}";
var fin = datos.length - 1;
datos = datos.substring(1,fin);
var myarray = datos.split(",");

var nombre="fil";

function crear(obj) {
  num++;
  document.formPersona.cantidad.value = num;
  var fi = document.getElementById('fiel'); // 1
  var contenedor = document.createElement('div'); // 2
  fi.appendChild(contenedor);
  
  contenedor.id = 'div'+num;

  var ele = document.createElement('input'); 
  ele.type = 'text'; // 6
  ele.id = 'num'+num.toString();
  ele.name='num'+num.toString();
  ele.value="campo"+num.toString();
  ele.onkeypress="return validarTecleo(event, 2, this.id)";
  ele.class="tooltip";
  ele.maxlength="10"; 
  
  contenedor.appendChild(ele); // 7
  
  var espacio = document.createTextNode("\u00a0");
  var espacio2 = document.createTextNode("\u00a0");
  contenedor.appendChild(espacio);
  contenedor.appendChild(espacio2);
  
    var ele2 = document.createElement('select');
	ele2.type = 'select';
	ele2.name = 'tipo'+num; // 8
	ele2.id='tipo'+num;

	for (i=0; i<myarray.length; i++) {
		opt = document.createElement('option');
		opt.value = myarray[i];
		opt.innerHTML = myarray[i];
		ele2.appendChild(opt);
	}	
	
	contenedor.appendChild(ele2);
  
  espacio3 = document.createTextNode("\u00a0");
  espacio4 = document.createTextNode("\u00a0");
  contenedor.appendChild(espacio3);
  contenedor.appendChild(espacio4);
  
	
  var ele3 = document.createElement('input'); // 5
  ele3.type = 'button'; // 6
  ele3.value = 'Quitar'; // 8
  ele3.name = 'div'+num; // 8
  ele3.onclick = function () {borrar(this.name)} // 9
  
  contenedor.appendChild(ele3); // 7

}

function borrar(obj) {
  fi = document.getElementById('fiel'); // 1 
  fi.removeChild(document.getElementById(obj)); // 10
}

--> 
</script>	
	</head>
	<body>
		<a href="#create-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="empleados">Lista de Empleados</g:link></li>
			</ul>
		</div>
		<div id="create-persona" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			
			<g:hasErrors bean="${personaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
				<g:if test="${error.field == 'curp'}">
					Esta CURP ya está siendo ocupada por otra persona
				</g:if>
				<g:if test="${error.field == 'rfc'}">
					Este RFC ya está siendo ocupado por otra persona
				</g:if>
				<g:if test="${error.field == 'numeroEmpleado'}">
					El número de empleado ya existe, seleccione otro número
				</g:if>			
				</li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:hasErrors bean="${direccionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${direccionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:hasErrors bean="${telefonoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${telefonoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:hasErrors bean="${puestoPersonaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${puestoPersonaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<br><br>			
			<fieldset>			
			<legend>Información personal</legend>
			<g:form name="formFoto"  action="save_foto" controller="foto" enctype="multipart/form-data">				
				<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'foto', 'error')} required">
					<label for="foto">
						<g:message code="foto.foto.label" default="Foto" />						
					</label>
					<input type="file" id="foto" name="foto" value="${params.id}" onchange="llamarInLine();"/>
				</div>
				<g:submitButton style="display:none;" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
			</fieldset>
			<g:form name="formPersona" action="save_persona"  enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="forma2"/>
				</fieldset>
				<fieldset class="buttons">
					<a  class="save" onClick="validarEnvio()">Crear</a>
					<g:submitButton name="create" class="save" value="Insertar" />					
				</fieldset>
			</g:form>
			
			
			
		</div>			
		
		<!-- hidden inline form -->
		<div id="inline4">		
			<div id="create-estado" class="content scaffold-create" role="main">
				<h1>Nuevo Estado</h1>
				<g:hasErrors bean="${estadoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${estadoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form action="save_estado" >
					<fieldset class="form">
						<g:render template="../estado/forma"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
		
		<!-- hidden inline form -->
		<div id="inline3">		
			<div id="create-estado" class="content scaffold-create" role="main">
				<h1>Nuevo Tipo Telefono</h1>
				<g:form action="save_tipotelefono_persona" controller="tipoTelefono">
				<fieldset class="form">
					<g:render template="../tipoTelefono/forma"/>					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />					
				</fieldset>
			</g:form>
			</div>
		</div>
		
		<!-- buscar tipo -->
		
		<div id="inline" class="inline">
			<div id="create-tipo" class="content scaffold-create" role="main">
				<h2>Buscar Estado</h2>
				<br>
				<h3>Ingrese el nombre del Estado a buscar</h3>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${tipoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${tipoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				
				<br>
				<label for="valorABuscar"> Estado: <span class="required-indicator">*</span>
				</label>
				<g:textField name="valorABuscar" required="" value=""
				    onkeyup="${remoteFunction(
					   controller: 'estado',
					   action: 'buscarEstado',
                       update: 'estados',
                       params: '\'estado=\' + this.value')}"/> 
				<div id="estados"></div>
			</div>
		</div>
		
		<g:if test="${params.id}">
		<!-- hidden inline form -->
		<div id="inline100">		
			<div id="create-imagen" class="content scaffold-create" role="main">
				<h2>Imagen de Empleado</h2>
				<br><br>
				<g:uploadForm action="modificar_foto" controller="foto" >			        
			        <div id="preview-pane">
					    <div class="preview-container" >
					      <img src="<g:createLink controller='persona' action='renderImage' id="${params.id}"/>" class="jcrop-preview" alt="Preview"/>
					      
					    </div>
					  </div>
					<input id="idfoto" name="idfoto" type="hidden" value="${params.id}" />
			        <input type="submit" />
			    </g:uploadForm>
				<g:form action="save_tipotelefono_persona" controller="tipoTelefono">
				<fieldset class="form">											
					<img id="imagen" class="imagenPerfil" src="<g:createLink controller='persona' action='renderImage' id="${params.id}" />" width="400" height="400"/>
					<div id="preview-pane">
					    <div class="preview-container" >
					      <img src="<g:createLink controller='persona' action='renderImage' id="${params.id}"/>" class="jcrop-preview" alt="Preview" />
					    </div>
					  </div>	
					<br><br><br><br>
				</fieldset>
				<fieldset class="buttons">					
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />					
				</fieldset>
			</g:form>
			</div>
		</div>
		
		</g:if>
		
		<a id="nuevaImagen" class="modalbox" href="#inline100" style="display:none;"></a>
		
		<!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    <g:render template='phone' model="['phone':null,'i':'_clone','hidden':true]"/>
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    

    
    
    
  <!-- basic fancybox setup -->
		<script type="text/javascript">
			$(document).ready(function() {
				$(".modalbox").fancybox();
			});
		</script>
		
		
		
		
  
	</body>
</html>
