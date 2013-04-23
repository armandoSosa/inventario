<%@ page import="com.redoaxaca.Persona" %>

<div id="tabla" name="formBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
			
			<fieldset class="form">
				
				
				<div id="textFieldCaract" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'numEmpleado', 'error')} ">
					<g:if test="${tipos}">
						<table>
						
							<thead>
								<tr>
									<th>
										Clave de inventario
									</th>
									<th>
										Descripción
									</th>
								</tr>
							</thead>
							<tbody>
								<g:each var="tipo" in="${tipos}">
						        	<tr onclick="${ remoteFunction (controller:'objeto', action:'mostrarFormCarac', id:tipo.id, update:'divInfoTipoObjeto', onComplete: '$(\'.inline\').fadeOut(\'fast\', function(){$(this).before(\'Tipo de objeto encontrado\');setTimeout(\'$.fancybox.close()\', 1000);});')}">
						        		<td>
						        			${tipo.claveInventario}
						        		</td>
						        		<td>
						        			${tipo.descripcion}
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