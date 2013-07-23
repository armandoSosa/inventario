
<%@ page import="com.redoaxaca.Puesto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puesto.label', default: 'Puesto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-puesto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-puesto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'puesto.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="puesto.departamento.label" default="Departamento" /></th>
					
						<th><g:message code="puesto.nivel.label" default="Nivel" /></th>
					
						<g:sortableColumn property="permitirVarios" title="${message(code: 'puesto.permitirVarios.label', default: 'Permitir Varios')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${puestoInstanceList}" status="i" var="puestoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${puestoInstance.id}">${fieldValue(bean: puestoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: puestoInstance, field: "departamento")}</td>
					
						<td>${fieldValue(bean: puestoInstance, field: "nivel")}</td>
					
						<td><g:formatBoolean boolean="${puestoInstance.permitirVarios}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${puestoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
