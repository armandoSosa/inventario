
<%@ page import="com.redoaxaca.Departamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-departamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-departamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list departamento">
			
				<g:if test="${departamentoInstance?.departamentos}">
				<li class="fieldcontain">
					<span id="departamentos-label" class="property-label"><g:message code="departamento.departamentos.label" default="Departamentos" /></span>
					
						<g:each in="${departamentoInstance.departamentos}" var="d">
						<span class="property-value" aria-labelledby="departamentos-label"><g:link controller="departamento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${departamentoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="departamento.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${departamentoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departamentoInstance?.objetosDepartamento}">
				<li class="fieldcontain">
					<span id="objetosDepartamento-label" class="property-label"><g:message code="departamento.objetosDepartamento.label" default="Objetos Departamento" /></span>
					
						<g:each in="${departamentoInstance.objetosDepartamento}" var="o">
						<span class="property-value" aria-labelledby="objetosDepartamento-label"><g:link controller="objetoDepartamento" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${departamentoInstance?.puestos}">
				<li class="fieldcontain">
					<span id="puestos-label" class="property-label"><g:message code="departamento.puestos.label" default="Puestos" /></span>
					
						<g:each in="${departamentoInstance.puestos}" var="p">
						<span class="property-value" aria-labelledby="puestos-label"><g:link controller="puesto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${departamentoInstance?.id}" />
					<g:link class="edit" action="edit" id="${departamentoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
