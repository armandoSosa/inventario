<%@ page import="com.redoaxaca.Caracteristica" %>



<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
	<label for="caracteristica">
		<g:message code="caracteristica.caracteristica.label" default="Caracteristica" />
		
	</label>
	<g:textField name="caracteristica" value="${caracteristicaInstance?.caracteristica}"/>
</div>



