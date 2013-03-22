<%@ page import="com.redoaxaca.Plantilla" %>



<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'caracteristica', 'error')} required">
	<label for="caracteristica">
		<g:message code="plantilla.caracteristica.label" default="Caracteristica" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="caracteristica" name="caracteristica.id" from="${com.redoaxaca.Caracteristica.list()}" optionKey="id" required="" value="${plantillaInstance?.caracteristica?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="plantilla.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}" optionKey="id" required="" value="${plantillaInstance?.tipo?.id}" class="many-to-one"/>
</div>

