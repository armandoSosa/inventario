<div id="verificarSiExiste" name="verificarSiExiste">
	<g:if test="${existe}">
		<g:if test="${existe==1}">
			<script>
				mostrarAlerta('unidad', true, 'La unidad que desea agregar ya existe');
			</script>
		</g:if>
		<g:else>
			<script>
				$('#formunidad').submit();
			</script>
		</g:else>
	</g:if>
</div>