<%@ page import="com.redoaxaca.ObjetoPersona" %>
<g:setProvider library="jquery"/>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="objetoPersona.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="persona" name="persona.id" from="${com.redoaxaca.Persona.list()}" optionKey="id" required=""
              noSelection="['':'Seleccione una persona']"
              onchange="${remoteFunction (
                      controller: 'objetoPersona',
                      action: 'getObjetos',
                      params: '\'id=\' + this.value',
                      update: 'objetos'
              )}"
              value="${objetoPersonaInstance?.persona?.id}" class="many-to-one"/>	
</div>

<div id="objetos" class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'objeto', 'error')} required">	
	
</div>