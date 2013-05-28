<%@ page import="com.redoaxaca.Caracteristica"%>



<div
	class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} required">
	<label for="caracteristica"> <g:message
			code="caracteristica.caracteristica.label" default="Caracteristica" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="caracteristica" name="caracteristica" required=""
		value="${caracteristicaInstance?.caracteristica}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
	<label for="unidad"> <g:message
			code="caracteristica.unidad.label" default="Unidad" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="unidad" name="unidad.id" from="${com.redoaxaca.Unidad.list()}" optionKey="id" required="" value="${caracteristicaInstance?.unidad?.id}" class="many-to-one"/>
	
	
		 <a class="modalbox" href="#inline">Buscar</a>
</div>

<div id="inline" class="inline">
	<div id="create-unidad" class="content scaffold-create" role="main">
		<h2>Buscar unidad</h2>
		<br>
		<h3>Ingrese una descripción de la unidad a buscar</h3>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<br> <label for="valorABuscar"> <g:message
				code="objeto.tipo.label" default="Tipo de objeto" /> <span
			class="required-indicator">*</span>
		</label>
		<g:textField name="valorABuscar" required="" value=""
			onkeyup="${remoteFunction(
					   controller:'unidad',
					   action: 'buscarUnidad',
                       update: 'tabla',
                       params: '\'valorABuscar=\' + this.value')}" />
		<g:render template="resultadosBusquedaUnidad" />
	</div>
</div>

