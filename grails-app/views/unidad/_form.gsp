<%@ page import="com.redoaxaca.Unidad" %>



<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'caracteristicas', 'error')} ">
	<label for="caracteristicas">
		<g:message code="unidad.caracteristicas.label" default="Caracteristicas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${unidadInstance?.caracteristicas?}" var="c">
    <li><g:link controller="caracteristica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="caracteristica" action="create" params="['unidad.id': unidadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'caracteristica.label', default: 'Caracteristica')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
	<label for="unidad">
		<g:message code="unidad.unidad.label" default="Unidad" />
		
	</label>
	<g:textField name="unidad" value="${unidadInstance?.unidad}"/>
</div>

