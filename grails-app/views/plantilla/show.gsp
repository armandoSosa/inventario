
<%@ page import="com.redoaxaca.Plantilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plantilla.label', default: 'Plantilla')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-plantilla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-plantilla" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list plantilla">
			
				<g:if test="${plantillaInstance?.caracteristicaUnidad}">
				<li class="fieldcontain">
					<span id="caracteristicaUnidad-label" class="property-label"><g:message code="plantilla.caracteristicaUnidad.label" default="Caracteristica Unidad" /></span>
					
						<span class="property-value" aria-labelledby="caracteristicaUnidad-label"><g:link controller="caracteristicaUnidad" action="show" id="${plantillaInstance?.caracteristicaUnidad?.id}">${plantillaInstance?.caracteristicaUnidad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${plantillaInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="plantilla.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipo" action="show" id="${plantillaInstance?.tipo?.id}">${plantillaInstance?.tipo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${plantillaInstance?.valores}">
				<li class="fieldcontain">
					<span id="valores-label" class="property-label"><g:message code="plantilla.valores.label" default="Valores" /></span>
					
						<g:each in="${plantillaInstance.valores}" var="v">
						<span class="property-value" aria-labelledby="valores-label"><g:link controller="valor" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${plantillaInstance?.id}" />
					<g:link class="edit" action="edit" id="${plantillaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
