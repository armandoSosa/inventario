<div id="verificarSiExiste" name="verificarSiExiste">
	<g:if test="${existe}">
		<g:if test="${existe==1}">
			<script>
				mostrarAlerta('mensaje', true, 'Ya existe esta unidad para la característica seleccionada');
			</script>
		</g:if>
		<g:else>
			<script>
				$('#formcarac').submit();
			</script>
		</g:else>
	</g:if>
</div>