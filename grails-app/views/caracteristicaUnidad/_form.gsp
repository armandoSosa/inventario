<%@ page import="com.redoaxaca.CaracteristicaUnidad" %>



<div class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'caracteristica', 'error')} required">
	<label for="caracteristica">
		<g:message code="caracteristicaUnidad.caracteristica.label" default="Caracteristica" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="caracteristica" name="caracteristica.id" from="${com.redoaxaca.Caracteristica.list()}" optionKey="id" required="" value="${caracteristicaUnidadInstance?.caracteristica?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'plantillas', 'error')} ">
	<label for="plantillas">
		<g:message code="caracteristicaUnidad.plantillas.label" default="Plantillas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${caracteristicaUnidadInstance?.plantillas?}" var="p">
    <li><g:link controller="plantilla" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="plantilla" action="create" params="['caracteristicaUnidad.id': caracteristicaUnidadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'plantilla.label', default: 'Plantilla')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'unidad', 'error')} required">
	<label for="unidad">
		<g:message code="caracteristicaUnidad.unidad.label" default="Unidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unidad" name="unidad.id" from="${com.redoaxaca.Unidad.list()}" optionKey="id" required="" value="${caracteristicaUnidadInstance?.unidad?.id}" class="many-to-one"/>
</div>

