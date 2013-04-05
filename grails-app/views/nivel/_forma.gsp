<%@ page import="com.redoaxaca.Nivel" %>



<div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'nivel', 'error')} ">
	<label for="nivel">
		<g:message code="nivel.nivel.label" default="Nivel" />
		
	</label>
	<g:textField name="nivel" value="${nivelInstance?.nivel}"/>
</div>

