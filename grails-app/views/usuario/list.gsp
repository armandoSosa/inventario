
<%@ page import="com.redoaxaca.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="contrasena" title="${message(code: 'usuario.contrasena.label', default: 'Contrasena')}" />
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'usuario.fechaFin.label', default: 'Fecha Fin')}" />
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'usuario.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<th><g:message code="usuario.persona.label" default="Persona" /></th>
					
						<th><g:message code="usuario.tipoUsuario.label" default="Tipo Usuario" /></th>
					
						<g:sortableColumn property="usuario" title="${message(code: 'usuario.usuario.label', default: 'Usuario')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "contrasena")}</g:link></td>
					
						<td><g:formatDate date="${usuarioInstance.fechaFin}" /></td>
					
						<td><g:formatDate date="${usuarioInstance.fechaInicio}" /></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "persona")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "tipoUsuario")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
