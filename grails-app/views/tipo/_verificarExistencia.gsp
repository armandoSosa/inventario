<div id="verificarSiExiste" name="verificarSiExiste">
	<g:if test="${existe}">
		<g:if test="${existe==1}">
			<script>
				mostrarAlerta('descripcion', true, 'El tipo que desea agregar ya existe');
			</script>
		</g:if>
		<g:else>
			<script>
				$('#formTipo').submit();
			</script>
		</g:else>
	</g:if>
	
</div>