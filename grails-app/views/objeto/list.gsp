
<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-objeto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="insertar2"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objeto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noInventario" title="${message(code: 'objeto.noInventario.label', default: 'No Inventario')}" />
					
						<th><g:message code="objeto.tipo.label" default="Tipo" /></th>
					
						<th><g:message code="objeto.tipoPropiedad.label" default="Tipo Propiedad" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetoInstanceList}" status="i" var="objetoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetoInstance.id}">${fieldValue(bean: objetoInstance, field: "noInventario")}</g:link></td>
					
						<td>${fieldValue(bean: objetoInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: objetoInstance, field: "tipoPropiedad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${objetoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
