<div id="objetos" class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'objeto', 'error')} required">

	<div id="content" class="centrado">
      <select id="countries" class="multiselect" multiple="multiple" name="caracteristicas">
      		<g:if test="${objetosList}">
				<g:each var="caracteristica" in="${objetosList}">
					<option value="${caracteristica.id}">
						${caracteristica}
					</option>
				</g:each>
			</g:if>
			<!-- Agregamos las características que ya tiene asignadas el tipo de objeto -->
			 <g:if test="${plantillas}">
				<g:each var="plantilla" in="${plantillas}">
					<option value="${plantilla.id}"  selected="selected" disabled>
						${plantilla.caracteristica}
					</option>
				</g:each>
			</g:if>
      </select>
        
</div>


	<g:if test="${objetosList}">	
	<table>
		<tbody>			
			<tr class="prop">
				<td valign="top" class="name"><label for="objetos">Objeto:</label></td>
				<td valign="top" class="value ${hasErrors(bean:personaInstance,field:'persona','errors')}">				
				<g:render template="objetos" model="['personaInstance':personaInstance, 'objetosList':objetosList]" />				
				</td>
			</tr>
		</tbody>
	</table>
	</g:if>
	<g:else>
		No hay objetos disponibles
	</g:else>
</div>