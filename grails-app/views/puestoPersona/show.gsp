
<%@ page import="com.redoaxaca.PuestoPersona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puestoPersona.label', default: 'PuestoPersona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-puestoPersona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-puestoPersona" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list puestoPersona">
			
				<g:if test="${puestoPersonaInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="puestoPersona.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${puestoPersonaInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoPersonaInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="puestoPersona.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${puestoPersonaInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoPersonaInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="puestoPersona.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${puestoPersonaInstance?.persona?.id}">${puestoPersonaInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoPersonaInstance?.puesto}">
				<li class="fieldcontain">
					<span id="puesto-label" class="property-label"><g:message code="puestoPersona.puesto.label" default="Puesto" /></span>
					
						<span class="property-value" aria-labelledby="puesto-label"><g:link controller="puesto" action="show" id="${puestoPersonaInstance?.puesto?.id}">${puestoPersonaInstance?.puesto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${puestoPersonaInstance?.id}" />
					<g:link class="edit" action="edit" id="${puestoPersonaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
