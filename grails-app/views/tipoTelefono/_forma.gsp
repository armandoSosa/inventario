<%@ page import="com.redoaxaca.TipoTelefono" %>

<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="tipoTelefono.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${tipoTelefonoInstance?.tipo}"/>
</div>

