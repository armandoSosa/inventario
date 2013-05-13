<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">	
	
	
	<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudad', 'error')} required">	
		<label for="estado">
			<g:message code="municipio.ciudad.label" default="Estado" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="estado" required="" value="${estadoInstance?.nombre}" style="text-transform:uppercase;" disabled="true" class="tooltip"/>
		
		<a class="modalbox" href="#inline">Buscar</a>		
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
    <g:if test="${municipiosList}">
    	<g:select id="municipio" name="municipio.id" from="${municipiosList}" optionKey="id" required=""
                  value="${direccionInstance?.municipio?.id}" data-placeholder="Selecciona un municipio" class="chzn-select" style="width:350px;" tabindex="2"/>
                                            
    </g:if>
    <g:else>
        No hay municipios registrados para este Estado
    </g:else>     
    </div>   
</div>

<script src="${resource(dir: 'js', file: 'chosen/chosen.jquery.js')}" type="text/javascript"></script>
  <script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {no_results_text:'No se encontró ningun dato'},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>