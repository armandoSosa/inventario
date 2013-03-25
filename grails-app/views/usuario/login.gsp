

<html>
	<head>
		<title>Inventario</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
	
		<h1>Acceso</h1>
		<formset>
			<g:form action="verificarLogin">
				<legend>Iniciar sesión</legend>
				<label for="usuario">Usuario: </label>
				<g:textField name="usuario"/>
				<br>
				<label for="contrasena">Contraseña: </label>
				<g:passwordField name="contrasena"/>
				<br>
				<g:submitButton name="submit" value="Iniciar sesión"/>
			</g:form>
		</formset>
		
	</body>
</html>