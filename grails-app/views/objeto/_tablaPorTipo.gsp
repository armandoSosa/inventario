		<div id="tabla">
			<g:if test="${objetos}">
				<table>
				
					<thead>
						<tr>
							<th>
								No. Inventario
							</th>
							<g:each var="valor" in="${objetoMayor.valores}">
								<th>
									${valor.plantilla.caracteristica}
								</th>
					        </g:each>
						</tr>
					</thead>
					<tbody>
						<g:each var="objetoInstance" in="${objetos}">
				        	<tr>
				        		<td>
				        			<g:link action="show" id="${objetoInstance.noInventario}">${objetoInstance.noInventario}</g:link>
				        		
				        		</td>
								<g:each var="valorMayor" in="${objetoMayor.valores}">
									<td>	
										<g:each var="valor" in="${objetoInstance.valores}">	
											<g:if test="${valorMayor.plantilla.caracteristica.caracteristica == valor.plantilla.caracteristica.caracteristica}">
												${valor} ${valor.plantilla.caracteristica.unidad}
			   								</g:if>
										</g:each>
									</td>        
					            </g:each>
				            </tr>
				        </g:each>
					
					</tbody>
					
			       
			        
			       
				</table>
			</g:if>
			<g:else>
				No hay ningún dato
			</g:else>
				

		
		</div>