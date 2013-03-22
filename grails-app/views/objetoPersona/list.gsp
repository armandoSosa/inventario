
<%@ page import="com.redoaxaca.ObjetoPersona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetoPersona.label', default: 'ObjetoPersona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-objetoPersona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objetoPersona" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'objetoPersona.fechaFin.label', default: 'Fecha Fin')}" />
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'objetoPersona.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<th><g:message code="objetoPersona.objeto.label" default="Objeto" /></th>
					
						<th><g:message code="objetoPersona.persona.label" default="Persona" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetoPersonaInstanceList}" status="i" var="objetoPersonaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetoPersonaInstance.id}">${fieldValue(bean: objetoPersonaInstance, field: "fechaFin")}</g:link></td>
					
						<td><g:formatDate date="${objetoPersonaInstance.fechaInicio}" /></td>
					
						<td>${fieldValue(bean: objetoPersonaInstance, field: "objeto")}</td>
					
						<td>${fieldValue(bean: objetoPersonaInstance, field: "persona")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${objetoPersonaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
