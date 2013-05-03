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
<script type="text/javascript">
			$(document).ready(function() {
				$(".modalbox").fancybox();
				
			});
			 var submitTipo = function() {
			    
			    	$(".error").remove();		
					if( $("#tipoTexto").val() == "" ){
						$("#tipoTexto").focus().after("<span class='error'>Ingrese una descripción</span>");
					} else if( $("#tipoTexto").val().length<3 ){
						$("#tipoTexto").focus().after("<span class='error'>La descripción debe ser de al menos 3 caracteres</span>");
					} else {
						//verificamos si ya existe ese tipo de objeto
						${ remoteFunction (controller:'tipo', action:'resultadoExistencia', id:'5', params: '\'tipoTexto=\' + \$(\'#tipoTexto\').val()', update:'divExistencia')}
					}
			 }
		</script>
</head>
<body>
	<a href="#create-tipo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-tipo" class="content scaffold-create" role="main">
		<h1>Crear Tipo de Objeto</h1>
		<g:form action="save">
			<fieldset class="form">
				<div id="create-tipo" class="content scaffold-create" role="main">
					<h2>Agregar tipo</h2>
					<br>
					<h3>Ingrese el nombre del tipo de objeto</h3>
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>

					<br> <label for="tipoTexto"> <g:message
							code="objeto.tipo.label" default="Tipo de objeto" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField id="tipoTexto" name="tipoTexto" required="" value="" />
					<br> <br> <br>
					
				</div>
			</fieldset>
			<fieldset class="buttons">
						<a name="create" class="save" href="javascript:void(0)"
							onclick="submitTipo();return false;">Crear</a>
					</fieldset>
		</g:form>
	</div>
</body>
</html>
