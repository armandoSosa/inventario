<%@ page import="com.redoaxaca.PuestoPersona" %>

<div class="fieldcontain ${hasErrors(bean: puestoPersonaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="puestoPersona.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required="" value="${puestoPersonaInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoPersonaInstance, field: 'puesto', 'error')} required">
	<label for="puesto">
		<g:message code="puestoPersona.puesto.label" default="Puesto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="puesto" name="puesto.id" from="${com.redoaxaca.Puesto.list()}" optionKey="id" required="" value="${puestoPersonaInstance?.puesto?.id}" class="many-to-one"/>
</div>
