<%@ page import="com.redoaxaca.Privilegio" %>



<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="privilegio.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${privilegioInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'tipoUsuarios', 'error')} ">
	<label for="tipoUsuarios">
		<g:message code="privilegio.tipoUsuarios.label" default="Tipo Usuarios" />
		
	</label>
	<g:select name="tipoUsuarios" from="${com.redoaxaca.TipoUsuario.list()}" multiple="multiple" optionKey="id" size="5" value="${privilegioInstance?.tipoUsuarios*.id}" class="many-to-many"/>
</div>

