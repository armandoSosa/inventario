<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${objetos}">
			<table>
		        <th>
					No. Inventario
				</th>
				<g:each var="valor" in="${objetoMayor.valores}">
					<th>
						${valor.plantilla.caracteristica}
					</th>
		        </g:each>
		        
		        <g:each var="objeto" in="${objetos}">
		        	<tr>
		        		<td>
		        			${objeto.noInventario}
		        		</td>
						<g:each var="valorMayor" in="${objetoMayor.valores}">
							<td>	
								<g:each var="valor" in="${objeto.valores}">	
									<g:if test="${valorMayor.plantilla.caracteristica.caracteristica == valor.plantilla.caracteristica.caracteristica}">
										${valor} ${valor.plantilla.caracteristica.unidad}
	   								</g:if>
								</g:each>
							</td>        
			            </g:each>
		            </tr>
		        </g:each>
			</table>
		</g:if>
		<g:else>
			No hay ningún dato
		</g:else>
		
	</body>
</html>