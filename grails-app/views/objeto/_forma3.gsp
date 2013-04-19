<%@ page import="com.redoaxaca.Objeto"%>
<div id="divPrincipal" name="divPrincipal">
	forma3
	<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
		<label for="tipoSelect"> <g:message code="objeto.tipo.label"
				default="Tipo" /> <span class="required-indicator">*</span>
		</label>
		<g:if test="${!session.idTipo}">
	
			<g:select id="tipoSelect" name="tipoSelect" from="${com.redoaxaca.Tipo.list()}"
				noSelection="['':'Seleccione un tipo de objeto']"
				optionKey="id" required="" value="${objetoInstance?.tipo?.id}"
				class="many-to-one"
				onchange="${remoteFunction(
						   action: 'addPlantillasAjax3',
	                       update: 'divplantilla1'+session.numUnidades,
	                       params: '\'tipo1=\' + this.value')}"/>
	
		</g:if>
		<g:else>
			<g:select id="tipoSelect" name="tipoSelect" from="${com.redoaxaca.Tipo.list()}"
				noSelection="['':'Seleccione un tipo de objeto']"
				optionKey="id" required="" value="${session.idTipo}"
				class="many-to-one"
				onchange="${remoteFunction(
						   action: 'addPlantillasAjax3',
	                       update: 'divplantilla1'+session.numUnidades,
	                       params: '\'tipo1=\' + this.value')}"/>
		</g:else>
		<a id="tipoLabel" class="modalbox" href="#inlineTipo${session.mostrarFormValores}">Nuevo Tipo</a>
	</div>
		
	<g:render template="mostrarFormValores3"/>
	
	
		
</div>