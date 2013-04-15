<fieldset class="form">
	<legend>Agregar unidad</legend>
	
	<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
		<label for="unidadTexto">
			<g:message code="unidad.unidad.label" default="Unidad" />
			
		</label>
		<g:textField id="unidadTexto" name="unidadTexto" value="${unidadInstance?.unidad}"/>
		<br>
		<br>
		<fieldset class="buttons">
			<a href="javascript:void(0)" onclick="agregarUnidad();return false;">Agregar</a>
			<a href="javascript:void(0)" onclick="selectCaracteristica();return false;">Cancelar</a>
		</fieldset>
		
	</div>
</fieldset>

