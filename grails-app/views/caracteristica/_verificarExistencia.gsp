<div id="verificarSiExiste" name="verificarSiExiste">
	<g:if test="${existe}">
		<g:if test="${existe==1}">
			<script>
				mostrarAlerta('caracteristica', true, 'La característica que desea agregar ya existe');
			</script>
		</g:if>
		<g:else>
			<script>
				$('#formcarac').submit();
			</script>
		</g:else>
	</g:if>
</div>