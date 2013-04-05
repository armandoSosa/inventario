
<%@ page import="com.redoaxaca.ObjetoDepartamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetoDepartamento.label', default: 'ObjetoDepartamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-objetoDepartamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-objetoDepartamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list objetoDepartamento">
			
				<g:if test="${objetoDepartamentoInstance?.departamento}">
				<li class="fieldcontain">
					<span id="departamento-label" class="property-label"><g:message code="objetoDepartamento.departamento.label" default="Departamento" /></span>
					
						<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${objetoDepartamentoInstance?.departamento?.id}">${objetoDepartamentoInstance?.departamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${objetoDepartamentoInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="objetoDepartamento.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${objetoDepartamentoInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${objetoDepartamentoInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="objetoDepartamento.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${objetoDepartamentoInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${objetoDepartamentoInstance?.objeto}">
				<li class="fieldcontain">
					<span id="objeto-label" class="property-label"><g:message code="objetoDepartamento.objeto.label" default="Objeto" /></span>
					
						<span class="property-value" aria-labelledby="objeto-label"><g:link controller="objeto" action="show" id="${objetoDepartamentoInstance?.objeto?.id}">${objetoDepartamentoInstance?.objeto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${objetoDepartamentoInstance?.id}" />
					<g:link class="edit" action="edit" id="${objetoDepartamentoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
