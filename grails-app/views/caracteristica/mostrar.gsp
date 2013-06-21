
<%@ page import="com.redoaxaca.Caracteristica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'caracteristica.label', default: 'Caracteristica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-caracteristica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="menu"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="insertar3"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-caracteristica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list caracteristica">
			
				<g:if test="${caracteristicaInstance?.caracteristica}">
				<li class="fieldcontain">
					<span id="caracteristica-label" class="property-label"><g:message code="caracteristica.caracteristica.label" default="Caracteristica" /></span>
					
						<span class="property-value" aria-labelledby="caracteristica-label"><g:fieldValue bean="${caracteristicaInstance}" field="caracteristica"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caracteristicaInstance?.caracteristicaUnidades}">
				<li class="fieldcontain">
					<span id="caracteristicaUnidades-label" class="property-label"><g:message code="caracteristica.caracteristicaUnidades.label" default="Unidades" /></span>
					
						<g:each in="${caracteristicaInstance.caracteristicaUnidades}" var="c">
						<span class="property-value" aria-labelledby="caracteristicaUnidades-label"><g:link controller="caracteristicaUnidad" action="mostrar" id="${c.id}">${c?.unidad} </g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${caracteristicaInstance?.id}" />
					<g:link class="edit" action="edit" id="${caracteristicaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
