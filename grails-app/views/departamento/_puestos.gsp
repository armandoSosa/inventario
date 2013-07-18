<div id="puestosDiv" class="fieldcontain ${hasErrors(bean: puestoPersonaInstance, field: 'puesto', 'error')} required">		
		<label for="puesto">
			<g:message code="puestoPersona.puesto.label" default="Puesto" />
			<span class="required-indicator">*</span>
		</label>
		<g:if test="${puestosList}">
		<g:select id="puesto" name="puesto.id" from="${puestosList}" optionKey="id" required="" value="${puestoPersonaInstance?.puesto?.id}" class="many-to-one" data-placeholder="Seleccione un puesto" class="chzn-select" style="width:350px;" tabindex="2"/>
		</g:if>
		<g:else>
			No existen puestos disponibles para este departamento
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
