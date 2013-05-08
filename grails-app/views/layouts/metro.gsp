<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css/metro/public/css', file: 'site.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css/metro/public/css', file: 'modern.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css/validacion', file: 'estilos.css')}" type="text/css">
		
		<g:javascript src="metro/dropdown.js"/>
		<g:javascript src="metro/jquery-1.8.2.min.js"/>
		<g:javascript src="metro/google-analytics.js"/>
		<g:javascript src="metro/github.info.js"/>
		
		<g:javascript type="text/javascript">
			 function getWindowsSize(){
			        $("#sizeX").html('W: '+$(window).width());
			        $("#sizeY").html('H: '+$(window).height());
			    }
			    $(function(){
			        getWindowsSize();
			        $(window).resize(function(){
			            getWindowsSize()
			        });
			    })
		</g:javascript>
		
		<style type="text/css" media="screen">
		
			.imagenPerfil{
				margin-left: 17px;
				margin-top: 15px;
				margin-bottom: 15px;
			}
			
			.empleado{
				margin-left: 20px;
				font-size: 1.1em;  				
			}
			
			.atributoEmpleado{
				font-weight:500;
				color: black;
			}
			
			.informacionEmpleado{
				
				border-bottom: 1px solid gray;
			}
			#status {
				background-color: #eee;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
			}
			
			#imagenPerfil {								
				float: left;
				-moz-box-shadow: 0px 0px 0em #ccc;
				-webkit-box-shadow: 0px 0px 0em #ccc;
				box-shadow: 0px 0px 0em #ccc;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			/*h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}*/

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			
			.ui-tabs.ui-tabs-vertical {
			    padding: 0;
			    width: 100%;
			}
			.ui-tabs.ui-tabs-vertical .ui-widget-header {
			    border: none;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-nav {
				
			    float: left;
			    width: 15em;
			    background: white;
			    border-radius: 4px 0 0 4px;
			    border-right: 1px solid gray;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-nav li {
			    clear: left;
			    width: 100%;
			    margin: 0.2em 0;
			    border: 1px solid gray;
			    border-width: 1px 0 1px 1px;
			    border-radius: 4px 0 0 4px;
			    overflow: hidden;
			    position: relative;
			    right: -2px;
			    z-index: 2;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-nav li a {
			    display: block;
			    width: 100%;
			    padding: 0.6em 1em;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-nav li a:hover {
			    cursor: pointer;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
			    margin-bottom: 0.2em;
			    padding-bottom: 0;
			    border-right: 1px solid white;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-nav li:last-child {
			    margin-bottom: 10px;
			}
			.ui-tabs.ui-tabs-vertical .ui-tabs-panel {				
			    float: left;
			    width: 70%;
			    border-left: 1px solid gray;
			    border-radius: 0;
			    position: relative;
			    left: -1px;
			}

						
			</style>
		
		
		
			<style>
			
				<!-- Start PureCSSMenu.com STYLE -->
				
					#pcm{display:none;}
					ul.pureCssMenu ul{display:none}
					ul.pureCssMenu li:hover>ul{display:block}
					ul.pureCssMenu ul{position: absolute;left:-1px;top:98%;}
					ul.pureCssMenu ul ul{position: absolute;left:98%;top:-2px;}
					ul.pureCssMenu,ul.pureCssMenu ul {
						margin:0px;
						list-style:none;
						padding:0px 3px 3px 0px;
						background-color:#414141;
						background-repeat:repeat;
						border-color:#CECECE;
					}
					ul.pureCssMenu table {border-collapse:collapse}ul.pureCssMenu {
						display:block;
						zoom:1;
						position:absolute;
						z-index: 1000;
						left: 100;
						top: 200;
					}
					* HTML ul.pureCssMenu {position:absolute}
					ul.pureCssMenu ul{
						width:166.95000000000002px;
					}
					ul.pureCssMenu li{
						display:block;
						margin:3px 0px 0px 3px;
						font-size:0px;
					}
					ul.pureCssMenu a:active, ul.pureCssMenu a:focus {
					outline-style:none;
					}
					ul.pureCssMenu a, ul.pureCssMenu li.dis a:hover, ul.pureCssMenu li.sep a:hover {
						display:block;
						vertical-align:middle;
						background-color:#414141;
						border-width:1px;
						border-color:#414141;
						border-style:solid;
						text-align:left;
						text-decoration:none;
						padding:4px;
						_padding-left:0;
						font-family: "Segoe UI Light", "Open Sans", sans-serif, sans;
						color: #FFFFFF;
						text-decoration:none;
						cursor:pointer;
					}
					ul.pureCssMenu span{
						overflow:hidden;
					}
					ul.pureCssMenu li {
						float:left;
					}
					ul.pureCssMenu ul li {
						float:none;
					}
					ul.pureCssMenu ul a {
						text-align:left;
						white-space:nowrap;
					}
					ul.pureCssMenu li.sep{
						text-align:left;
						padding:0px;
						line-height:0;
						height:100%;
					}
					ul.pureCssMenu li.sep span{
						float:none;	padding-right:0;
						width:3;
						height:100%;
						display:inline-block;
						background-color:#CECECE;	background-image:none;}
					ul.pureCssMenu ul li.sep span{
						width:100%;
						height:3;
					}
					ul.pureCssMenu li:hover{
						position:relative;
					}
					ul.pureCssMenu li:hover>a{
						background-color:#A3A3A3;
						border-color:#FFFFFF;
						border-style:solid;
						font-family: "Segoe UI Light", "Open Sans", sans-serif, sans;
						color: #FFFFFF;
						text-decoration:none;
					}
					ul.pureCssMenu li a:hover{
						position:relative;
						background-color:#A3A3A3;
						border-color:#FFFFFF;
						border-style:solid;
						font-family: "Segoe UI Light", "Open Sans", sans-serif, sans;
						color: #FFFFFF;
						text-decoration:none;
					}
					ul.pureCssMenu li.dis a {
						color: #AAAAAA !important;
					}
					ul.pureCssMenu img {border: none;float:left;_float:none;margin-right:4px;width:24px;
					height:24px;
					}
					ul.pureCssMenu ul img {width:16px;
					height:16px;
					}
					ul.pureCssMenu img.over{display:none}
					ul.pureCssMenu li.dis a:hover img.over{display:none !important}
					ul.pureCssMenu li.dis a:hover img.def {display:inline !important}
					ul.pureCssMenu li:hover > a img.def  {display:none}
					ul.pureCssMenu li:hover > a img.over {display:inline}
					ul.pureCssMenu a:hover img.over,ul.pureCssMenu a:hover ul img.def,ul.pureCssMenu a:hover a:hover ul img.def,ul.pureCssMenu a:hover a:hover a:hover ul img.def,ul.pureCssMenu a:hover a:hover img.over,ul.pureCssMenu a:hover a:hover a:hover img.over,ul.pureCssMenu a:hover a:hover a:hover a:hover img.over{display:inline}
					ul.pureCssMenu a:hover img.def,ul.pureCssMenu a:hover ul img.over,ul.pureCssMenu a:hover a:hover ul img.over,ul.pureCssMenu a:hover a:hover a:hover ul img.over,ul.pureCssMenu a:hover a:hover img.def,ul.pureCssMenu a:hover a:hover a:hover img.def,ul.pureCssMenu a:hover a:hover a:hover a:hover img.def{display:none}
					ul.pureCssMenu a:hover ul,ul.pureCssMenu a:hover a:hover ul,ul.pureCssMenu a:hover a:hover a:hover ul{display:block}
					ul.pureCssMenu a:hover ul ul,ul.pureCssMenu a:hover a:hover ul ul{display:none}
					ul.pureCssMenu span{
						display:block;
						background-image:url(images/menuCss/arrow_sub5.gif);
						background-position:right center;
						background-repeat: no-repeat;
					   padding-right:14px;}
					ul.pureCssMenu ul span,ul.pureCssMenu a:hover table span{background-image:url(images/menuCss/arrow_sub2.gif)}
					ul.pureCssMenu ul li:hover > a span{	background-image:url(images/menuCss/arrow_sub5.gif);}
					ul.pureCssMenu table a:hover span,ul.pureCssMenu table a:hover a:hover span,ul.pureCssMenu table a:hover a:hover a:hover span{background-image:url(images/menuCss/arrow_sub5.gif)}
					ul.pureCssMenu table a:hover table span,ul.pureCssMenu table a:hover a:hover table span{background-image:url(images/menuCss/arrow_sub2.gif)}
					<!-- End PureCSSMenu.com STYLE -->
			</style>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body class="modern-ui">	
		<div class="page">
			 <div class="page-region">
             	<div class="page-region-content">
             	
             	
             	
             		<div style="display: none; position: fixed; height: 100px; width: 100px; padding: 10px; z-index: 10000;" class="bottom-right bg-color-darken fg-color-white">
					    Screen size:
					    <div id="sizeX">0</div>
					    <div id="sizeY">0</div>
					</div>
				
					<div class="bg-color-red fg-color-white text-center">
					    Inventarios
					</div>
						
				<!-- Start PureCSSMenu.com MENU -->

			 		
					
					<ul class="pureCssMenu pureCssMenum navigation-bar">
						<div class="navigation-bar-inner">
			 				<span class="menu-pull"></span>
							<li ><a class="pureCssMenui" href="/inventarios3">Inicio</a></li>
							<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Personas</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
								<ul class="pureCssMenum">
									<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Empleados</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
										<ul class="pureCssMenum ">
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/objetoPersona/insertar">Asignación de objetos</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/persona/empleados">Ver Empleados</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/objeto/buscarPer">Buscar Empleado</a></li>
											
										</ul>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Usuarios</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
										<ul class="pureCssMenum ">
											<li class="pureCssMenui"><a class="pureCssMenui" href="#">Ver Usuarios</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Catálogos</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
												<ul class="pureCssMenum ">
													<li class="pureCssMenui"><a class="pureCssMenui" href="#">Tipos de Usuarios</a></li>
													<li class="pureCssMenui"><a class="pureCssMenui" href="#">Privilegios</a></li>
												</ul>
										</ul>
									
								</ul>
							<!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
							<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Inventarios</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
								<ul class="pureCssMenum">
									<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/objeto/insertar5">Nuevo</a></li>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Ver Objetos</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
										<ul class="pureCssMenum ">
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/objeto/menu">Mostrar objetos</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/objeto/listadoPorTipo">Filtrados por tipo</a></li>
										</ul>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Tipos de objeto</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
										<ul class="pureCssMenum ">
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/tipo/insertar2">Nuevo</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/persona/empleados">Ver Empleados</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/objeto/buscarPer">Buscar Empleado</a></li>
											<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Catálogos</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
												<ul class="pureCssMenum ">
													<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/tipoTelefono/menu">Tipos de Teléfonos</a></li>
													<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/estado/menu">Estados</a></li>
													<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/municipio/menu">Municipios</a></li>
												</ul>
										</ul>
								</ul>
							
							<!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
							<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Departamentos</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
								<ul class="pureCssMenum">
									<li class="pureCssMenui"><a class="pureCssMenui" href="/inventarios3/departamento/menu">Ver Departamentos</a></li>
								</ul>
							<li class="pureCssMenui"><a class="pureCssMenui" href="#"><span>Reportes</span><![if gt IE 6]></a><![endif]><!--[if lte IE 6]><table><tr><td><![endif]-->
								<ul class="pureCssMenum">
									<li class="pureCssMenui"><a class="pureCssMenui" href="#">Template 1</a></li>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#">Template 2</a></li>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#">Template 3</a></li>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#">Template 4</a></li>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#">Template 5</a></li>
									<li class="pureCssMenui"><a class="pureCssMenui" href="#">Template 6</a></li>
								</ul>
							
							<li class="pureCssMenui"><a class="pureCssMenui" href="#">FAQ</a></li>
							<li class="pureCssMenui"><a class="pureCssMenui" href="#">Contact Us</a></li>
						</div>
					</ul>
					<br>

             	</div>
             </div>
		</div>

		<g:layoutBody/>
		
		<r:layoutResources />
	</body>
	<footer>
		<div class="header-bar">
			<div class="header-bar-inner bg-color-darken" style="padding: 10px 10px 5px;">
				<p class="tertiary-text fg-color-white">2013, Inventarios <a class="fg-color-blueLight" href="mailto:sergey@pimenov.com.ua">Red Oaxaca de Todos</a></p>
			</div>
		</div>
		<r:layoutResources />
	</footer>
</html>
