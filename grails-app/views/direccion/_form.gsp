<%@ page import="com.redoaxaca.Direccion" %>



<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="direccion.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${direccionInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="direccion.colonia.label" default="Colonia" />
		
	</label>
	<g:textField name="colonia" value="${direccionInstance?.colonia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="direccion.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${direccionInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${com.redoaxaca.Municipio.list()}" optionKey="id" required="" value="${direccionInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noExterior', 'error')} ">
	<label for="noExterior">
		<g:message code="direccion.noExterior.label" default="No Exterior" />
		
	</label>
	<g:textField name="noExterior" value="${direccionInstance?.noExterior}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noInterior', 'error')} ">
	<label for="noInterior">
		<g:message code="direccion.noInterior.label" default="No Interior" />
		
	</label>
	<g:textField name="noInterior" value="${direccionInstance?.noInterior}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="direccion.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required="" value="${direccionInstance?.persona?.id}" class="many-to-one"/>
</div>

