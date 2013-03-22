<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<table>
		
			
			
			<g:each var="objeto" in="${objetos}">
				<g:each var="valor" in="${objeto.valores}">
					<tr>
						<td>
							${objeto.noInventario}
						</td>
						<td>
							${valor.plantilla.tipo}
						</td>
						
						<td>
							${valor.plantilla.caracteristica}
						</td>
						<td>
							${valor}
						</td>
						<td>
							${valor.plantilla.caracteristica.unidad}
						</td>
						
		            </tr>
	            </g:each>
	        </g:each>
	 
			
		</table>
	
	</body>
</html>