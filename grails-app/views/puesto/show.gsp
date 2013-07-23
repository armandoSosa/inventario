
<%@ page import="com.redoaxaca.Puesto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puesto.label', default: 'Puesto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-puesto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-puesto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list puesto">
			
				<g:if test="${puestoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="puesto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${puestoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.departamento}">
				<li class="fieldcontain">
					<span id="departamento-label" class="property-label"><g:message code="puesto.departamento.label" default="Departamento" /></span>
					
						<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${puestoInstance?.departamento?.id}">${puestoInstance?.departamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.nivel}">
				<li class="fieldcontain">
					<span id="nivel-label" class="property-label"><g:message code="puesto.nivel.label" default="Nivel" /></span>
					
						<span class="property-value" aria-labelledby="nivel-label"><g:link controller="nivel" action="show" id="${puestoInstance?.nivel?.id}">${puestoInstance?.nivel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.permitirVarios}">
				<li class="fieldcontain">
					<span id="permitirVarios-label" class="property-label"><g:message code="puesto.permitirVarios.label" default="Permitir Varios" /></span>
					
						<span class="property-value" aria-labelledby="permitirVarios-label"><g:formatBoolean boolean="${puestoInstance?.permitirVarios}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.puestosPersona}">
				<li class="fieldcontain">
					<span id="puestosPersona-label" class="property-label"><g:message code="puesto.puestosPersona.label" default="Puestos Persona" /></span>
					
						<g:each in="${puestoInstance.puestosPersona}" var="p">
						<span class="property-value" aria-labelledby="puestosPersona-label"><g:link controller="puestoPersona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${puestoInstance?.id}" />
					<g:link class="edit" action="edit" id="${puestoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
