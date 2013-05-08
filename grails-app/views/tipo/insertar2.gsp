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
	function validarEnvio() {
		//alert($('#descripcion').val());
		
		alert(abecedario($('#descripcion').val()));
	}

	function abecedario(dato) {
		var todosLetras=true;
		for(var i=0; i<dato.length; i++) {
			if (dato.charCodeAt(i)<97 || dato.charCodeAt(i)>122) {
				todosLetras=false;
			}
		}
		return todosLetras;
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
		<g:form id="formTipo" action="save_tipo">
			<fieldset class="form">
				<g:render template="form4" />
			</fieldset>
			<fieldset class="buttons">
				<a name="create" class="save" onClick="validarEnvio()">Crear</a>
				<g:submitButton name="create" class="save"
					value="Crear" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
