<%@ page import="com.redoaxaca.ObjetoDepartamento" %>



<div class="fieldcontain ${hasErrors(bean: objetoDepartamentoInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="objetoDepartamento.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${com.redoaxaca.Departamento.list()}" optionKey="id" required="" value="${objetoDepartamentoInstance?.departamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoDepartamentoInstance, field: 'objeto', 'error')} required">
	<label for="objeto">
		<g:message code="objetoDepartamento.objeto.label" default="Objeto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objeto" name="objeto.id" from="${com.redoaxaca.Objeto.list()}" optionKey="id" required="" value="${objetoDepartamentoInstance?.objeto?.id}" class="many-to-one"/>
</div>

