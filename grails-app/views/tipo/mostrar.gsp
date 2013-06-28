
<%@ page import="com.redoaxaca.Tipo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'tipo.label', default: 'Tipo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="menu"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="insertar2"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipo">
			
				<g:if test="${tipoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tipo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tipoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoInstance?.claveInventario}">
				<li class="fieldcontain">
					<span id="claveInventario-label" class="property-label"><g:message code="tipo.claveInventario.label" default="Clave Inventario" /></span>
					
						<span class="property-value" aria-labelledby="claveInventario-label"><g:fieldValue bean="${tipoInstance}" field="claveInventario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoInstance?.noInventarioSeriado}">
				<li class="fieldcontain">
					<span id="noInventarioSeriado-label" class="property-label"><g:message code="tipo.noInventarioSeriado.label" default="No Inventario Seriado" /></span>
					
						<span class="property-value" aria-labelledby="noInventarioSeriado-label"><g:fieldValue bean="${tipoInstance}" field="noInventarioSeriado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoInstance?.objetos}">
				<li class="fieldcontain">
					<span id="objetos-label" class="property-label"><g:message code="tipo.objetos.label" default="Objetos registrados" /></span>
					
						<g:each in="${tipoInstance.objetos}" var="o">
						<span class="property-value" aria-labelledby="objetos-label"><g:link controller="objeto" action="mostrar" id="${o.id}">${o?.noInventario}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tipoInstance?.plantilla}">
				<li class="fieldcontain">
					<br><br>
					<h2>Características</h2>
						<br>
						<table>
							<tr><th>Característica</th><th>Unidad</th></tr>
							<g:each in="${tipoInstance.plantilla}" var="p">
								<tr>
									<span class="property-value" aria-labelledby="plantilla-label"><g:link controller="plantilla" action="mostrar" id="${p.id}"><td>${p?.caracteristicaUnidad.caracteristica}</td><td>${p?.caracteristicaUnidad.unidad}</td></g:link></span>
								</tr>
							</g:each>
						</table>
					
				</li>
				</g:if>
				<br><br>
				<a href="/inventarios3/plantilla/insertar2/${tipoInstance?.id}">Modificar características</a>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
