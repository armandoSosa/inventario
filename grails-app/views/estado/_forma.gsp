<%@ page import="com.redoaxaca.Estado" %>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="estado.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${estadoInstance?.nombre}"/>
</div>

