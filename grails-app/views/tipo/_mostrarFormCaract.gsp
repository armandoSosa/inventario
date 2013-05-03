<div id="divInfoTipoObjeto" name="divInfoTipoObjeto" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	
	<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	
		<fieldset class="form">	
			<div id="textFieldFormBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
						<label for="tipo"> <g:message code="persona.label"
								default="Tipo de objeto" /> <span class="required-indicator">*</span>
						</label>
						<g:if test="${tipoInstance}">
							<g:textField name="tipo" required="" value="${tipoInstance.descripcion}" disabled="true"/>
							<script>
								reiniciarCadenaValores();
							</script> 
						</g:if>
						<g:else>
							<g:textField name="tipo" required="" value="" disabled="true"/> 
						</g:else>

						<a class="modalbox" href="#inline">Buscar</a>
			</div>
			<br>
		</fieldset>
	</div>
	
	
</div>