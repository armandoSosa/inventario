<%@ page import="com.redoaxaca.Persona" %>

<div name="formBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'estado', 'error')} required">
			
			<fieldset class="form">
				
				
				<div id="textFieldCaract" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'numEmpleado', 'error')} ">
					<g:if test="${tipos}">
						<table>
						
							<thead>
								<tr>
									<th>
										Estado
									</th>
									
								</tr>
							</thead>
							<tbody>
								<g:each var="tipo" in="${tipos}">
						        	<tr onclick="${ 
										remoteFunction (
										controller:'estado', 
										action:'mostrarMunicipios', 
										id:tipo.id, 
										update:'procedencia', 
										onComplete: '$(\'.inline\').fadeOut(\'fast\', function(){$(this).before(\'Estado encontrado\');setTimeout(\'$.fancybox.close()\', 1000);});')}">
						        		
						        		<td>
						        			${tipo.nombre}
						        		</td>
						        		
						            </tr>
						        </g:each>
							
							</tbody>
							
					       
					        
					       
						</table>
					</g:if>
					<g:else>
						No hay ningún dato
					</g:else>
					
				</div>
			</fieldset>
</div>