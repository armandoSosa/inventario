<%@ page import="com.redoaxaca.Telefono" %>



<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="telefono.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required="" value="${telefonoInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="telefono.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${telefonoInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono">
		<g:message code="telefono.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoTelefono" name="tipoTelefono.id" from="${com.redoaxaca.TipoTelefono.list()}" optionKey="id" required="" value="${telefonoInstance?.tipoTelefono?.id}" class="many-to-one"/>
</div>

