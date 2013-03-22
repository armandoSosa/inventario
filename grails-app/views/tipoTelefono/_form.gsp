<%@ page import="com.redoaxaca.TipoTelefono" %>



<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="tipoTelefono.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoTelefonoInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['tipoTelefono.id': tipoTelefonoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="tipoTelefono.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${tipoTelefonoInstance?.tipo}"/>
</div>

