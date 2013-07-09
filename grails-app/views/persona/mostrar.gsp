
<%@ page import="com.redoaxaca.Persona" %>
<!DOCTYPE html>
<html>
	<head>
	
		<link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
		<g:javascript plugin="jquery" />
		<g:javascript src="jcrop/jquery.min.js" />
		<g:javascript src="jcrop/jquery.Jcrop.min.js" />
		
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
  <script src="${resource(dir:'js/tabs',file:'jquery-1.9.1.js')}"></script>
  <script src="${resource(dir:'js/tabs',file:'jquery-ui.js')}"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  
<script>
  $(function() {
    $( "#tabs" ).tabs()
    .addClass('ui-tabs-vertical ui-helper-clearfix');
  });  
  </script>
  <script>
	function recargar(){
		window.location.reload()
	}
	
  </script>
	</head>
	<body>
		<a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="empleados"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-persona" class="content scaffold-show" role="main">
			<h1>Empleado</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="property-list persona">
				
				
			<div class="page-region">
				
				  		<br>
				  		
						<h2 style="text-align: right;"class="">${personaInstance?.nombre} ${personaInstance?.paterno} ${personaInstance?.materno} </h2>
						<br>
			
				<div id="tabs">
				  <ul>
				  	<g:if test="${personaInstance?.foto?.id}">
	               		<div id="imagenPerfil">
							<img id="imagen" class="imagenPerfil" src="<g:createLink controller='persona' action='renderImage' id="${personaInstance?.foto?.id}"/>" width="200" height="300"/>
						</div>
					</g:if>
							
				    <li><a href="#tabs-1">Información del Empleado</a></li>
				    <li><a href="#tabs-2">Contacto</a></li>
				    <li><a href="#tabs-3">Pertenecias</a></li>
				  </ul>
				  <div id="tabs-1">				  		
				  		<h2>Información del Empleado</h2>
				  		<br>
				    	<g:if test="${personaInstance?.numeroEmpleado}">							
								<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Número de empleado:</font> <g:fieldValue bean="${personaInstance}" field="numeroEmpleado"/></h3>																								
						</g:if>
						<br>
						<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Nombre:</font> ${personaInstance?.nombre} ${personaInstance?.paterno} ${personaInstance?.materno} </h3>
						<br>
						
						<g:if test="${personaInstance?.curp}">				
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Curp:</font> ${personaInstance?.curp} </h3>										
						</g:if>
						<br>
						<g:if test="${personaInstance?.rfc}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">RFC:</font> ${personaInstance?.rfc} </h3>									
						</g:if>
						<br>
						
						<g:if test="${personaInstance?.fechaNacimiento}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Fecha Nacimiento:</font> <g:formatDate type="date" style="LONG" date="${personaInstance?.fechaNacimiento}"/> </h3>
																
						</g:if>
						<br>
						<g:if test="${personaInstance?.sexo}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Sexo:</font> ${personaInstance?.sexo} </h3>
																
						</g:if>
						<br>					
						<g:if test="${personaInstance?.puestosPersona}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Puesto:</font> <br>
								<g:each in="${personaInstance.puestosPersona}" var="p">
									${p?.puesto?.nombre}
								</g:each>	
							</h3>
							<br>
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Departamento:</font> <br>
								<g:each in="${personaInstance.puestosPersona}" var="p">
									${p?.puesto?.departamento?.nombre}
								</g:each>	
							</h3>
						</g:if>
							<br>
							
							<g:if test="${personaInstance?.subordinado}">
								<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Subordinados:</font> <br>
									<g:each in="${personaInstance.subordinado}" var="s">
										${s?.encodeAsHTML()}
									</g:each>	
								</h3>				
							</g:if>
						<br>		
							
						<g:if test="${personaInstance?.usuarios}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Usuario:</font> <br>
								<g:each in="${personaInstance.usuarios}" var="u">
									${u?.encodeAsHTML()}
								</g:each>	
							</h3>
						</g:if>			
				  </div>
				  <div id="tabs-2">
				  		<h2>Contacto</h2>
				  		<br>
				  		<g:if test="${personaInstance?.direcciones}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Dirección:</font></h3> 
								<g:each in="${personaInstance.direcciones}" var="d">
									<h3 class="empleado">Estado: ${d?.municipio?.estado?.nombre}</h3>
									<h3 class="empleado">Municipio: ${d?.municipio?.nombre}</h3>
									<h3 class="empleado">Calle: ${d?.calle}</h3>
									<h3 class="empleado">Colonia: ${d?.colonia }</h3>
									<h3 class="empleado">Número Exterior: ${d?.noExterior }</h3>
									<g:if test="${d?.noInterior}">
										<h3 class="empleado">Número Interior: ${d?.noInterior }</h3>
									</g:if>
								</g:each>
									
						</g:if>
				    	<br>
						<g:if test="${personaInstance?.email}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Email:</font> ${personaInstance?.email} </h3>				
						</g:if>
						<br>
						<g:if test="${personaInstance?.telefonos}">
							<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Telefonos:</font> <br>
								<g:each in="${personaInstance.telefonos}" var="t">
									${t?.tipoTelefono }: ${t?.encodeAsHTML()}  <br>
								</g:each>							 
							 </h3>				
						</g:if>	
				  </div>
				  <div id="tabs-3">
				    <h2>Pertenencias</h2>
				  		<br>
				  		<h3 ><g:link action="insertar2" controller="objetoPersona" id="${personaInstance.id }" ><font class="empleado">Asignar objeto</font> </g:link></h3>
				  		<br>
				  		<g:if test="${personaInstance?.objetosPersona}">
				  			<h3 class="empleado"><font class="atributoEmpleado fg-color-orangeDark">Pertenencias:</font> 
				  			</h3><br>
				  				<table>		
				  					<tbody>	
				  						<tr>
				  						<td>No. de inventario</td>
				  						<td>Tipo de objeto</td>
				  						<td>Tipo de propiedad</td>
				  						<td></td>
				  						</tr>		  										  					
					  						<g:each in="${personaInstance.objetosPersona}" var="o">
					  						<tr>
					  							<g:if test="${o.fechaInicio==o.fechaFin}">
												<td><g:link action="mostrar" controller="objeto" id="${o?.objeto?.id}">${o?.objeto?.noInventario}</g:link></td><td>${o?.objeto?.tipo}</td><td>${o?.objeto?.tipoPropiedad } </td>
												<td><input id="${personaInstance.id}" name="${o.id }" type="button" value="Desasignar" 
												onclick="${remoteFunction(
													   controller: 'objetoPersona',
													   action: 'desasignarObjetoPersona',
												  onComplete: 'recargar()',								                       
									                params: '\'objetoPersona=\' + this.name+\'&persona=\' + this.id'
												  	
													)} "></td>
												</g:if>
											</tr>
											</g:each>						  					
				  					</tbody>
				  				</table>
				  											 
							 							
						</g:if>
						<g:else>
							<h3 class="empleado">Este usuario no tiene pertenencias.</h3>	
						</g:else>
				  </div>
				</div>				
               </div>
        	</div>			
		</div>			


			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personaInstance?.id}" />
					<g:link class="edit" action="editar" id="${personaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:if test="${!personaInstance?.archivado}">
					<g:link name="cancel" class="delete" action="archivar" id="${personaInstance.id}" onclick="return confirm('¿Seguro que desear archivar al empleado?');">Archivar</g:link>
					</g:if>					
				</fieldset>
			</g:form>
		
	</body>
</html>
