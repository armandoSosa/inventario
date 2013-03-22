<html>
	<head>
		<title>Inventario</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
	
		<formset>
			<g:form action="insertarCaracteristica">
				<legend>Agregar característica</legend>
				<label for="caracteristica">Caracteristica </label>
				<g:textField name="caracteristica"/>
				<g:select name="unidad" from="${unidades}" optionKey="unidad" optionValue="unidad" />
				<g:submitButton name="submit" value="Agregar"/>
			</g:form>
		</formset>
		
	</body>
</html>