<%@ page import="com.redoaxaca.Caracteristica" %>


<div id="divUnidad" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">

	<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
		<label for="caracteristica">
			<g:message code="caracteristica.caracteristica.label" default="Caracteristica" />
			
		</label>
		<g:if test="${caracteristica}">
			<g:textField id="caracteristica" name="caracteristica" value="${caracteristica}"/>
		</g:if>
		<g:else>
			<g:textField id="caracteristica" name="caracteristica" value="${caracteristicaInstance?.caracteristica}"/>
		</g:else>
		
	</div>

	
	
	<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
		<g:if test="${agregarUnidad && agregarUnidad=='2'}">
				<g:render template="../unidad/forma"/>
			
				
		</g:if>
		<g:else>
			<label for="unidad">
				<g:message code="caracteristica.unidad.label" default="Unidad" />
				<span class="required-indicator">*</span>
			</label>
			
			<g:select id="unidad" name="unidad.id" from="${com.redoaxaca.Unidad.list()}" optionKey="id" required="" value="${caracteristicaInstance?.unidad?.id}" class="many-to-one"/>
	        <a href="javascript:void(0)" onclick="addCaracteristica();return false;">Nueva unidad</a>
		</g:else>
	</div>

	
	
	
	
</div>



