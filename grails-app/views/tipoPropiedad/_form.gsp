<%@ page import="com.redoaxaca.TipoPropiedad" %>



<div class="fieldcontain ${hasErrors(bean: tipoPropiedadInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tipoPropiedad.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipoPropiedadInstance?.nombre}"/>
</div>



