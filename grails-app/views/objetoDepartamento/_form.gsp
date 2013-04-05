<%@ page import="com.redoaxaca.ObjetoDepartamento" %>



<div class="fieldcontain ${hasErrors(bean: objetoDepartamentoInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="objetoDepartamento.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${com.redoaxaca.Departamento.list()}" optionKey="id" required="" value="${objetoDepartamentoInstance?.departamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoDepartamentoInstance, field: 'fechaFin', 'error')} required">
	<label for="fechaFin">
		<g:message code="objetoDepartamento.fechaFin.label" default="Fecha Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${objetoDepartamentoInstance?.fechaFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: objetoDepartamentoInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="objetoDepartamento.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${objetoDepartamentoInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: objetoDepartamentoInstance, field: 'objeto', 'error')} required">
	<label for="objeto">
		<g:message code="objetoDepartamento.objeto.label" default="Objeto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objeto" name="objeto.id" from="${com.redoaxaca.Objeto.list()}" optionKey="id" required="" value="${objetoDepartamentoInstance?.objeto?.id}" class="many-to-one"/>
</div>

