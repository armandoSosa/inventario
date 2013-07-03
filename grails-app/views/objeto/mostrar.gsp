
<%@ page import="com.redoaxaca.Objeto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'objeto.label', default: 'Objeto')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>



<link rel="stylesheet"
	href="${resource(dir: 'js', file: 'chosen/chosen.css')}"
	type="text/css">
<script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}"
	type="text/javascript" charset="utf-8"></script>

<script>

		
		
		function procedimientoAgregarPersona(primera) {
			if(primera) {
				$('#agregarPersona').show();
				$('#btnAgregar').hide();
			} else {
				var respuesta = confirm("Ya existe un arrendatario. ¿Desea darlo de baja y asignar un nuevo arrendatario?");
				if(respuesta) {
					$('#agregarPersona').show();
					$('#btnAgregar').hide();
				}
			}
			
		}

		function darDeBaja() {
			var respuesta = confirm("¿Está seguro que desea dar de baja al arrendatario?");
			if(respuesta) {
				$('#formBaja').submit();
			}
		}
	</script>


</head>
<body>
	<a href="#show-objeto" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="menu">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="insertar5">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-objeto" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list objeto">

			<g:if test="${objetoInstance?.noInventario}">
				<li class="fieldcontain"><span id="noInventario-label"
					class="property-label"><g:message
							code="objeto.noInventario.label" default="No Inventario" /></span> <span
					class="property-value" aria-labelledby="noInventario-label"><g:fieldValue
							bean="${objetoInstance}" field="noInventario" /></span></li>
			</g:if>

			<g:if test="${objetoInstance?.objetosDepartamento}">
				<li class="fieldcontain"><span id="objetosDepartamento-label"
					class="property-label"><g:message
							code="objeto.objetosDepartamento.label"
							default="Objetos Departamento" /></span> <g:each
						in="${objetoInstance.objetosDepartamento}" var="o">
						<span class="property-value"
							aria-labelledby="objetosDepartamento-label"><g:link
								controller="objetoDepartamento" action="show" id="${o.id}">
								${o?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

			<g:if test="${objetoInstance?.tipo}">
				<li class="fieldcontain"><span id="tipo-label"
					class="property-label"><g:message code="objeto.tipo.label"
							default="Tipo" /></span> <span class="property-value"
					aria-labelledby="tipo-label"><g:link controller="tipo"
							action="mostrar" id="${objetoInstance?.tipo?.id}">
							${objetoInstance?.tipo?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${objetoInstance?.tipoPropiedad}">
				<li class="fieldcontain"><span id="tipoPropiedad-label"
					class="property-label"><g:message
							code="objeto.tipoPropiedad.label" default="Tipo Propiedad" /></span> <span
					class="property-value" aria-labelledby="tipoPropiedad-label"><g:link
							controller="tipoPropiedad" action="show"
							id="${objetoInstance?.tipoPropiedad?.id}">
							${objetoInstance?.tipoPropiedad?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>


			<br>
			<br>
			<br>







			<li class="fieldcontain"><span id="valores-label"
				class="property-label"><h2>Características</h2></span> <br> <br>
				<br>
				<table>
					<tr>
						<th>Característica</th>
						<th>Valor</th>
						<th>Unidad</th>
					</tr>
					<g:if test="${valores}">
						<g:each in="${valores}" var="v">
							<tr>

								<td>
									${v?.plantilla?.caracteristicaUnidad?.caracteristica}
								</td>
								<td><span class="property-value"
									aria-labelledby="valores-label"><g:link
											controller="valor" action="show" id="${v.id}">
											${v?.encodeAsHTML()}
										</g:link></td>
								<td>
									${v?.plantilla?.caracteristicaUnidad?.unidad}
								</td>
								</span>
							</tr>
						</g:each>
					</g:if>
					<g:if test="${plantillas}">
						<g:each in="${plantillas}" var="p">
							<tr>
								<td>
									${p?.caracteristicaUnidad?.caracteristica}
								</td>
								<td><center>-</center></td>
								<td>
									${p?.caracteristicaUnidad?.unidad}
								</td>
							</tr>
						</g:each>
					</g:if>





				</table></li>

			<br>
			<br>
			<br>

			<li class="fieldcontain"><span id="valores-label"
				class="property-label"><h2>Arrendatarios</h2></span> <br> <br>
				<br> <g:if
					test="${historiaObjetosPersona || ultimoObjetoPersona}">







					<div id="historiaArrendatarios" hidden="true">

						<table>
							<tr>
								<th>Fecha inicio</th>
								<th>Persona</th>
								<th>Fecha fin</th>
							</tr>


							<tr>
								<td>
										<g:formatDate format="dd-MM-yyyy hh:mm:ss"
											date="${ultimoObjetoPersona?.fechaInicio}" />
									</td>

								<td><g:link controller="persona" action="mostrar"
										id="${ultimoObjetoPersona?.persona?.id}">
										${ultimoObjetoPersona?.persona}
									</g:link></td>

								<td><g:if test="${ultimoObjetoPersona?.fechaFin}">
										
											<g:formatDate format="dd-MM-yyyy hh:mm:ss"
												date="${ultimoObjetoPersona?.fechaFin}" />
										
									</g:if> <g:else>
										
										<input type="button" value="Dar de baja"
											onClick="darDeBaja();" />
									</g:else></td>


							</tr>
							<g:each in="${historiaObjetosPersona}" var="v">
								<tr>
									<td>
											<g:formatDate format="dd-MM-yyyy hh:mm:ss"
												date="${v?.fechaInicio}" />
										</td>
									<td><g:link controller="persona" action="mostrar"
											id="${v.persona.id}">
											${v?.persona}
										</g:link></td>

									<td>
											<g:formatDate format="dd-MM-yyyy hh:mm:ss"
												date="${v?.fechaFin}" />
										</td>
								</tr>
							</g:each>
						</table>


						<span class="property-value" aria-labelledby="valores-label">
							<input type="button" value="Ocultar historia"
							onClick="$('#historiaArrendatarios').hide();  $('#tablaActual').show();" />
						</span>
					</div>




					<div id="tablaActual">
						<table>
							<tr>
								<th>Fecha inicio</th>
								<th>Persona</th>
								<th>Fecha fin</th>
							</tr>


							<tr>
								<td>
										<g:formatDate format="dd-MM-yyyy hh:mm:ss"
											date="${ultimoObjetoPersona?.fechaInicio}" />
									</td>

								<td><g:link controller="persona" action="mostrar"
										id="${ultimoObjetoPersona?.persona?.id}">
										${ultimoObjetoPersona?.persona}
									</g:link></td>

								<td><g:if test="${ultimoObjetoPersona?.fechaFin}">
										
											<g:formatDate format="dd-MM-yyyy hh:mm:ss"
												date="${ultimoObjetoPersona?.fechaFin}" />
										
									</g:if> <g:else>
										
										<input type="button" value="Dar de baja"
											onClick="darDeBaja();" />

									</g:else></td>



							</tr>
						</table>

						<g:if test="${historiaObjetosPersona}">
							<span class="property-value" aria-labelledby="valores-label">
								<input id="btnVerHistoria" type="button" value="Ver historia"
								onClick="$('#historiaArrendatarios').show(); $('#tablaActual').hide();" />
							</span>
						</g:if>

					</div>

					<g:form id="formBaja" name="formBaja" action="darDeBajaArrendatario" hidden="true">
						<input type="text" name="objetoPersona.id"
							value="${ultimoObjetoPersona.id}" />
					</g:form>






				</g:if> <g:else>
					No hay arrendatarios registrados
				</g:else></li>





			<li class="fieldcontain"><span class="property-value"
				aria-labelledby="valores-label"> <g:if
						test="${ultimoObjetoPersona!=null && ultimoObjetoPersona.fechaFin==null}">
						<input id="btnAgregar" name="btnAgregar" type="button"
							value="Agregar persona"
							onClick="procedimientoAgregarPersona(false);" />
					</g:if> <g:else>
						<input id="btnAgregar" name="btnAgregar" type="button"
							value="Agregar persona"
							onClick="procedimientoAgregarPersona(true);" />
					</g:else>


			</span></li>





			<li class="fieldcontain"><span class="property-value"
				aria-labelledby="valores-label">
					<div id="agregarPersona" hidden="true">
						<g:form name="formPersona" action="asignarPersona">
							<g:hiddenField name="objeto.id" id="objeto.id"
								value="${objetoInstance?.id}" />

							<g:select id="persona" name="persona.id"
								from="${com.redoaxaca.Persona.list()}" optionKey="id"
								noSelection="['':'Seleccione una persona']" required="" value=""
								data-placeholder="Seleccione una persona" class="chzn-select"
								style="width:350px;" tabindex="2" />
							<br>
							<br>
							<input type="submit" value="Guardar" />
							<input type="button" value="Cancelar"
								onClick="$('#agregarPersona').hide(); $('#btnAgregar').show();" />
							<br>
							<br>
							<br>
							<br>
						</g:form>
					</div>
			</span></li>
			<br>
			<br>



		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${objetoInstance?.id}" />
				<g:link class="edit" action="editar" id="${objetoInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>


	<script src="${resource(dir: 'js', file: 'chosen/chosen.jquery.js')}"
		type="text/javascript"></script>
	<script type="text/javascript">
		var config = {
			'.chzn-select' : {
				no_results_text : 'No se encontró algún dato con'
			},
			'.chzn-select-deselect' : {
				allow_single_deselect : true
			},
			'.chzn-select-no-single' : {
				disable_search_threshold : 10
			},
			'.chzn-select-no-results' : {
				no_results_text : 'Oops, nothing found!'
			},
			'.chzn-select-width' : {
				width : "95%"
			}
		}
		for ( var selector in config) {
			$(selector).chosen(config[selector]);
		}
	</script>
</body>
</html>







