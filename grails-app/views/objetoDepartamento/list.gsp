
<%@ page import="com.redoaxaca.ObjetoDepartamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetoDepartamento.label', default: 'ObjetoDepartamento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-objetoDepartamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objetoDepartamento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="objetoDepartamento.departamento.label" default="Departamento" /></th>
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'objetoDepartamento.fechaFin.label', default: 'Fecha Fin')}" />
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'objetoDepartamento.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<th><g:message code="objetoDepartamento.objeto.label" default="Objeto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetoDepartamentoInstanceList}" status="i" var="objetoDepartamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetoDepartamentoInstance.id}">${fieldValue(bean: objetoDepartamentoInstance, field: "departamento")}</g:link></td>
					
						<td><g:formatDate date="${objetoDepartamentoInstance.fechaFin}" /></td>
					
						<td><g:formatDate date="${objetoDepartamentoInstance.fechaInicio}" /></td>
					
						<td>${fieldValue(bean: objetoDepartamentoInstance, field: "objeto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${objetoDepartamentoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
