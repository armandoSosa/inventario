<div id="numeroEmpleadoValido">	
	<g:if test="${valido==false}">		
		<script>
			function validarNumeroEmpleadoAlerta(){
				mostrarValidacion("numeroEmpleado", "El número de empleado ya ha sido ocupado");
				return false;
			}
		</script>
	</g:if>	
	<g:else>
		<script>
			function validarNumeroEmpleadoAlerta(){
			 	return true;
			}
		</script>
	</g:else>
</div>