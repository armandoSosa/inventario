<%@ page import="com.redoaxaca.TipoUsuario" %>



<div class="fieldcontain ${hasErrors(bean: tipoUsuarioInstance, field: 'privilegioTipoUsuarios', 'error')} ">
	<label for="privilegioTipoUsuarios">
		<g:message code="tipoUsuario.privilegioTipoUsuarios.label" default="Privilegio Tipo Usuarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoUsuarioInstance?.privilegioTipoUsuarios?}" var="p">
    <li><g:link controller="privilegioTipoUsuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="privilegioTipoUsuario" action="create" params="['tipoUsuario.id': tipoUsuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'privilegioTipoUsuario.label', default: 'PrivilegioTipoUsuario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoUsuarioInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="tipoUsuario.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${tipoUsuarioInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoUsuarioInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="tipoUsuario.usuarios.label" default="Usuarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoUsuarioInstance?.usuarios?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="usuario" action="create" params="['tipoUsuario.id': tipoUsuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</li>
</ul>

</div>

