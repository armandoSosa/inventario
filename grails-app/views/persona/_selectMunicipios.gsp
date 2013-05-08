<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">	
	<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
    <g:if test="${municipiosList}">
        <g:select id="municipio" name="municipio.id" from="${municipiosList}" optionKey="id" required=""
                  value="${direccionInstance?.municipio?.id}" class="many-to-one"/>
    </g:if>
    <g:else>
        No hay municipios registrados para este Estado        
    </g:else>    
    
    <!-- hidden inline form -->
		<div id="inline2">		
			<div id="create-municipio" class="content scaffold-create" role="main">
				<h1>Nuevo Municipio</h1>								
				<g:form action="save_municipio_persona" controller="municipio" >
					<fieldset class="form">
						<g:render template="../municipio/forma"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
</div>