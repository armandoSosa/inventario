<html>
<head>
	<title>Inventario - Agregar Tipo</title>
	<meta name="layout" content="main" />
</head>
<body>
	<formset>
		<legend>Agregar Tipo</legend>
		<g:form action="insertarTipo">
			<label for="tipo">Tipo:</label>
			<g:textField name="descripcion" />
			<g:submitButton name="agregar" value="Agregar" />
		</g:form>
	</formset>
</body>
</html>
