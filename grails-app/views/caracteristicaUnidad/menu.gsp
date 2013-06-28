
<%@ page import="com.redoaxaca.CaracteristicaUnidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-caracteristicaUnidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="insertar"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-caracteristicaUnidad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="caracteristicaUnidad.caracteristica.label" default="Caracteristica" /></th>
					
						<th><g:message code="caracteristicaUnidad.unidad.label" default="Unidad" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${caracteristicaUnidadInstanceList}" status="i" var="caracteristicaUnidadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="mostrar" id="${caracteristicaUnidadInstance.id}">${fieldValue(bean: caracteristicaUnidadInstance, field: "caracteristica")}</g:link></td>
					
						<td>${fieldValue(bean: caracteristicaUnidadInstance, field: "unidad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${caracteristicaUnidadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
