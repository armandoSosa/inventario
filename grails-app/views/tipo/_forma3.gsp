<%@ page import="com.redoaxaca.Tipo" %>



<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipo.descripcion.label" default="Descripción" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="tipoTexto${session.mostrarFormValores}" name="tipoTexto${session.mostrarFormValores}" class="formInline" required="" value=""/>
	<br><br><br><br>
	<fieldset class="buttons">
		<a name="create" class="save formInline" href="javascript:void(0)" onclick="submitTipo();return false;">Crear</a>
	</fieldset>
</div>
