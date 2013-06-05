
<div id="tabla" name="formBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
			
			<fieldset class="form">
			
			
			
					<g:if test="${objetos}">
						<table>
						
							<thead>
								<tr>
									<th>
										No. Inventario
									</th>
									<g:if test="${objetoMayor?.valores}">
										<g:each var="valor" in="${objetoMayor.valores}">
											<th>
												${valor.plantilla.caracteristica}
											</th>
								        </g:each>
									</g:if>
								</tr>
							</thead>
							<tbody>
								<g:each var="objetoInstance" in="${objetos}">
						        	<tr>
						        		<td>
						        			<g:link action="mostrar" id="${objetoInstance.id}">${objetoInstance.noInventario}</g:link>
						        		
						        		</td>
						        		<g:if test="${objetoMayor?.valores}">
						        			<g:each var="valorMayor" in="${objetoMayor.valores}">
												<td>	
													<g:each var="valor" in="${objetoInstance.valores}">	
														<g:if test="${valorMayor.plantilla.caracteristica.caracteristica == valor.plantilla.caracteristica.caracteristica}">
															${valor} ${valor.plantilla.caracteristica.unidad}
						   								</g:if>
													</g:each>
												</td>        
								            </g:each>
										</g:if>
										
						            </tr>
						        </g:each>
							
							</tbody>
							
					       
					        
					       
						</table>
					</g:if>
					<g:else>
						No hay ningún dato
					</g:else>
						
			</fieldset>
</div>