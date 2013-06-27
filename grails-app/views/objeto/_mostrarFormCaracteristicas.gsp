<div id="divInfoTipoObjeto" name="divInfoTipoObjeto"
	class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">

	<g:if test="${mostrar}">
		<div
			class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">

			<fieldset class="form">
				<div id="textFieldFormBuscar" class="fieldcontain">
					<g:hiddenField id="tipoNombre" name="tipoNombre" value="" />
					<g:if test="${tipoInstance}">
						<script>
								
								$("#tipoNombre").val("${tipoInstance?.id}");
							reiniciarCadenaValores();
						</script>
					</g:if>
					<g:else>

					</g:else>


				</div>
				<br>
			</fieldset>
		</div>


		<g:if test="${claveInventario}">
			<div
				class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'noInventario', 'error')} ">
				<label for="noInventario"> <g:message
						code="objeto.noInventario.label" default="No Inventario" />

				</label><span class="required-indicator">*</span>
				<g:textField name="noInventario" value="${claveInventario}"
					disabled="true" />
				<g:hiddenField name="noInventarioHidden" value="${claveInventario}" />
			</div>

			<div
				class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
				<label for="tipoPropiedad"> <g:message
						code="objeto.tipoPropiedad.label" default="Tipo Propiedad" /> <span
					class="required-indicator">*</span>
				</label>
				<g:select id="tipoPropiedad" name="tipoPropiedad"
					from="${com.redoaxaca.TipoPropiedad.list()}" optionKey="id"
					required="" value="${tipoPropiedad?.id}"
					onChange="${session.tipoPropiedad=this.value }" class="many-to-one" />
			</div>
		</g:if>



		<g:if test="${claveInventario}">

			<fieldset class="form">
				<!--  <legend>Agregar valores</legend> -->
				<br> <br>
				<!-- Necesario al insertar -->
				<g:if test="${editar==null}">
					<g:if test="${plantillas}">
						<g:each var="plantilla" in="${plantillas}">
							<label for="valor${plantilla?.id}"> ${plantilla?.caracteristicaUnidad?.caracteristica}
							</label>
							<g:textField id="valor${plantilla?.id}"
								name="valor${plantilla?.id}" value=""
								onChange="generarCadenaValores('valor${plantilla?.id}')" />
							${plantilla?.caracteristicaUnidad?.unidad}
							<br>
							<br>
						</g:each>

					</g:if>
					<g:else>
						<label for="linkNuevaCarac"> <g:message
								code="objeto.noInventario.label"
								default="No hay características1" />
						</label>
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${valores || plantillasFaltantes}">
						<!-- Necesario al editar -->
						<g:if test="${valores}">
							<g:each var="valor" in="${valores}">
								<label for="valor${valor?.id}"> ${valor?.plantilla?.caracteristicaUnidad?.caracteristica}
								</label>
								<g:textField id="valor${valor?.id}" name="valor${valor?.id}"
									value="${valor?.valor}"
									onChange="generarCadenaValores('valor${valor?.id}')" />
								${valor?.plantilla?.caracteristicaUnidad?.unidad}
								<br>
								<br>
							</g:each>

						</g:if>

						<!-- Agregamos las plantillas que no tienen valores -->
						<g:if test="${plantillasFaltantes}">
							<g:each var="p" in="${plantillasFaltantes}">
								<label for="p${p?.id}"> ${p?.caracteristicaUnidad?.caracteristica}
								</label>
								<g:textField id="plantilla${p?.id}" name="plantilla${p?.id}"
									value="" onChange="generarCadenaValores('plantilla${p?.id}')" />
								${p?.caracteristicaUnidad?.unidad}
								<br>
								<br>
							</g:each>

						</g:if>
					</g:if>
					<g:else>
						<label for="linkNuevaCarac"> <g:message
								code="objeto.noInventario.label"
								default="No hay características2" />
						</label>
					</g:else>



				</g:else>


			</fieldset>
			<br>
			<br>


			<fieldset class="buttons">
				<a name="create" class="save" href="javascript:void(0)"
					onclick="submitObjeto();return false;">Crear Objeto</a>
					
				<g:if test="${editar==null}">
					<g:link name="cancel" class="cancelar" action="menu">Cancelar</g:link>
				</g:if>
				<g:else>
					<g:link name="cancel" class="cancelar" action="mostrar" id="${idObjeto}">Cancelar</g:link>
				</g:else>
					
				
					
				
				
			</fieldset>


		</g:if>




	</g:if>







</div>