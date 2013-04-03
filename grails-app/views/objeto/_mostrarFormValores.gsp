	
	
	
<div id="divplantilla1" name="divplantilla1" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	<g:if test="${plantillas}">
		
		<g:each var="plantilla" in="${plantillas}">
			${plantilla.caracteristica.caracteristica}:
			<g:textField name="valor" value="${objetoInstance?.valor}" />
			${plantilla.caracteristica.unidad}
			<br>
		</g:each>
		
	</g:if>
	<g:else>
		No hay
	</g:else>
	<br>
	<a class="modalbox" href="#inline2">Nueva Característica</a>
</div>