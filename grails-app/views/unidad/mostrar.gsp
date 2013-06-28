
<%@ page import="com.redoaxaca.Unidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'unidad.label', default: 'Unidad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-unidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="menu"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="insertar3"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unidad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unidad">
			
				<g:if test="${unidadInstance?.unidad}">
				<li class="fieldcontain">
					<span id="unidad-label" class="property-label"><g:message code="unidad.unidad.label" default="Unidad" /></span>
					
						<span class="property-value" aria-labelledby="unidad-label"><g:fieldValue bean="${unidadInstance}" field="unidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadInstance?.caracteristicaUnidades}">
				<li class="fieldcontain">
					<span id="caracteristicaUnidades-label" class="property-label"><g:message code="unidad.caracteristicaUnidades.label" default="Caracteristicas a las que está asignada" /></span>
					
						<g:each in="${unidadInstance.caracteristicaUnidades}" var="c">
						<span class="property-value" aria-labelledby="caracteristicaUnidades-label"><g:link controller="caracteristica" action="mostrar" id="${c?.caracteristica?.id}">${c?.caracteristica}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${unidadInstance?.id}" />
					<g:link class="edit" action="editar2" id="${unidadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
