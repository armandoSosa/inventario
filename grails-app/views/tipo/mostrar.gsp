
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
					<span id="objetos-label" class="property-label"><g:message code="tipo.objetos.label" default="Objetos" /></span>
					
						<g:each in="${tipoInstance.objetos}" var="o">
						<span class="property-value" aria-labelledby="objetos-label"><g:link controller="objeto" action="mostrar" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tipoInstance?.plantilla}">
					<li class="fieldcontain">
						<span id="plantilla-label" class="property-label"><g:message code="tipo.plantilla.label" default="Características" /></span>
						
							<g:each in="${tipoInstance.plantilla}" var="p">
							<span class="property-value" aria-labelledby="plantilla-label"><g:link controller="caracteristica" action="mostrar" id="${p.caracteristica?.id}">${p.caracteristica}; Unidad: ${p.caracteristica?.unidad?.unidad}</g:link></span>
							</g:each>
						
					</li>
					<g:if test="${tipoInstance?.id}">
						<li class="fieldcontain">
								<span class="property-value" aria-labelledby="descripcion-label"><g:link controller="plantilla" action="insertar2" id="${tipoInstance?.id}">Modificar características</g:link></span>
						</li>
					</g:if>
				</g:if>
				<g:else>
					<g:if test="${tipoInstance?.id}">
						<li class="fieldcontain">
								<span class="property-value" aria-labelledby="descripcion-label"><g:link controller="plantilla" action="insertar2" id="${tipoInstance?.id}">Agregar características</g:link></span>
						</li>
					</g:if>
					
				</g:else>
				
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoInstance?.id}" />
					<g:link class="edit" controller="plantilla" action="insertar2" id="${tipoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
