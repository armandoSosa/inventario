<%@ page import="com.redoaxaca.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="usuario.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required="" value="${usuarioInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'tipoUsuario', 'error')} required">
	<label for="tipoUsuario">
		<g:message code="usuario.tipoUsuario.label" default="Tipo Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoUsuario" name="tipoUsuario.id" from="${com.redoaxaca.TipoUsuario.list()}" optionKey="id" required="" value="${usuarioInstance?.tipoUsuario?.id}" class="many-to-one"/>
	<a class="modalbox" href="#inline">Nuevo tipo de usuario</a>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="usuario.usuario.label" default="Usuario" />
		
	</label>
	<g:textField name="usuario" value="${usuarioInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'contrasena', 'error')} ">
	<label for="contrasena">
		<g:message code="usuario.contrasena.label" default="Contrasena" />
		
	</label>
	<g:passwordField name="contrasena" value="${usuarioInstance?.contrasena}"/>	
</div>
