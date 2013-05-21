<div id="divInfoTipoObjeto" name="divInfoTipoObjeto" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	
	<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	
		<fieldset class="form">	
			<div id="textFieldFormBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
						<label for="tipo"> <g:message code="persona.label"
								default="Tipo de objeto" /> <span class="required-indicator">*</span>
						</label>
						<g:if test="${tipoInstance}">
							<g:textField name="tipo" required="" value="${tipoInstance.descripcion}" disabled="true"/>
							<script>
								reiniciarCadenaValores();
							</script> 
						</g:if>
						<g:else>
							<g:textField name="tipo" required="" value="" disabled="true"/> 
						</g:else>

						<a class="modalbox" href="#inline">Buscar</a>
			</div>
			<br>
		</fieldset>
	</div>
	
	
	<g:if test="${claveInventario}">
		<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'noInventario', 'error')} ">
			<label for="noInventario">
				<g:message code="objeto.noInventario.label" default="No Inventario" />
				
			</label><span class="required-indicator">*</span>
			<g:textField name="noInventario" value="${claveInventario}" disabled="true"/>
		</div>
		
		<div
			class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
			<label for="tipoPropiedad"> <g:message
					code="objeto.tipoPropiedad.label" default="Tipo Propiedad" /> <span
				class="required-indicator">*</span>
			</label>
			<g:select id="tipoPropiedad" name="tipoPropiedad"
				from="${com.redoaxaca.TipoPropiedad.list()}" optionKey="id"
				required="" value="${session.tipoPropiedad}"
				onChange="${session.tipoPropiedad=this.value }"
				class="many-to-one" />
		</div>
	</g:if>
	
	
	
	<g:if test="${claveInventario}">
		<br><br><br>
		<fieldset class="form">	
			<!--  <legend>Agregar valores</legend> -->
			<br>
			<br>
		
			<g:if test="${plantillas}">
				<g:each var="plantilla" in="${plantillas}">
					<label for="${session.numCaracteristica}valor${plantilla.id}">
						<g:message code="objeto.noInventario.label" value="${plantilla.caracteristica.caracteristica}" default="${plantilla.caracteristica.caracteristica}" />
					</label>
					<g:textField id="valor${plantilla.id}" name="valor${plantilla.id}" value="${objetoInstance?.valor}" onChange="generarCadenaValores('valor${plantilla.id}')" />
					${plantilla.caracteristica.unidad}	
					<br>
					<br>
				</g:each>
				
			</g:if>
			<g:else>
				<label for="linkNuevaCarac">
					<g:message code="objeto.noInventario.label" default="No hay características" />
				</label>
			</g:else>
		</fieldset>
		<br>
		<br>
		
		<fieldset class="buttons">
			<a name="create" class="save" href="javascript:void(0)" onclick="submitObjeto();return false;">Crear Objeto</a>
		</fieldset>
		
		
	</g:if>
	
	
	
	
	
	
	
	
	
	
	
	
</div>