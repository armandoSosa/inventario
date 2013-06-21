<%@ page import="com.redoaxaca.Unidad" %>



<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'caracteristicaUnidades', 'error')} ">
	<label for="caracteristicaUnidades">
		<g:message code="unidad.caracteristicaUnidades.label" default="Caracteristica Unidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${unidadInstance?.caracteristicaUnidades?}" var="c">
    <li><g:link controller="caracteristicaUnidad" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="caracteristicaUnidad" action="create" params="['unidad.id': unidadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
	<label for="unidad">
		<g:message code="unidad.unidad.label" default="Unidad" />
		
	</label>
	<g:textField name="unidad" value="${unidadInstance?.unidad}"/>
</div>

