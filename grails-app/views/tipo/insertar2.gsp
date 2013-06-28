<%@ page import="com.redoaxaca.Tipo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'tipo.label', default: 'Tipo')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<link rel="stylesheet"
	href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}"
	type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"
	type="text/css">
<script type="text/javascript"
	src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
	<script type="text/javascript"
	src="${resource(dir: 'js', file: 'validacion/funciones.js')}"></script>
	
	
	

	
	
	<!-- Elementos para validacion pop up animado -->
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}"/>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>

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
					$('#descripcion').tooltipster('show');
				} else {
					$('#'+elemento).tooltipster('hide');
				}
			}
		</script>
		
		<!--Termina: Elementos para validacion pop up animado -->
	
	
	
		
		
	
	
<script type="text/javascript">
	function validarTecleo(e, tipo) {
		var pasa = validar(e, tipo);
		mostrarAlerta('descripcion', !pasa, 'Solo se aceptan letras y números');
		return pasa;
	}

	function validarEnvio(e, tipo) {
		if ($('#descripcion').val().length<3){
			mostrarAlerta('descripcion', true, 'La descripción debe ser de al menos 3 caracteres');
		} else {
			//debemos verificar que el tipo no exista
			var cadenaValores="tipoTexto="+$("#descripcion").val();
			${remoteFunction (controller:'tipo', action:'verificarSiExiste', params: 'cadenaValores', update: 'verificarSiExiste')}
			
			//$('#formTipo').submit();
		}
	}

	
	
	
</script>
</head>
<body>
	<g:render template="verificarExistencia" />
	
	<a href="#create-tipo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="menu">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-tipo" class="content scaffold-create" role="main">
		<h1>Crear Tipo de Objeto</h1>
		<g:form id="formTipo" name="formTipo" action="save_tipo">
			<fieldset class="form">
				<g:render template="form4" />
			</fieldset>
			<fieldset class="buttons">
				<a  class="save" onClick="validarEnvio()">Crear</a>
				<g:link name="cancel" class="cancelar" action="menu">Cancelar</g:link>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
