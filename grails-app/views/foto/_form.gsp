<%@ page import="com.redoaxaca.Foto" %>



<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="foto.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="foto" name="foto" />
</div>

<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'personas', 'error')} ">
	<label for="personas">
		<g:message code="foto.personas.label" default="Personas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${fotoInstance?.personas?}" var="p">
    <li><g:link controller="persona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="persona" action="create" params="['foto.id': fotoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'persona.label', default: 'Persona')])}</g:link>
</li>
</ul>

</div>

