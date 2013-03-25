
<%@ page import="com.redoaxaca.PrivilegioTipoUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'privilegioTipoUsuario.label', default: 'PrivilegioTipoUsuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-privilegioTipoUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-privilegioTipoUsuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list privilegioTipoUsuario">
			
				<g:if test="${privilegioTipoUsuarioInstance?.privilegios}">
				<li class="fieldcontain">
					<span id="privilegios-label" class="property-label"><g:message code="privilegioTipoUsuario.privilegios.label" default="Privilegios" /></span>
					
						<span class="property-value" aria-labelledby="privilegios-label"><g:link controller="privilegio" action="show" id="${privilegioTipoUsuarioInstance?.privilegios?.id}">${privilegioTipoUsuarioInstance?.privilegios?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${privilegioTipoUsuarioInstance?.tipoUsuarios}">
				<li class="fieldcontain">
					<span id="tipoUsuarios-label" class="property-label"><g:message code="privilegioTipoUsuario.tipoUsuarios.label" default="Tipo Usuarios" /></span>
					
						<span class="property-value" aria-labelledby="tipoUsuarios-label"><g:link controller="tipoUsuario" action="show" id="${privilegioTipoUsuarioInstance?.tipoUsuarios?.id}">${privilegioTipoUsuarioInstance?.tipoUsuarios?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${privilegioTipoUsuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${privilegioTipoUsuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
