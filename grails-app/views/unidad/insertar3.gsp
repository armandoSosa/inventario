<%@ page import="com.redoaxaca.Unidad"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'unidad.label', default: 'Unidad')}" />
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
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}" />
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>

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
					$('#unidad').tooltipster('show');
				} else {
					$('#'+elemento).tooltipster('hide');
				}
			}
		</script>

<!--Termina: Elementos para validacion pop up animado -->

<script type="text/javascript">
	function validarTecleo(e, tipo) {
		var pasa = validar(e, tipo);
		mostrarAlerta('unidad', !pasa, 'Solo se aceptan letras y números');
		return pasa;
	}

	function validarEnvio(e, tipo) {
		if ($('#unidad').val().length<3){
			mostrarAlerta('unidad', true, 'La descripción debe ser de al menos 3 caracteres');
		} else {
			//debemos verificar que el tipo no exista
			var cadenaValores="unidadTexto="+$("#unidad").val();
			${remoteFunction (controller:'unidad', action:'verificarSiExiste', params: 'cadenaValores', update: 'verificarSiExiste')}
			//$('#formTipo').submit();
		}
	}

	
	
	
</script>
</head>
<body>
	<g:render template="verificarExistencia" />
	<a href="#create-unidad" class="skip" tabindex="-1"><g:message
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
	<div id="create-unidad" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${unidadInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${unidadInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form id="formunidad" name="formunidad" action="save_unidad">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
					<label for="unidad"> <g:message code="unidad.unidad.label"
							default="Unidad" />

					</label>
					<g:textField id="unidad" name="unidad" value="${unidadInstance?.unidad}"
						onkeypress="return validarTecleo(event, 8)" required=""
						class="tooltip" title="" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<a class="save" onClick="validarEnvio()">Crear</a>
			</fieldset>
		</g:form>
	</div>
</body>
</html>



