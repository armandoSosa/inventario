<div id="objetos" class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'objeto', 'error')} required">
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