<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro"/>
		<title>Bienvenido a Inventarios</title>
		<g:setProvider library="jquery"/>
		<script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}"  type="text/javascript" charset="utf-8"></script>
			
		<g:javascript src="jcrop/jquery.Jcrop.min.js" />
		  
		 <link rel="stylesheet" href="${resource(dir: 'js', file: 'chosen/chosen.css')}" type="text/css"> 
		 <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.scrollTo.js')}"></script>
		 <script type="text/javascript">
			function actualizarTabla() {				
				${remoteFunction(
						   controller: 'persona',
						   action: 'buscarPersona',
	                       update: 'list-persona',
	                       params: '\'tipo=\' + document.forma.tipo.selectedIndex+\'&persona=\' + document.forma.valorABuscar.value.toUpperCase()+\'&archivado=\' + document.forma.archivado.checked'												   
						)}				
			}
		</script>
	</head>
	<body class="modern-ui">	
		<br><br>
	    <div class="page-region">
               <div class="page-region-content">
               		
					<div role="main">
						<h1 class="fg-color-blueLight">Bienvenido a Inventarios</h1>
						<br>
						<br>
						
						<div>
                            <div class="hero-unit">
                                <!--<img src="images/windows-8-metro.jpg" class="place-right" style="width: 210px;"/>-->
                                 <div style="">
                                    <h2>Lista de Empleados</h2><br>
									
									<div class="nav" role="navigation">
										<ul>											
											<li><g:link class="create" action="insertar2">Nuevo Empleado</g:link></li>
										</ul>
									</div>
                                    <g:render template="tablaPersonas"/>
									<br>
									<div>
									<form action="" name="forma">
											<label for="valorABuscar"> Buscar:</label>
											<g:textField name="valorABuscar" required="" value="" style="text-transform:uppercase;"
											    onkeyup="actualizarTabla();"/>
							                <label for="tipo"> Por:</label>
							                <select name="tipo" onchange="actualizarTabla();">
							                	<option value="1">Nombre completo</option>
							                	<option value="2">No. de empleado</option>
							                	<option value="3">Estado</option>							                	
							                	<option value="4">RFC</option>
							                	<option value="5">CURP</option>
							                </select>
							                <label for="archivado">Mostrar archivados:</label>							                
							                <g:checkBox name="archivado" onchange="actualizarTabla();"/>
							                </form>
										</div>											
                                </div>
                            </div>
                        </div>                        
					</div>
               </div>
        </div>
		
	</body>
</html>
