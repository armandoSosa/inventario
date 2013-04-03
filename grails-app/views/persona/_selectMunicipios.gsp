<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
    <g:if test="${municipiosList}">
        <g:select id="estado" name="estado.id" from="${municipiosList}" optionKey="id" required=""
                  value="${direccionInstance?.municipio?.id}" class="many-to-one"/>
    </g:if>
    <g:else>
        No hay municipios registrados para este Estado
    </g:else>
    <a class="modalbox" href="#inline2">Nuevo Municipio</a>
</div>