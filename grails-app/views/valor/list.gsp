
<%@ page import="com.redoaxaca.Valor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valor.label', default: 'Valor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-valor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-valor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="valor.objetos.label" default="Objetos" /></th>
					
						<th><g:message code="valor.plantilla.label" default="Plantilla" /></th>
					
						<g:sortableColumn property="valor" title="${message(code: 'valor.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${valorInstanceList}" status="i" var="valorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${valorInstance.id}">${fieldValue(bean: valorInstance, field: "objetos")}</g:link></td>
					
						<td>${fieldValue(bean: valorInstance, field: "plantilla")}</td>
					
						<td>${fieldValue(bean: valorInstance, field: "valor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${valorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
