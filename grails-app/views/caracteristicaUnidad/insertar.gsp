<%@ page import="com.redoaxaca.CaracteristicaUnidad"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-caracteristicaUnidad" class="skip" tabindex="-1"><g:message
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
	<div id="create-caracteristicaUnidad" class="content scaffold-create"
		role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${caracteristicaUnidadInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${caracteristicaUnidadInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'caracteristica', 'error')} required">
					<label for="caracteristica"> <g:message
							code="caracteristicaUnidad.caracteristica.label"
							default="Caracteristica" /> <span class="required-indicator">*</span>
					</label>
					<g:select id="caracteristica" name="caracteristica.id"
						from="${com.redoaxaca.Caracteristica.list()}" optionKey="id"
						required=""
						value="${caracteristicaUnidadInstance?.caracteristica?.id}"
						class="many-to-one" />
				</div>



				<div
					class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'unidad', 'error')} required">
					<label for="unidad"> <g:message
							code="caracteristicaUnidad.unidad.label" default="Unidad" /> <span
						class="required-indicator">*</span>
					</label>
					<g:select id="unidad" name="unidad.id"
						from="${com.redoaxaca.Unidad.list()}" optionKey="id" required=""
						value="${caracteristicaUnidadInstance?.unidad?.id}"
						class="many-to-one" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
