<%@ page import="com.redoaxaca.Departamento" %>



<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="departamento.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${departamentoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'departamentos', 'error')} ">
	<label for="departamentos">
		<g:message code="departamento.departamentos.label" default="Subdepartamentos" />
		
	</label>
	<g:select name="departamentos" from="${com.redoaxaca.Departamento.list()}" multiple="multiple" optionKey="id" size="5" value="${departamentoInstance?.departamentos*.id}" class="many-to-many"/>
</div>
