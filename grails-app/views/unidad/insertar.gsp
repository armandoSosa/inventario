<html>
	<head>
		<title>Inventario</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
	
		<formset>
			<g:form action="insertarUnidad">
				<legend>Agregar unidad</legend>
				<label for="unidad">Unidad </label>
				<g:textField name="unidad"/>
				<g:submitButton name="submit" value="Agregar"/>
			</g:form>
		</formset>
		
	</body>
</html>