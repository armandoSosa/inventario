<html>
	<head>
		<title>Inventario</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
	
		<formset>
			<g:form action="insertarPlantilla">
				<legend>Agregar plantilla</legend>
				<br>
				<label for="tipos">Tipo de objeto </label>
				<g:select name="tipos" from="${tipos}" optionKey="descripcion" optionValue="descripcion" />
				<br>
				<br>
				<label for="caracteristicas">Caracteristica </label>
				<g:select name="caracteristicas" from="${caracteristicas}" optionKey="caracteristica" optionValue="caracteristica" />
				<br>
				<br>
				<g:submitButton name="submit" value="Agregar"/>
			</g:form>
		</formset>
		
	</body>
</html>