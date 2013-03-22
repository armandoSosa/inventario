<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${objetosPersona}">
			<h3>Número de empleado: ${persona.numeroEmpleado} </h2>
			<h3>Nombre: ${persona} </h2>
			  
			<table>
		        <th>
					No. Inventario
				</th>
				<th>
					Tipo de objeto
				</th>
				<th>
					Tipo de propiedad
				</th>				

		        
		        <g:each var="objetoPersona" in="${objetosPersona}">
		        	<tr>
		        		<td>
		        			${objetoPersona.objeto.noInventario}
		        		</td>
		        		<td>
		        			${objetoPersona.objeto.tipo}
		        		</td>
		        		<td>
		        			${objetoPersona.objeto.tipoPropiedad}
		        		</td>
		            </tr>
		        </g:each>
			</table>
		</g:if>
		<g:else>
			No hay ningún dato
		</g:else>
		
	</body>
</html>