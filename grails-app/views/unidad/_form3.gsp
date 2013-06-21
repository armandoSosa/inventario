<%@ page import="com.redoaxaca.Unidad" %>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
	<label for="unidad">
		<g:message code="unidad.unidad.label" default="Unidad" />
		
	</label>
	<g:textField name="unidad" value="${unidadInstance?.unidad}"/>
</div>

