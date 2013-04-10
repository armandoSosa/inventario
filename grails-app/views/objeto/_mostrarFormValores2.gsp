<div id="divplantilla1" name="divplantilla1" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	
	
	
	
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
			<g:select id="tipoPropiedad" name="tipoPropiedad.id"
				from="${com.redoaxaca.TipoPropiedad.list()}" optionKey="id"
				required="" value="${session.tipoPropiedad}"
				onChange="${session.tipoPropiedad=this.value }"
				class="many-to-one" />
		</div>
		
		
		<fieldset class="form">	
			<legend>Agregar valores</legend>
			<br>
			<g:if test="${plantillas}">
					
				<g:each var="plantilla" in="${plantillas}">
					<label for="valor${plantilla.id}">
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
			<a  class="modalbox" href="#inline2" >Nueva caracteristica</a>

			
			
		</fieldset>
		
		
		
	</g:if>
	
	
	
	
	
	
	<!-- Agregar característica-->
		<div id="inline2">
			<div id="create-caracteristica" class="content scaffold-create" role="main">
				<h1>Nueva Característica</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${caracteristicaInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${caracteristicaInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				
				<g:render template="../caracteristica/forma2"/>

			</div>
		</div>
	
	
	
</div>