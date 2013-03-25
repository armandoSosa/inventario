<%@ page import="com.redoaxaca.PrivilegioTipoUsuario" %>



<div class="fieldcontain ${hasErrors(bean: privilegioTipoUsuarioInstance, field: 'privilegios', 'error')} required">
	<label for="privilegios">
		<g:message code="privilegioTipoUsuario.privilegios.label" default="Privilegios" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="privilegios" name="privilegios.id" from="${com.redoaxaca.Privilegio.list()}" optionKey="id" required="" value="${privilegioTipoUsuarioInstance?.privilegios?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: privilegioTipoUsuarioInstance, field: 'tipoUsuarios', 'error')} required">
	<label for="tipoUsuarios">
		<g:message code="privilegioTipoUsuario.tipoUsuarios.label" default="Tipo Usuarios" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoUsuarios" name="tipoUsuarios.id" from="${com.redoaxaca.TipoUsuario.list()}" optionKey="id" required="" value="${privilegioTipoUsuarioInstance?.tipoUsuarios?.id}" class="many-to-one"/>
</div>

