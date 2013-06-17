<div id="list-persona" class="content scaffold-list" role="main">	
	<:if >									
										<table>
											<thead>
												<tr>
													<g:sortableColumn property="numeroEmpleado" title="${message(code: 'persona.numeroEmpleado.label', default: 'No. Empleado')}" class="tabla"/>
												
													<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" class="tabla"/>
												
													<g:sortableColumn property="paterno" title="${message(code: 'persona.paterno.label', default: 'Paterno')}" class="tabla"/>
												
													<g:sortableColumn property="materno" title="${message(code: 'persona.materno.label', default: 'Materno')}" class="tabla"/>
												
													<g:sortableColumn property="curp" title="${message(code: 'persona.curp.label', default: 'Curp')}" class="tabla"/>
												
													<g:sortableColumn property="rfc" title="${message(code: 'persona.rfc.label', default: 'Rfc')}" class="tabla"/>
												
												</tr>
											</thead>
											<tbody>
											<g:each in="${personaInstanceList}" status="i" var="personaInstance">
												<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
												
													<td class="datosTabla"><g:link action="mostrar" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "numeroEmpleado")}</g:link></td>
												
													<td class="datosTabla">${fieldValue(bean: personaInstance, field: "nombre")}</td>
												
													<td class="datosTabla">${fieldValue(bean: personaInstance, field: "paterno")}</td>
												
													<td class="datosTabla">${fieldValue(bean: personaInstance, field: "materno")}</td>
												
													<td class="datosTabla">${fieldValue(bean: personaInstance, field: "curp")}</td>
												
													<td class="datosTabla">${fieldValue(bean: personaInstance, field: "rfc")}</td>
												</tr>
											</g:each>
											</tbody>
										</table>
										<div class="pagination">
											<g:paginate total="${personaInstanceTotal}" />
										</div>																	
									</div>