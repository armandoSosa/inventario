
<%@ page import="com.redoaxaca.Valor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valor.label', default: 'Valor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-valor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-valor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list valor">
			
				<g:if test="${valorInstance?.objetos}">
				<li class="fieldcontain">
					<span id="objetos-label" class="property-label"><g:message code="valor.objetos.label" default="Objetos" /></span>
					
						<span class="property-value" aria-labelledby="objetos-label"><g:link controller="objeto" action="show" id="${valorInstance?.objetos?.id}">${valorInstance?.objetos?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorInstance?.plantilla}">
				<li class="fieldcontain">
					<span id="plantilla-label" class="property-label"><g:message code="valor.plantilla.label" default="Plantilla" /></span>
					
						<span class="property-value" aria-labelledby="plantilla-label"><g:link controller="plantilla" action="show" id="${valorInstance?.plantilla?.id}">${valorInstance?.plantilla?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="valor.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${valorInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${valorInstance?.id}" />
					<g:link class="edit" action="edit" id="${valorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
