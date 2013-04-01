<%@ page import="com.redoaxaca.Municipio" %>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="municipio.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${!idEstado}">
		<g:select id="ciudad" name="ciudad.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.ciudad?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<g:select id="ciudad" name="ciudad.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required="" value="${idEstado}" class="many-to-one"/>
	</g:else>
	<a class="modalbox" href="#inline">Nuevo Estado</a>
</div>


<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="municipio.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${municipioInstance?.nombre}"/>
</div>

