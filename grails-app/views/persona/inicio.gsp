<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro"/>
		<title>Bienvenido a Inventarios</title>
	</head>
	<body class="modern-ui">
		<br><br>
	    <div class="page-region">
               <div class="page-region-content">
               		<div id="status" role="complementary">
						<div id="controller-list" role="navigation">
							<h2>Entidades</h2>
							<ul>
								<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
									<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
								</g:each>
							</ul>
						</div>
						
					</div>
					
					<div id="page-body" role="main">
						<h1 class="fg-color-blueLight">Bienvenido a Inventarios</h1>
						
						
						<div>
                            <div class="hero-unit">
                                <!--<img src="images/windows-8-metro.jpg" class="place-right" style="width: 210px;"/>-->
                                 <div style="">
                                    <h2>Lista de Empleados</h2><br>

                                    <div id="list-persona" class="content scaffold-list" role="main">
										
										<g:if test="${flash.message}">
										<div class="message" role="status">${flash.message}</div>
										</g:if>
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
                                </div>
                            </div>
                        </div>                        
					</div>
               </div>
        </div>
		
	</body>
</html>
