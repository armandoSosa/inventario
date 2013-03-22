<%@ page import="com.redoaxaca.Nivel" %>



<div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'nivel', 'error')} ">
	<label for="nivel">
		<g:message code="nivel.nivel.label" default="Nivel" />
		
	</label>
	<g:textField name="nivel" value="${nivelInstance?.nivel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'puestos', 'error')} ">
	<label for="puestos">
		<g:message code="nivel.puestos.label" default="Puestos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${nivelInstance?.puestos?}" var="p">
    <li><g:link controller="puesto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="puesto" action="create" params="['nivel.id': nivelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'puesto.label', default: 'Puesto')])}</g:link>
</li>
</ul>

</div>

