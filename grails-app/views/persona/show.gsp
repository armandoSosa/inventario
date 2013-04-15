
<%@ page import="com.redoaxaca.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-persona" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list persona">
			
				<g:if test="${personaInstance?.numeroEmpleado}">
				<li class="fieldcontain">
					<span id="numeroEmpleado-label" class="property-label"><g:message code="persona.numeroEmpleado.label" default="Numero Empleado" /></span>
					
						<span class="property-value" aria-labelledby="numeroEmpleado-label"><g:fieldValue bean="${personaInstance}" field="numeroEmpleado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.paterno}">
				<li class="fieldcontain">
					<span id="paterno-label" class="property-label"><g:message code="persona.paterno.label" default="Paterno" /></span>
					
						<span class="property-value" aria-labelledby="paterno-label"><g:fieldValue bean="${personaInstance}" field="paterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.materno}">
				<li class="fieldcontain">
					<span id="materno-label" class="property-label"><g:message code="persona.materno.label" default="Materno" /></span>
					
						<span class="property-value" aria-labelledby="materno-label"><g:fieldValue bean="${personaInstance}" field="materno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.curp}">
				<li class="fieldcontain">
					<span id="curp-label" class="property-label"><g:message code="persona.curp.label" default="Curp" /></span>
					
						<span class="property-value" aria-labelledby="curp-label"><g:fieldValue bean="${personaInstance}" field="curp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.rfc}">
				<li class="fieldcontain">
					<span id="rfc-label" class="property-label"><g:message code="persona.rfc.label" default="Rfc" /></span>
					
						<span class="property-value" aria-labelledby="rfc-label"><g:fieldValue bean="${personaInstance}" field="rfc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.fechaNacimiento}">
				<li class="fieldcontain">
					<span id="fechaNacimiento-label" class="property-label"><g:message code="persona.fechaNacimiento.label" default="Fecha Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimiento-label"><g:formatDate date="${personaInstance?.fechaNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="persona.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.foto}">
				<li class="fieldcontain">
					<span id="foto-label" class="property-label"><g:message code="persona.foto.label" default="Foto" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="persona.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${personaInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.direcciones}">
				<li class="fieldcontain">
					<span id="direcciones-label" class="property-label"><g:message code="persona.direcciones.label" default="Direcciones" /></span>
					
						<g:each in="${personaInstance.direcciones}" var="d">
						<span class="property-value" aria-labelledby="direcciones-label"><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.objetosPersona}">
				<li class="fieldcontain">
					<span id="objetosPersona-label" class="property-label"><g:message code="persona.objetosPersona.label" default="Objetos Persona" /></span>
					
						<g:each in="${personaInstance.objetosPersona}" var="o">
						<span class="property-value" aria-labelledby="objetosPersona-label"><g:link controller="objetoPersona" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.puestosPersona}">
				<li class="fieldcontain">
					<span id="puestosPersona-label" class="property-label"><g:message code="persona.puestosPersona.label" default="Puestos Persona" /></span>
					
						<g:each in="${personaInstance.puestosPersona}" var="p">
						<span class="property-value" aria-labelledby="puestosPersona-label"><g:link controller="puestoPersona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.subordinado}">
				<li class="fieldcontain">
					<span id="subordinado-label" class="property-label"><g:message code="persona.subordinado.label" default="Subordinado" /></span>
					
						<g:each in="${personaInstance.subordinado}" var="s">
						<span class="property-value" aria-labelledby="subordinado-label"><g:link controller="persona" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.usuarios}">
				<li class="fieldcontain">
					<span id="usuarios-label" class="property-label"><g:message code="persona.usuarios.label" default="Usuarios" /></span>
					
						<g:each in="${personaInstance.usuarios}" var="u">
						<span class="property-value" aria-labelledby="usuarios-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personaInstance?.id}" />
					<g:link class="edit" action="edit" id="${personaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
