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
		
	<g:if test="${params.fotoid}">	
		<script language="javascript">
		window.onload = function() {
			$("#nuevaImagen").click();
		}
		</script>															
	</g:if>
	

	<script>
	jQuery(function($) {
		
		});
	
		function llamarInLine(){
			$("#formFoto").submit();						
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
	</script>	
	
	<!--  Inicia JCROP - Recortar imagen -->	
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
		      $('#x1').val(c.x);
		      $('#y1').val(c.y);
		      $('#x2').val(c.x2);
		      $('#y2').val(c.y2);
		      $('#w').val(c.w);
		      $('#h').val(c.h);
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
	<!--  Termina JCROP - Recortar imagen -->	
	  		
		<!-- Elementos para validacion pop up animado -->
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}"/>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/validacion', file: 'funciones.js')}"></script>
		<script>
			$(document).ready(function() {				
				$('#departamento_chzn').addClass('tooltip');				
				$('#estado_chzn').addClass('tooltip');				
				
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
		var pasa = validarInput(e, tipo);		
		mostrarValidacion(id, validarInput(e, tipo));
		if(pasa!=true){
			pasa=false;
		}
		return pasa;
	}

	function validarNumeroEmpleado(input, valor){
		if(!validarNumeros(valor)){
			document.getElementById(input).value = "";
		}else{
			${remoteFunction(
				controller: 'persona',
				action:'esNumeroEmpleadoValido',				
				params: '\'numero=\'+ valor',
				update: 'numeroEmpleadoValido',
				onComplete: 'validarNumeroEmpleadoAlerta();'
			)}
		}
	}

	function validarCurpBlur(input, valor){
		if(!validarCURP(valor)){		
			mostrarValidacion(input, "La CURP no es válida");
		}else{
			${remoteFunction(
					controller: 'persona',
					action:'esCurpRepetida',				
					params: '\'curp=\'+ valor.toUpperCase()',
					update: 'curpValida',
					onComplete: 'validarCurpAlerta();'
				)}				
			var anio = parseInt(valor.substring(4, 6));
			if(anio<30){
				anio = anio+2000;
			}else{
				anio = anio+1900;
			}
			document.formPersona.fechaNacimientoP_year.value = anio
			document.formPersona.fechaNacimientoP_day.value = parseInt(valor.substring(8,10)); 
			document.formPersona.fechaNacimientoP_month.value = parseInt(valor.substring(6,8));
			document.formPersona.rfc.value = valor.substring(0, 10)
		}
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
		return pasa;
	}

	function validarEnvio() {
		var container, inputs, index, fin, municipioSelecionado, puestoSeleccionado, rfcValido, curpValida, rfc, curp;
		fin = false;
		municipioSelecionado = false;
		puestoSeleccionado = false;
		rfcValido = false;
		curpValida = false;
		
		// Obtener el contenedor del form
		container = document.getElementById('formPersona');

		// Obtener todos los inputs y selects
		inputs = container.getElementsByTagName('input');
		selects = container.getElementsByTagName('select');		

		//Validar que no se hayan dejado inputs vacios
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
				curp.toUpperCase();
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
				rfc.toUpperCase();
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

		//Validar número de empleado	
		if (!validarNumeroEmpleadoAlerta()){
			$.scrollTo('#'+"numeroEmpleado",800);
			fin = true;
		}	

		//Verificar si la curp y el rfc son válidos
		if(rfc != curp){
			mostrarValidacion("curp", "El RFC o la CURP no son válidos");
	    	$.scrollTo('#'+"curp",800);
	    	fin = true;
		}

		//Validar curp repetida
		if(!validarCurpAlerta()){
			$.scrollTo('#'+"curp",800);
			fin = true;
		}	

		//Validar telefono repetido
		var numeros = new Array();
		var cont = 0;
		for (index = 0; index < inputs.length; ++index) {
			if(inputs[index].id.substring(0, 3)=="num" && inputs[index].id!="numeroEmpleado"){
				//alert(inputs[index].id.substring(0, 3)+"."+inputs[index].id);				    			    				    
		    	numeros[cont] = index;	
		    	cont++;		    			    	
			}
		}	
		for (i = 0; i < numeros.length; i++) {
			for (j = 0; j < numeros.length; j++) {
				if(!fin && i!=j && inputs[numeros[i]].value==inputs[numeros[j]].value){					
					mostrarValidacion(inputs[numeros[i]].id, "El número está repetido");
				   	$.scrollTo('#'+inputs[numeros[i]].id,800);
					fin = true;
				}
			}								
		}
		
		//Verificar la selección de municipios y puestos
		for (index = 0; index < selects.length; ++index) {			
				if(selects[index].id=="municipio"){					
					municipioSelecionado = true;					
				}
				if(selects[index].id=="puesto"){									
					puestoSeleccionado = true;					
				}
							
		}		
		if(!fin){
			if(!puestoSeleccionado){		
				mostrarValidacion("departamento_chzn", "Debe seleccionar un departamento que contenga puestos");
				fin = true;
			}else if(!municipioSelecionado){				
				mostrarValidacion("estado_chzn", "Debe seleccionar un estado que contenga municipios");
				fin = true;							
			}
		}		

		//Enviar formulario
		if (!fin && curpValida && rfcValido){			
			$('#formPersona').submit();								
		}
	}	
</script>


<script type="text/javascript">
<!--
<g:if test="${personaInstance?.telefonos}">
num=${personaInstance?.telefonos?.size()};
</g:if>
<g:else>
num=0;
</g:else>

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
  ele.maxLength="10"; 
  ele.onkeypress = function(event){
	  return validarTecleo(event, 2, this.id);
   };  
  ele.onBlur = function(){
	  validarFocus(5, this.id, this.value);
   };
  ele.setAttribute('class', 'tooltip');   
    
  contenedor.appendChild(ele); // 7
  
  var espacio = document.createTextNode("\u00a0");
  var espacio2 = document.createTextNode("\u00a0");
  contenedor.appendChild(espacio);
  contenedor.appendChild(espacio2);
  
  var ele2 = document.createElement('select');
  ele2.type = 'select';
  ele2.name = 'tipo'+num; // 8
  ele2.id='tipo'+num;
  <%
	com.redoaxaca.TipoTelefono.list().eachWithIndex(){ tp, i ->
		%>
		opt = document.createElement('option');
		opt.value = <%=tp.id%>;
		opt.innerHTML = myarray[<%=i%>];
		ele2.appendChild(opt);		
		<%
	}
	%>
	
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
		<g:render template="numeroEmpleado"></g:render>
		<g:render template="mensajeCurp"></g:render>
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
				<g:elseif test="${error.field == 'rfc'}">
					Este RFC ya está siendo ocupado por otra persona
				</g:elseif>
				<g:elseif test="${error.field == 'numeroEmpleado'}">
					El número de empleado ya existe, seleccione otro número
				</g:elseif>	
				<g:else>
					El número de teléfono es inválido
				</g:else>		
				</li>				
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<br><br>			
			<fieldset>			
			<legend>Información personal</legend>			
			<g:if test="${!params.idfoto}">
				<g:render template="../foto/formFoto" model="['id':1, 'action':'save_foto']"></g:render>
			</g:if>
			<g:else>								
				<div id="fotoDiv" class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'foto', 'error')} required">
					<g:form name="formFoto"  action="save_foto" controller="foto" id="1" enctype="multipart/form-data">										
						<img id="imagenP" height="300px;" width="200px;" class="imagenPerfil" src="<g:createLink controller='persona' action='renderImage' id="${params.idfoto}" />" style="margin-left:13em;"/>						
						<br>
						<label for="foto">
							Cambiar imagen						
						</label>
						<input type="file" id="foto" name="foto" value="${params.fotoid}" onchange="llamarInLine();"/>
						<g:remoteLink update="fotoDiv" action="quitar" controller="foto" id="${params.idfoto}">Quitar</g:remoteLink>												
						<g:submitButton style="display:none;" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</g:form>
				</div>				
											
			</g:else>
			</fieldset>
			<g:form name="formPersona" action="save_persona" enctype="multipart/form-data">
				<fieldset class="form">
					<g:set var="index_direccion" value="${0}" />										
					<g:render template="forma2"/>
				</fieldset>
				<fieldset class="buttons">
					<a  class="save" onClick="validarEnvio()">Crear</a>
					<g:link name="cancel" class="cancelar" action="empleados">Cancelar</g:link>									
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
		
		<g:if test="${params.fotoid}">
		<!-- hidden inline form -->
		<div id="inline100">		
			<div id="create-imagen" class="content scaffold-create" role="main">
				<h2>Imagen de Empleado</h2>
				<br><br>				
				<g:form id="formFoto" action="modificar_foto" controller="foto">
				<fieldset class="form">
					<div style="max-height:360px; max-width:100px;">											
					<img id="imagen" class="imagenPerfil" style="max-height:400px; max-width:500px;" src="<g:createLink controller='persona' action='renderImage' id="${params.fotoid}" />"/>
					</div>
					<div id="preview-pane">
					    <div class="preview-container" >
					      <img id="imagenRecortada" name="imagenRecortada" src="<g:createLink controller='persona' action='renderImage' id="${params.fotoid}"/>" class="jcrop-preview" alt="Preview" />
					    </div>
					  </div>
					  <g:hiddenField id="idfoto" name="idfoto" value="${params.fotoid}"/>
					  <g:hiddenField id="x1" name="x1"/>
					  <g:hiddenField id="y1" name="y1"/>
					  <g:hiddenField id="x2" name="x2"/>
					  <g:hiddenField id="y2" name="y2"/>
					  <g:hiddenField id="w" name="w"/>
					  <g:hiddenField id="h" name="h"/>
						<br> 
					
				</fieldset>
				<fieldset class="buttons">											
					<g:submitButton name="create" class="save" value="Recortar" />													
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
