<%@ page import="com.redoaxaca.Tipo" %>

<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="descripcion" name="descripcion" required="" style='text-transform:uppercase;' value="${tipoInstance?.descripcion}" onkeypress="return validarTecleo(event, 8)" class="tooltip" title=""/>
	
</div>







