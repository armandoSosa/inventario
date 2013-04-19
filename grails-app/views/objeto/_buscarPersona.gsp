













		<!-- buscar persona -->
		<div id="inline" class="inline">
			<div id="create-tipo" class="content scaffold-create" role="main">
				<h2>Buscar persona</h2>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${tipoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${tipoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				
				<br>
				<label for="valorABuscar"> <g:message code="objeto.tipo.label"
						default="Número de empleado" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="valorABuscar" required="" value=""
				    onkeyup="${remoteFunction(
					   controller='objeto',
					   action: 'buscarPersona',
                       update: 'tabla',
                       params: '\'valorABuscar=\' + this.value')}"/> 
				<g:render template="resultadosBusquedaPersona"/>
			</div>
		</div>
		
		<g:render template="infoPersonaEncontrada"/>
		


