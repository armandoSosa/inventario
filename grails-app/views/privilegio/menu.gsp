
<%@ page import="com.redoaxaca.Privilegio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'privilegio.label', default: 'Privilegio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-privilegio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="insertar"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-privilegio" class="content scaffold-list" role="main">
			<h1>Lista de Privilegios</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'privilegio.tipo.label', default: 'Tipo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${privilegioInstanceList}" status="i" var="privilegioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${privilegioInstance.id}">${fieldValue(bean: privilegioInstance, field: "tipo")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${privilegioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
