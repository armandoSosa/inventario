<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		<script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
		<g:javascript>
			var caracteristicasAgregadas=0;
			var unidadesAgregadas=0;
			var cadenaCaracteristica="";
			var cadenaValores='valor0=0';
			var numeros="";
		    var addCaracteristica = function()
		    {
		    	guardarSoloCaracteristica()
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax2', id:'2', update:'divUnidad'+session.numUnidades, params: 'cadenaCaracteristica')}
		    	unidadesAgregadas++;
		    };
		    
		    var selectCaracteristica = function()
		    {
		    	guardarSoloCaracteristica()
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax2', id:'1', update:'divUnidad'+session.numUnidades, params: 'cadenaCaracteristica')}
		    	unidadesAgregadas++;
		    };
		    
		    var agregarUnidad = function()
		    {
		    	guardarCaracteristicaYUnidad();
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax2', id:'3', update:'divUnidad'+session.numUnidades, params: 'cadenaCaracteristica')}
		    	unidadesAgregadas++;
		    };
		    
		    var submitCaracteristica = function()
		    {	
		    	parametrosCaracteristicas();
		    	caracteristicasAgregadas++;
		    	unidadesAgregadas++;
		    	${ remoteFunction (controller:'objeto', action:'save_caracteristica2', id:'4', update:'divplantilla1', params: 'cadenaCaracteristica')}
		    	$(inline2).fadeOut("fast", function(){
						$(this).before("Característica agregada correctamente");
						setTimeout("$.fancybox.close()", 1000);
						$("#inline2").html(html);
					});
		    };
		    
		    var submitObjeto = function()
		    {	
		    	cadenaValores=cadenaValores.replace("valor0=0", "valor0="+numeros)+"&noInventario="+$("#noInventario").val()+"&tipoPropiedad="+$("#tipoPropiedad").val();
		    	${ remoteFunction (controller:'objeto', action:'save_objeto', id:'5', params: 'cadenaValores', onLoaded='start()')}
		    };
		    
		    function generarCadenaValores(cadena){
		    	//alert($("#"+cadena).val());
		    	
		    	if (cadenaValores.indexOf(cadena) == -1) {//si no esta, se agrega
		    		cadenaValores+="&"+cadena+"="+$("#"+cadena).val();
		    		numeros+=cadena+",";
		    	}
			}
			
			function parametrosCaracteristicas(){
		    	cadenaCaracteristica='valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&caracteristica1="+$("#caracteristica"+caracteristicasAgregadas).val()+"&unidadTexto="+$("#unidad"+unidadesAgregadas).val()+"&tipo1="+$("#tipo1"+caracteristicasAgregadas).val();
			}

			function guardarSoloCaracteristica() {
				cadenaCaracteristica='valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&caracteristica1="+$("#caracteristica"+caracteristicasAgregadas).val();
			}
			
			function guardarCaracteristicaYUnidad() {
				cadenaCaracteristica='valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&caracteristica1="+$("#caracteristica"+caracteristicasAgregadas).val()+"&unidadTexto="+$("#unidadTexto"+unidadesAgregadas).val();
			}
			
			function reloadPage() {
				location.href='listadoPorTipo';
			}
			function start(){
			    timeout = setTimeout(reloadPage,1000);
			}
		</g:javascript>
	</head>
	<body>
		<a href="#create-objeto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listadoPorTipo"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-objeto" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${objetoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${objetoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save_objeto" >
				<fieldset class="form">
					<g:render template="forma2"/>
				</fieldset>
				<fieldset class="buttons">
					<a name="create" class="save" href="javascript:void(0)" onclick="submitObjeto();return false;">CrearObj</a>
					
				</fieldset>
			</g:form>
		</div>
		
		
		<!-- Agregar tipo de objeto -->
		<div id="inline">
			<div id="create-tipo" class="content scaffold-create" role="main">
				<h1>Nuevo Tipo</h1>
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
				<g:form action="save_tipo2" >
					<fieldset class="form">
						<g:render template="../tipo/forma2"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
		
		

		<!-- basic fancybox setup -->
		<script type="text/javascript">
			function validateEmail(email) { 
				var reg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				return reg.test(email);
			}
		
			$(document).ready(function() {
				$(".modalbox").fancybox();
				$("#contact").submit(function() { return false; });
		
				
				$("#send").on("click", function(){
					
				});
			});
		</script>
		
	</body>
</html>
