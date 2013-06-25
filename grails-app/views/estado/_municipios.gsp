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

<script src="${resource(dir: 'js', file: 'chosen/chosen.jquery.js')}" type="text/javascript"></script>
  <script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {no_results_text:'No se encontró algún dato'},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'No se encontró algún dato'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
