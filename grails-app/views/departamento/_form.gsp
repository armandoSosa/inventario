<%@ page import="com.redoaxaca.Departamento" %>



<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="departamento.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${departamentoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'departamentos', 'error')} ">
	<label for="departamentos">
		<g:message code="departamento.departamentos.label" default="Departamentos" />
		
	</label>
	<g:select name="departamentos" from="${com.redoaxaca.Departamento.list()}" multiple="multiple" optionKey="id" size="5" value="${departamentoInstance?.departamentos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'objetosDepartamento', 'error')} ">
	<label for="objetosDepartamento">
		<g:message code="departamento.objetosDepartamento.label" default="Objetos Departamento" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departamentoInstance?.objetosDepartamento?}" var="o">
    <li><g:link controller="objetoDepartamento" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objetoDepartamento" action="create" params="['departamento.id': departamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetoDepartamento.label', default: 'ObjetoDepartamento')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'puestos', 'error')} ">
	<label for="puestos">
		<g:message code="departamento.puestos.label" default="Puestos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departamentoInstance?.puestos?}" var="p">
    <li><g:link controller="puesto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="puesto" action="create" params="['departamento.id': departamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'puesto.label', default: 'Puesto')])}</g:link>
</li>
</ul>

</div>

