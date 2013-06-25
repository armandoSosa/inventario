<%@ page import="com.redoaxaca.Plantilla" %>


<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'tipo', 'error')} required centrado">
	<label for="tipo">
		<g:message code="plantilla.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}" optionKey="id" required="" value="${idTipo}" class="many-to-one" disabled="true"/>
	<input type="hidden" name="idTipo" value="${idTipo}"/>
</div>



<br>
<br>


<div id="content" class="centrado">
      <select id="countries" class="multiselect" multiple="multiple" name="caracteristicas">
      		<g:if test="${caracteristicas}">
      			<g:each var="caracteristicaUnidad" in="${caracteristicas}">
					<option value="${caracteristicaUnidad.id}">
						${caracteristicaUnidad.id} : ${caracteristicaUnidad.caracteristica} : ${caracteristicaUnidad.unidad.unidad}
					</option>
				</g:each>
			</g:if>
			<!-- Agregamos las características que ya tiene asignadas el tipo de objeto -->
			 <g:if test="${caracteristicasActuales}">
			 	<g:each var="caracteristicaUnidad" in="${caracteristicasActuales}">
					<option value="${caracteristicaUnidad.id}" selected="selected" class="tooltip" title="">
						${caracteristicaUnidad.id} : ${caracteristicaUnidad.caracteristica} : ${caracteristicaUnidad.unidad.unidad}
					</option>
				</g:each>
			</g:if>
      </select>
        
</div>

