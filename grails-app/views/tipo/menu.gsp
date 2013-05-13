
<%@ page import="com.redoaxaca.Tipo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'tipo.label', default: 'Tipo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipo.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="claveInventario" title="${message(code: 'tipo.claveInventario.label', default: 'Clave Inventario')}" />
					
						<g:sortableColumn property="noInventarioSeriado" title="${message(code: 'tipo.noInventarioSeriado.label', default: 'No Inventario Seriado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoInstanceList}" status="i" var="tipoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="mostrar" id="${tipoInstance.id}">${fieldValue(bean: tipoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: tipoInstance, field: "claveInventario")}</td>
					
						<td>${fieldValue(bean: tipoInstance, field: "noInventarioSeriado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
