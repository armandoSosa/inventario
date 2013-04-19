<div id="divplantilla1${session.numCaracteristica}" name="divplantilla1${session.numCaracteristica}" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	<g:if test="${(mostrarCaracteristicas && mostrarCaracteristicas==1) || session.mostrarCaracteristicas==1}">
		<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'noInventario', 'error')} ">
			<label for="noInventario">
				<g:message code="objeto.noInventario.label" default="No Inventario" />
				
			</label>
			<g:textField name="noInventario" value="${session.claveInventario}" disabled="true"/>
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
		
		<br><br><br>
		<fieldset class="form">	
			<legend>Agregar valores</legend>
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
				<br>
				<label for="linkNuevaCarac">
						<g:message code="objeto.noInventario.label" default="No hay características" />
				</label>
				<br>
			</g:else>
			<br>
			<!--    <a class="modalbox" href="#inline2">Nueva caracteristica</a>   -->
			<a  class="modalbox" href="#inlinee${session.numCaracteristica}" >Nueva caracteristica</a>

			
			
		</fieldset>
		
		
		
	</g:if>
	
	
	
	
		
	
		<!-- Agregar característica-->

		<div id="inlinee${session.numCaracteristica}" class="inline">
			<div id="create-caracteristica${session.numCaracteristica}" class="content scaffold-create" role="main">

				<h2>Nueva Característica</h2>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${caracteristicaInstance}">
				<ul class="errors" role="alert">
					
				</ul>
				</g:hasErrors>
				<g:render template="../caracteristica/forma2"/>
			</div>
		</div>
	
	
	
</div>