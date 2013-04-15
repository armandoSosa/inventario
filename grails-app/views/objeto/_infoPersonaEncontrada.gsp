<div id="divInfoPersona">



	<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	
		<fieldset class="form">
		
		
			
			<div id="textFieldFormBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
						<label for="persona"> <g:message code="persona.label"
								default="Número de Empleado" /> <span class="required-indicator">*</span>
						</label>
						<g:if test="${persona}">
							<g:textField name="persona" required="" value="${persona.numeroEmpleado}" disabled="true"/> 
						</g:if>
						<g:else>
							<g:textField name="persona" required="" value="" disabled="true"/> 
						</g:else>

						<a class="modalbox" href="#inline">Buscar</a>
						
			</div>
			<br>
		</fieldset>
	</div>

	<fieldset class="form">
		<g:if test="${persona}">
			${persona.nombre }
		</g:if>
		<g:else>
			No hay datos de la persona
		</g:else>
	</fieldset>
		
</div>