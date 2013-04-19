
<%@ page import="com.redoaxaca.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="insertar"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-persona" class="content scaffold-list" role="main">
			<h1>Lista de Empleados</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numeroEmpleado" title="${message(code: 'persona.numeroEmpleado.label', default: 'Numero Empleado')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="paterno" title="${message(code: 'persona.paterno.label', default: 'Paterno')}" />
					
						<g:sortableColumn property="materno" title="${message(code: 'persona.materno.label', default: 'Materno')}" />
					
						<g:sortableColumn property="curp" title="${message(code: 'persona.curp.label', default: 'Curp')}" />
					
						<g:sortableColumn property="rfc" title="${message(code: 'persona.rfc.label', default: 'Rfc')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personaInstanceList}" status="i" var="personaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="mostrar" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "numeroEmpleado")}</g:link></td>
					
						<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "paterno")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "materno")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "curp")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "rfc")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personaInstanceTotal}" />
			</div>
			<a href="configuracion">Configuración</a>
		</div>
	</body>
</html>
