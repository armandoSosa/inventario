<div id="divExistencia" name="divExistencia" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	
		<fieldset class="form">	
			<g:if test="${tipoProbable}">
				Existe
			</g:if>
			<g:else>
				No existe
			</g:else>
		</fieldset>
</div>