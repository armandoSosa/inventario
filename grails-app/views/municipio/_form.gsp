<%@ page import="com.redoaxaca.Municipio" %>



<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="municipio.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ciudad" name="ciudad.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.ciudad?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'direcciones', 'error')} ">
	<label for="direcciones">
		<g:message code="municipio.direcciones.label" default="Direcciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${municipioInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="direccion" action="create" params="['municipio.id': municipioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="municipio.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${municipioInstance?.nombre}"/>
</div>

