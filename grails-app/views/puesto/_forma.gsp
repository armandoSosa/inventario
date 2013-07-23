<%@ page import="com.redoaxaca.Puesto" %>



<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="puesto.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${com.redoaxaca.Departamento.list()}" optionKey="id" required="" value="${puestoInstance?.departamento?.id}" class="many-to-one"/>
	<a class="modalbox" href="#inline">Nuevo departamento</a>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="puesto.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nivel" name="nivel.id" from="${com.redoaxaca.Nivel.list()}" optionKey="id" required="" value="${puestoInstance?.nivel?.id}" class="many-to-one"/>
	<a class="modalbox" href="#inline2">Nuevo nivel</a>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'permitirVarios', 'error')} ">
	<label for="permitirVarios">
		<g:message code="puesto.permitirVarios.label" default="Permitir Varios" />
		
	</label>
	<g:checkBox name="permitirVarios" value="${puestoInstance?.permitirVarios}" />
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="puesto.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${puestoInstance?.nombre}"/>
</div>

