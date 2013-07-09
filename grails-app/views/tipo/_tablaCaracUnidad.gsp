<div id="tablaCaracUnidad">
	<g:if test="${mostrar}">

		<div class="fieldcontain ">
			<table>
				<thead>
					<tr>
						<th>Característica</th>
						<th>Unidad</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="sortable">
					<g:each in="${plantillas}" var="p" status="contador">
						<tr id='fila_${contador+1}'>
							
							<td><img src="${resource(dir: 'images', file: 'sortableIcon.png')}"
										width="15" height="15"> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								<input id='carac_${contador+1}' name='carac_${contador+1}'
								style='text-transform: uppercase;' class='tooltip ui-widget'
								title='' required='' value="${p?.caracteristicaUnidad?.caracteristica?.caracteristica}"
								onkeydown="return editar(${p.id}, ${contador+1}, ${tieneValores.get(contador)});"/></td>
							<td><input id='unidad_${contador+1}'
								name='unidad_${contador+1}' style='text-transform: uppercase;'
								class='tooltip ui-widget' title='' required='' value="${p?.caracteristicaUnidad?.unidad?.unidad}"
								onkeydown="return editar(${p.id}, ${contador+1}, ${tieneValores.get(contador)});"/></td>
							<td><input type='button' onClick='quitar(${contador+1}, ${p.id}, ${tieneValores.get(contador)});'
								value='X' /></td>
						</tr>
						<script>
							$( "#carac_"+contador ).autocomplete({
						      source: caracteristicas,
						      sortable: true,
						      close: function( event, ui ) {
							      	var inicio = $(this).val().indexOf("(");
							      	if (inicio!=-1) {
										var fin = $(this).val().indexOf(")");
										var anterior =$(this).val();
										$(this).val(anterior.substring(0,inicio-1));
										$("#unidad_"+this.id.substring(6,this.id.length)).val(anterior.substring(inicio+1,fin));
									}
							      }
						    });
							$( "#unidad_"+contador ).autocomplete({
						      source: unidades,
						      sortable: true
						    });
							contador++;
						</script>
					</g:each>


				</tbody>
			</table>

		</div>

		<div class="fieldcontain">
			<input type="button" onClick="addCaracteristica()"
				value="+ Otra característica" />
		</div>

		<script>
			$(function() {

				$("#sortable").sortable({
					update : function(event, ui) {
						orden = $(this).sortable('toArray').toString();
						$("#orden").val(orden);
					}

				});
				$("#sortable").disableSelection();



				

			});
		</script>
		
		<fieldset class="buttons">
				<a class="save" onClick="enviar()">Crear</a>
				
				<g:link name="cancel" class="cancelar" action="menu">Cancelar</g:link>

			</fieldset>

	</g:if>
</div>