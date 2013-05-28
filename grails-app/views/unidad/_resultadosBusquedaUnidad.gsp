<%@ page import="com.redoaxaca.Persona" %>

<div id="tabla" name="formBuscar" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
			
			<fieldset class="form">
				<div id="textFieldCaract" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'numEmpleado', 'error')} ">
					<g:if test="${tipos}">
						<table>
						
							<thead>
								<tr>
									<th>
										id
									</th>
									<th>
										Unidad
									</th>
								</tr>
							</thead>
							<tbody>
								<g:each var="tipo" in="${tipos}">
						        	<!-- <tr onclick="${ remoteFunction (onComplete: '$(\'.inline\').fadeOut(\'fast\', function(){$(this).before(\'Unidad encontrada\');setTimeout(\'$.fancybox.close()\', 1000);});$(\'#unidad\').val(\'hola\');')}"> -->
						        	<tr onclick="$('.inline').fadeOut('fast', function(){$(this).before('Unidad encontrada');setTimeout('$.fancybox.close()', 1000);});$('#unidad').val('${tipo.id}');">
						        		<td>
						        			${tipo.id}
						        		</td>
						        		<td>
						        			${tipo.unidad}
						        		</td>
						            </tr>
						        </g:each>
							
							</tbody>
							
					       
					        
					       
						</table>
					</g:if>
					<g:else>
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
						</table>
					</g:else>
					
				</div>
			</fieldset>
</div>