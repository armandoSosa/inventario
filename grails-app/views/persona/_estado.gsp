<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudad', 'error')} required">	
	<label for="ciudad">
		<g:message code="municipio.ciudad.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${!params.idEstado}">
		<g:select id="estado" name="estado.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required=""
              noSelection="['':'Seleccione un estado']"
              onchange="${remoteFunction (
                      controller: 'persona',
                      action: 'getMunicipios',
                      params: '\'id=\' + this.value',
                      update: 'municipioDiv'
              )}"
              value="${personaInstance?.estado?.pais?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<g:select id="estado" name="estado.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required=""
              noSelection="['':'Seleccione un estado']"
              onchange="${remoteFunction (
                      controller: 'persona',
                      action: 'getMunicipios',
                      params: '\'id=\' + this.value',
                      update: 'municipioDiv'
              )}"
              value="${params.idEstado}" class="many-to-one"/>
	</g:else>
	<a class="modalbox" href="#inline">Nuevo Estado</a>	
</div>