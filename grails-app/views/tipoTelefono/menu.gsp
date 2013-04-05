
<%@ page import="com.redoaxaca.TipoTelefono" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoTelefono.label', default: 'TipoTelefono')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoTelefono" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="insertar">Nuevo Tipo de Teléfono</g:link></li>
			</ul>
		</div>
		<div id="list-tipoTelefono" class="content scaffold-list" role="main">
			<h1>Lista de Tipos de Teléfonos</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'tipoTelefono.tipo.label', default: 'Tipo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoTelefonoInstanceList}" status="i" var="tipoTelefonoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoTelefonoInstance.id}">${fieldValue(bean: tipoTelefonoInstance, field: "tipo")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoTelefonoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
