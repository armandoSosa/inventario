
<%@ page import="com.redoaxaca.Foto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foto.label', default: 'Foto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-foto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-foto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="foto" title="${message(code: 'foto.foto.label', default: 'Foto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fotoInstanceList}" status="i" var="fotoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
						<!--<g:link action="show" id="${fotoInstance.id}">${fieldValue(bean: fotoInstance, field: "foto")}</g:link>-->
						<g:link action="show" id="${fotoInstance.id}">
						<img id="imagen" class="imagenPerfil" src="<g:createLink controller='persona' action='renderImage' id="${fotoInstance?.id}"/>" />
						</g:link>
						</td>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fotoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
