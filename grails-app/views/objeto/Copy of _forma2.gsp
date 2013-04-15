<%@ page import="com.redoaxaca.Objeto"%>
<div id="divPrincipal" name="divPrincipal">
<div
	class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	<label for="tipo"> <g:message code="objeto.tipo.label"
			default="Tipo" /> <span class="required-indicator">*</span>
	</label>
	<g:if test="${!session.idTipo}">
	
	
		
		<g:select id="tipo${session.numTipos}" name="tipo${session.numTipos}" from="${com.redoaxaca.Tipo.list()}"
			noSelection="['':'Seleccione un tipo de objeto']"
			optionKey="id" required="" value="${objetoInstance?.tipo?.id}"
			class="many-to-one"
			onchange="${remoteFunction(
					   action: 'addPlantillasAjax2',
                       update: 'divplantilla1'+session.numUnidades,
					   onSuccess: 'divUnidad',
                       params: '\'tipo1=\' + this.value')}"/>

	</g:if>
	<g:else>
		<g:select id="tipo${session.numTipos}" name="tipo${session.numTipos}" from="${com.redoaxaca.Tipo.list()}"
			noSelection="['':'Seleccione un tipo de objeto']"
			optionKey="id" required="" value="${session.idTipo}"
			class="many-to-one"
			onchange="${remoteFunction(
					   action: 'addPlantillasAjax2',
                       update: 'divplantilla1'+session.numUnidades,
                       params: '\'tipo1=\' + this.value')}"/>
	</g:else>
	<a class="modalbox" href="#inline">Nuevo Tipo</a>
</div>




<g:render template="mostrarFormValores2"/>







<!-- Agregar tipo de objeto -->
		<div id="inline">
			<div id="create-tipo" class="content scaffold-create" role="main">
				<h1>Nuevo Tipo</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${tipoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${tipoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form action="save_tipo2" >
					<fieldset class="form">
						<g:render template="../tipo/forma2"/>
					</fieldset>
					
					<fieldset class="buttons">
						<a name="create" class="save" href="javascript:void(0)" onclick="submitTipo();return false;">Crear</a>
						<!--<g:submitButton name="create" class="save" value="Crear" />-->
					</fieldset>
					<fieldset class="buttons">
						<!--<g:submitButton name="create" class="save" value="Crear" />-->
					</fieldset>
				</g:form>
			</div>
		</div>
</div>