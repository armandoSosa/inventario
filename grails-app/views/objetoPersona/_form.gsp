<%@ page import="com.redoaxaca.ObjetoPersona" %>



<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'fechaFin', 'error')} required">
	<label for="fechaFin">
		<g:message code="objetoPersona.fechaFin.label" default="Fecha Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${objetoPersonaInstance?.fechaFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="objetoPersona.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${objetoPersonaInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'objeto', 'error')} required">
	<label for="objeto">
		<g:message code="objetoPersona.objeto.label" default="Objeto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objeto" name="objeto.id" from="${com.redoaxaca.Objeto.list()}" optionKey="id" required="" value="${objetoPersonaInstance?.objeto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="objetoPersona.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required="" value="${objetoPersonaInstance?.persona?.id}" class="many-to-one"/>
</div>

