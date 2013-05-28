<%@ page import="com.redoaxaca.Municipio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
	</head>
	<body>
		<a href="#create-municipio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="menu">Lista de Municipios</g:link></li>
			</ul>
		</div>
		<div id="create-municipio" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${municipioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${municipioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save_municipio" >
				<fieldset class="form">
					<g:render template="forma"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		
		
		<!-- hidden inline form -->
		<div id="inline">
		
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

		<!-- basic fancybox setup -->
		<script type="text/javascript">
			$(document).ready(function() {
				$(".modalbox").fancybox();
			});
		</script>

	</body>
</html>
