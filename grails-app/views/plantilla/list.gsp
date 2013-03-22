
<%@ page import="com.redoaxaca.Plantilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plantilla.label', default: 'Plantilla')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plantilla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plantilla" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="plantilla.caracteristica.label" default="Caracteristica" /></th>
					
						<th><g:message code="plantilla.tipo.label" default="Tipo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${plantillaInstanceList}" status="i" var="plantillaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${plantillaInstance.id}">${fieldValue(bean: plantillaInstance, field: "caracteristica")}</g:link></td>
					
						<td>${fieldValue(bean: plantillaInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${plantillaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
