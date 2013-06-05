<%@ page import="com.redoaxaca.Plantilla" %>


<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'tipo', 'error')} required centrado">
	<label for="tipo">
		<g:message code="plantilla.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}" optionKey="id" required="" value="${tipoInstance?.id}" class="many-to-one" disabled="true"/>
	<input type="hidden" name="idTipo" value="${tipoInstance?.id}"/>
</div>



<br>
<br>


<div id="content" class="centrado">
      <select id="countries" class="multiselect" multiple="multiple" name="caracteristicas">
      		<g:if test="${caracteristicas}">
				<g:each var="caracteristica" in="${caracteristicas}">
					<option value="${caracteristica.id}">
						${caracteristica} : ${caracteristica.unidad.unidad}
					</option>
				</g:each>
			</g:if>
			<!-- Agregamos las características que ya tiene asignadas el tipo de objeto -->
			 <g:if test="${plantillas}">
				<g:each var="plantilla" in="${plantillas}">
					<option value="${plantilla.id}"  selected="selected" disabled>
						${plantilla.caracteristica} : ${plantilla.caracteristica.unidad.unidad}
					</option>
				</g:each>
			</g:if>
      </select>
        
</div>

