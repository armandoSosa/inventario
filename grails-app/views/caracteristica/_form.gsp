<%@ page import="com.redoaxaca.Caracteristica" %>



<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} required">
	<label for="caracteristica">
		<g:message code="caracteristica.caracteristica.label" default="Caracteristica" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="caracteristica" required="" value="${caracteristicaInstance?.caracteristica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'plantillas', 'error')} ">
	<label for="plantillas">
		<g:message code="caracteristica.plantillas.label" default="Plantillas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${caracteristicaInstance?.plantillas?}" var="p">
    <li><g:link controller="plantilla" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="plantilla" action="create" params="['caracteristica.id': caracteristicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'plantilla.label', default: 'Plantilla')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
	<label for="unidad">
		<g:message code="caracteristica.unidad.label" default="Unidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unidad" name="unidad.id" from="${com.redoaxaca.Unidad.list()}" optionKey="id" required="" value="${caracteristicaInstance?.unidad?.id}" class="many-to-one"/>
</div>

