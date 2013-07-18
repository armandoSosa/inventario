<div id="curpValida">	
	<g:if test="${valido==false}">		
		<script>
			function validarCurpAlerta(){
				mostrarValidacion("curp", "La CURP ya ha sido ocupada");
				return false;
			}
		</script>
	</g:if>	
	<g:else>
		<script>
			function validarCurpAlerta(){
			 	return true;
			}
		</script>
	</g:else>
</div>