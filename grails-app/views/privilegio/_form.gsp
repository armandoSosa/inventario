<%@ page import="com.redoaxaca.Privilegio" %>



<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'privilegioTipoUsuarios', 'error')} ">
	<label for="privilegioTipoUsuarios">
		<g:message code="privilegio.privilegioTipoUsuarios.label" default="Privilegio Tipo Usuarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${privilegioInstance?.privilegioTipoUsuarios?}" var="p">
    <li><g:link controller="privilegioTipoUsuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="privilegioTipoUsuario" action="create" params="['privilegio.id': privilegioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'privilegioTipoUsuario.label', default: 'PrivilegioTipoUsuario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="privilegio.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${privilegioInstance?.tipo}"/>
</div>

