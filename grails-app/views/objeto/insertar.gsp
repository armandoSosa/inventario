<html>
<head>
	<title>Inventario - Agregar Objeto</title>
	<meta name="layout" content="main" />
</head>
<body>
	<formset>
		<legend>Agregar Objeto</legend>
		<g:form action="insertarObjeto">
			<label for="objeto">Objeto:</label>
			<g:textField name="noInventario" />			
			<label for="objeto">TIpo:</label>
			<g:select name="descripcion" from="${tipoList}" optionKey="descripcion" optionValue="descripcion" />
			<g:submitButton name="agregar" value="Agregar" />
		</g:form>
	</formset>
</body>
</html>