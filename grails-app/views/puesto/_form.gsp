<%@ page import="com.redoaxaca.Puesto" %>



<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="puesto.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${puestoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="puesto.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${com.redoaxaca.Departamento.list()}" optionKey="id" required="" value="${puestoInstance?.departamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="puesto.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nivel" name="nivel.id" from="${com.redoaxaca.Nivel.list()}" optionKey="id" required="" value="${puestoInstance?.nivel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'permitirVarios', 'error')} ">
	<label for="permitirVarios">
		<g:message code="puesto.permitirVarios.label" default="Permitir Varios" />
		
	</label>
	<g:checkBox name="permitirVarios" value="${puestoInstance?.permitirVarios}" />
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'puestosPersona', 'error')} ">
	<label for="puestosPersona">
		<g:message code="puesto.puestosPersona.label" default="Puestos Persona" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${puestoInstance?.puestosPersona?}" var="p">
    <li><g:link controller="puestoPersona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="puestoPersona" action="create" params="['puesto.id': puestoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'puestoPersona.label', default: 'PuestoPersona')])}</g:link>
</li>
</ul>

</div>

