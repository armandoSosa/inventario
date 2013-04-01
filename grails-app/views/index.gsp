<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Bienvenido a Inventarios</title>
		
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			
			<div id="controller-list" role="navigation">
				<h2>Entidades</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
					</g:each>
				</ul>
			</div>
			
		</div>
		<div id="page-body" role="main">
			<h1>Bienvenido a Inventarios</h1>
			
			<a href="persona/tipoPersona">Personas</a>
			<br>
			<a href="objeto/menu">Objetos</a>

			
			
		</div>
	</body>
</html>
