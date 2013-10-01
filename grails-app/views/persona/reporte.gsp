
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
				<li><g:link class="create" action="insertar2">Nuevo Empleado</g:link></li>
			</ul>
		</div>
		<div id="list-persona" class="content scaffold-list" role="main">		
			<g:jasperReport jasper="empleado" format="PDF,XLS" name="Reporte general de la información del empleado" action="reporteEmpledo" controller="persona" />
			<br>
			<g:jasperReport jasper="empleados" format="PDF,XLS" name="Reporte de empleados" action="genenarReporte" controller="persona" />
			<br>
			<g:jasperReport jasper="objetosEmpleado" format="PDF,XLS" name="Reporte de objetos a cargo de un empleado" action="reporteObjetosEmpledo" controller="persona" />
			<br>
			<g:jasperReport jasper="objetosPersona" format="PDF,XLS" name="Reporte de objetos por persona" action="reporteObjetosPersona" controller="persona" />			
		</div>
	</body>
</html>
