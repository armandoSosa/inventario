
<%@ page import="com.redoaxaca.PuestoPersona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puestoPersona.label', default: 'PuestoPersona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-puestoPersona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-puestoPersona" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'puestoPersona.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'puestoPersona.fechaFin.label', default: 'Fecha Fin')}" />
					
						<th><g:message code="puestoPersona.persona.label" default="Persona" /></th>
					
						<th><g:message code="puestoPersona.puesto.label" default="Puesto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${puestoPersonaInstanceList}" status="i" var="puestoPersonaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${puestoPersonaInstance.id}">${fieldValue(bean: puestoPersonaInstance, field: "fechaInicio")}</g:link></td>
					
						<td><g:formatDate date="${puestoPersonaInstance.fechaFin}" /></td>
					
						<td>${fieldValue(bean: puestoPersonaInstance, field: "persona")}</td>
					
						<td>${fieldValue(bean: puestoPersonaInstance, field: "puesto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${puestoPersonaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
