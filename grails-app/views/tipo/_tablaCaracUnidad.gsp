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
							
							<td><input id='carac_${contador+1}' name='carac_${contador+1}'
								style='text-transform: uppercase;' class='tooltip ui-widget'
								title='' required='' value="${p?.caracteristicaUnidad?.caracteristica?.caracteristica}"
								onkeydown="return editar(${p.id}, ${tieneValores.get(contador)});"/></td>
							<td><input id='unidad_${contador+1}'
								name='unidad_${contador+1}' style='text-transform: uppercase;'
								class='tooltip ui-widget' title='' required='' value="${p?.caracteristicaUnidad?.unidad?.unidad}"
								onkeydown="return editar(${p.id}, ${tieneValores.get(contador)});"/></td>
							<td><input type='button' onClick='quitar(${contador+1}, ${p.id}, ${tieneValores.get(contador)});'
								value='X' /></td>
						</tr>
						<script>
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

	</g:if>
</div>