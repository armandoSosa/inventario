
<div
	class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	<label for="tipo"> <g:message code="objeto.tipo.label"
			default="Tipo" /> <span class="required-indicator">*</span>
	</label>
		
	<g:if test="${!idTipo}">
	
	
		
		<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}"
			noSelection="['':'Seleccione un tipo de objeto']"
			optionKey="id" required="" value="${objetoInstance?.tipo?.id}"
			class="many-to-one"
			onchange="${remoteFunction(
					   action: 'listadoTipoAjax',
                       update: 'tabla',
					   onSuccess: 'tabla',
                       params: '\'tipo=\' + this.value')}"/>

	</g:if>
	<g:else>
		<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}"
			noSelection="['':'Seleccione un tipo de objeto']"
			optionKey="id" required="" value="${idTipo}"
			class="many-to-one"
			onchange="${remoteFunction(
					   action: 'listadoTipoAjax',
                       update: 'tabla',
                       params: '\'tipo=\' + this.value')}"/>
	</g:else>
	<br>
	<br>
</div>


<g:render template="tablaPorTipo"/>
