<%@ page import="com.redoaxaca.ObjetoPersona" %>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="objetoPersona.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required="" value="${objetoPersonaInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'objeto', 'error')} required">
	<label for="objeto">
		<g:message code="objetoPersona.objeto.label" default="Objeto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objeto" name="objeto.id" from="${com.redoaxaca.Objeto.list()}" optionKey="id" required="" value="${objetoPersonaInstance?.objeto?.id}" class="many-to-one"/>
</div>