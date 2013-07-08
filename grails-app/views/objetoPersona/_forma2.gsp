<%@ page import="com.redoaxaca.ObjetoPersona" %>
<g:setProvider library="jquery"/>

<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="objetoPersona.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>	
	<g:textField name="persona" value="${personaInstance}" disabled="true"/>
	<g:hiddenField name="persona.id" value="${personaInstance?.id}"/>	
</div>
<br>
<div id="objetos"></div>
<div id="content" class="centrado">
      <select id="countries" class="multiselect" multiple="multiple" name="caracteristicas">
      		<g:if test="${objetosList}">
				<g:each var="objeto" in="${objetosList}">
					<option value="${objeto.id}">
						${objeto.noInventario} : ${objeto.tipo.descripcion}
					</option>
				</g:each>
			</g:if>
			<!-- Agregamos las características que ya tiene asignadas el tipo de objeto -->
			 <g:if test="${plantillas}">
				<g:each var="plantilla" in="${plantillas}">
					<option value="${plantilla.id}"  selected="selected" disabled>
						${plantilla.caracteristica}
					</option>
				</g:each>
			</g:if>
      </select>
        
</div>