<%@ page import="com.redoaxaca.Tipo" %>



<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipo.descripcion.label" default="Descripción" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoTexto${session.numTipos}" required="" value=""/>
</div>
