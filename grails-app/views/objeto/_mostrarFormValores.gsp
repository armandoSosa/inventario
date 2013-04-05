<div id="divplantilla1" name="divplantilla1" class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	<g:if test="${mostrarCaracteristicas && mostrarCaracteristicas==1}">
		<fieldset class="form">	
			<legend>Agregar valores al objeto</legend>
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
			<a id="linkNuevaCarac" name="linkNuevaCarac" class="modalbox" href="#inline2" >Nueva caracteristica</a>

			
			
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
				<g:render template="../caracteristica/forma"/>
				
				
			</div>
		</div>
	
	
	
</div>