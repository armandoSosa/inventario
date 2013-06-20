<%@ page import="com.redoaxaca.Caracteristica" %>



<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
	<label for="caracteristica">
		<g:message code="caracteristica.caracteristica.label" default="Caracteristica" />
		
	</label>
	<g:textField name="caracteristica" value="${caracteristicaInstance?.caracteristica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristicaUnidades', 'error')} ">
	<label for="caracteristicaUnidades">
		<g:message code="caracteristica.caracteristicaUnidades.label" default="Caracteristica Unidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${caracteristicaInstance?.caracteristicaUnidades?}" var="c">
    <li><g:link controller="caracteristicaUnidad" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="caracteristicaUnidad" action="create" params="['caracteristica.id': caracteristicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad')])}</g:link>
</li>
</ul>

</div>

