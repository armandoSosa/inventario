<%@ page import="com.redoaxaca.PuestoPersona" %>



<div class="fieldcontain ${hasErrors(bean: puestoPersonaInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="puestoPersona.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${puestoPersonaInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: puestoPersonaInstance, field: 'fechaFin', 'error')} ">
	<label for="fechaFin">
		<g:message code="puestoPersona.fechaFin.label" default="Fecha Fin" />
		
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${puestoPersonaInstance?.fechaFin}" default="none" noSelection="['': '']" />
</div>

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

