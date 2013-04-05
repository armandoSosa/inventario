<%@ page import="com.redoaxaca.TipoUsuario" %>

<div class="fieldcontain ${hasErrors(bean: tipoUsuarioInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="tipoUsuario.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${tipoUsuarioInstance?.tipo}"/>
</div>