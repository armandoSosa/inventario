<%@ page import="com.redoaxaca.Objeto"%>

	


<div
	class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'noInventario', 'error')} ">
	<label for="noInventario"> <g:message
			code="objeto.noInventario.label" default="No Inventario" />

	</label>
	<g:textField name="noInventario"
		value="${objetoInstance?.noInventario}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	<label for="tipo"> <g:message code="objeto.tipo.label"
			default="Tipo" /> <span class="required-indicator">*</span>
	</label>
	
		
		
	<g:if test="${!idTipo}">
		<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}"
			optionKey="id" required="" value="${objetoInstance?.tipo?.id}"
			class="many-to-one"
			onchange="${remoteFunction(
					   action: 'addPlantillasAjax',
                       update: 'divplantilla1',
                       params: '\'tipo=\' + this.value')}"/>

	</g:if>
	<g:else>
		<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}"
			optionKey="id" required="" value="${idTipo}"
			class="many-to-one"
			onchange="${remoteFunction(
					   action: 'addPlantillasAjax',
                       update: 'divplantilla1',
                       params: '\'tipo=\' + this.value')}"/>
	</g:else>
	<a class="modalbox" href="#inline">Nuevo Tipo</a>
</div>


<g:render template="mostrarFormValores"/>


<div
	class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	<label for="tipoPropiedad"> <g:message
			code="objeto.tipoPropiedad.label" default="Tipo Propiedad" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="tipoPropiedad" name="tipoPropiedad.id"
		from="${com.redoaxaca.TipoPropiedad.list()}" optionKey="id"
		required="" value="${objetoInstance?.tipoPropiedad?.id}"
		class="many-to-one" />
</div>








