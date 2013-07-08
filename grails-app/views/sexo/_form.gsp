<%@ page import="com.redoaxaca.Sexo" %>



<div class="fieldcontain ${hasErrors(bean: sexoInstance, field: 'sexo', 'error')} ">
	<label for="sexo">
		<g:message code="sexo.sexo.label" default="Sexo" />
		
	</label>
	<g:textField name="sexo" value="${sexoInstance?.sexo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sexoInstance, field: 'personas', 'error')} ">
	<label for="personas">
		<g:message code="sexo.personas.label" default="Personas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sexoInstance?.personas?}" var="p">
    <li><g:link controller="persona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="persona" action="create" params="['sexo.id': sexoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'persona.label', default: 'Persona')])}</g:link>
</li>
</ul>

</div>

