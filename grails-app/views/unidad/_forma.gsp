<fieldset class="form">
	<legend>Agregar unidad</legend>
	<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
		<label for="unidad">
			<g:message code="unidad.unidad.label" default="Unidad" />
			
		</label>
		<g:textField name="unidad" value="${unidadInstance?.unidad}"/>
		<a href="javascript:void(0)" onclick="selectCaracteristica();return false;">Cancelar</a>
	</div>
</fieldset>


