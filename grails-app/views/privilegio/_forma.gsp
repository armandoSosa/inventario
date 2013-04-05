<%@ page import="com.redoaxaca.Privilegio" %>



<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="privilegio.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${privilegioInstance?.tipo}"/>
</div>