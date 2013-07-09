<div id="list-persona" class="content scaffold-list" role="main">									
										<table>
											<thead>
												<tr>
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="numeroEmpleado" title="${message(code: 'persona.numeroEmpleado.label', default: 'No. Empleado')}" class="tabla"/>
												
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" class="tabla"/>
												
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="paterno" title="${message(code: 'persona.paterno.label', default: 'Paterno')}" class="tabla"/>
												
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="materno" title="${message(code: 'persona.materno.label', default: 'Materno')}" class="tabla"/>
												
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="curp" title="${message(code: 'persona.curp.label', default: 'Curp')}" class="tabla"/>
												
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="rfc" title="${message(code: 'persona.rfc.label', default: 'Rfc')}" class="tabla"/>
													
													<g:sortableColumn params="[tipo: tipo , persona: persona, archivado: archivado, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal]" property="direcciones.municipio.estado.nombre" title="Estado" class="tabla"/>
												
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
													
													<td class="datosTabla">${personaInstance?.direcciones?.municipio?.estado?.nombre.get(personaInstance?.direcciones?.size()-1)}</td>
												</tr>
											</g:each>
											</tbody>
										</table>
										<div class="pagination">
											<g:paginate total="${personaInstanceTotal}" />
										</div>																	
									</div>