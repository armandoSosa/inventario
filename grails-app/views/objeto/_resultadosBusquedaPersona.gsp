<%@ page import="com.redoaxaca.Persona" %>




<div id="tabla" name="formBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
			
			<fieldset class="form">
				
				
				<div id="textFieldCaract" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'numEmpleado', 'error')} ">
					<g:if test="${personas}">
						<table>
						
							<thead>
								<tr>
									<th>
										No. Empleado
									</th>
									<th>
										Nombre
									</th>
									<th>
										Fotografía
									</th>
		
								</tr>
							</thead>
							<tbody>
								<g:each var="persona" in="${personas}">
						        	<tr>
						        		<td>
						        			<g:remoteLink action="infoPersona" id="${persona.numeroEmpleado}" update="divInfoPersona"
						        			onComplete="\$('.inline').fadeOut('fast', function(){
						\$(this).before('Persona encontrada');
						setTimeout('\$.fancybox.close()', 1000);
						
					});">${persona.numeroEmpleado}</g:remoteLink>
						        		</td>
						        		<td>
						        			${persona.nombre} ${persona.paterno} ${persona.materno}
						        		</td>
						        		<td>
						        			<g:if test="${persona?.foto}">
											<li class="fieldcontain">
												<span id="foto-label" class="property-label"><g:message code="persona.foto.label" default="Foto" /></span>
												<img src="<g:createLink controller='objeto' action='renderImage' id="${persona.id}"/>"/>
											</li>
											</g:if>
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