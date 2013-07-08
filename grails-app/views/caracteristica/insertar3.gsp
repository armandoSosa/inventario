<%@ page import="com.redoaxaca.Caracteristica"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'caracteristica.label', default: 'Caracteristica')}" />
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
					$('#caracteristica').tooltipster('show');
				} else {
					$('#'+elemento).tooltipster('hide');
				}
			}
		</script>

<!--Termina: Elementos para validacion pop up animado -->

<script type="text/javascript">
	function validarTecleo(e, tipo) {
		var pasa = validar(e, tipo);

		mostrarAlerta('caracteristica', !pasa, 'Solo se aceptan letras y números');
		return pasa;
	}

	function validarEnvio(e, tipo) {
		if ($('#caracteristica').val().length<3){
			mostrarAlerta('caracteristica', true, 'La descripción debe ser de al menos 3 caracteres');
		} else {
			//debemos verificar que el tipo no exista
			var cadenaValores="caracteristicaTexto="+$("#caracteristica").val();
			${remoteFunction (controller:'caracteristica', action:'verificarSiExiste', params: 'cadenaValores', update: 'verificarSiExiste')}
			
			//$('#formTipo').submit();
		}
	}

	
	
	
</script>

</head>
<body>
	<g:render template="verificarExistencia" />
	<a href="#create-caracteristica" class="skip" tabindex="-1"><g:message
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
	<div id="create-caracteristica" class="content scaffold-create"
		role="main">
		<h1>
			<g:message code="Crear Característica" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${caracteristicaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${caracteristicaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form id="formcarac" name="formcarac" action="save_caracteristica">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
					<label for="caracteristica"> <g:message
							code="caracteristica.caracteristica.label"
							default="Característica" />

					</label>
					<g:textField id="caracteristica" name="caracteristica"
						value="${caracteristicaInstance?.caracteristica}"
						style='text-transform:uppercase;'
						onkeypress="return validarTecleo(event, 8)" required=""
						class="tooltip" title="" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<a class="save" onClick="validarEnvio()">Crear</a>
				<g:link name="cancel" class="cancelar" action="menu">Cancelar</g:link>
			</fieldset>
		</g:form>
	</div>



</body>
</html>
