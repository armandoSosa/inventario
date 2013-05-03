<%@ page import="com.redoaxaca.Persona" %>
<!DOCTYPE html>
<html>
	<head>		
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
		 <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
		  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
		  
		  <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
		
		<g:javascript src="jcrop/jquery.Jcrop.min.js" />
		  
		  <!--  
		  <script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}"  type="text/javascript" charset="utf-8"></script>
			<script src="${resource(dir: 'js', file: 'jquery.maskedinput.min.js')}" type="text/javascript"></script>
			
		<script type="text/javascript">
		    $(function() {
		        $.mask.definitions['~'] = "[+-]";        
		        $("#telefonos").mask("(999) 999-9999");		
		    });
	</script>-->
	<script>
		function llamarInLine(){
			$("#formFoto").submit();						
			$("#nuevaImagen").click();
		}

		
	</script>	
	<script type="text/javascript">
		jQuery(function($){
			
		    // Create variables (in this scope) to hold the API and image size
		    var jcrop_api,
		        boundx,
		        boundy,

		        // Grab some information about the preview pane
		        $preview = $('#preview-pane'),
		        $pcnt = $('#preview-pane .preview-container'),
		        $pimg = $('#preview-pane .preview-container img'),

		        xsize = $pcnt.width(),
		        ysize = $pcnt.height();
		    
		    console.log('init',[xsize,ysize]);
		    $('#imagen').Jcrop({
		    	bgOpacity: 0.4,
			    bgColor: 'black',
			    addClass: 'jcrop-normal',
			    setSelect: [ 0, 0, 200, 300 ],
		      onChange: updatePreview,
		      onSelect: updatePreview,
		      aspectRatio: xsize / ysize
		    },function(){
		      // Use the API to get the real image size
		      var bounds = this.getBounds();
		      boundx = bounds[0];
		      boundy = bounds[1];
		      // Store the API in the jcrop_api variable
		      jcrop_api = this;

		      // Move the preview into the jcrop container for css positioning
		      $preview.appendTo(jcrop_api.ui.holder);
		    });

		    function updatePreview(c)
		    {
		      if (parseInt(c.w) > 0)
		      {
		        var rx = xsize / c.w;
		        var ry = ysize / c.h;

		        $pimg.css({
		          width: Math.round(rx * boundx) + 'px',
		          height: Math.round(ry * boundy) + 'px',
		          marginLeft: '-' + Math.round(rx * c.x) + 'px',
		          marginTop: '-' + Math.round(ry * c.y) + 'px'
		        });
		      }
		    };

		  });
							

		</script>
		<style type="text/css">

			/* Apply these styles only when #preview-pane has
			   been placed within the Jcrop widget */
			.jcrop-holder #preview-pane {
			  display: block;
			  position: absolute;
			  z-index: 2000;
			  top: 0px;
			  right: -280px;
			  padding: 6px;
			  border: 1px rgba(0,0,0,.4) solid;
			  background-color: white;
			
			  -webkit-border-radius: 6px;
			  -moz-border-radius: 6px;
			  border-radius: 6px;
			
			  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
			}
			
			/* The Javascript code will set the aspect ratio of the crop
			   area based on the size of the thumbnail preview,
			   specified here */
			#preview-pane .preview-container {
			  width: 200px;
			  height: 300px;
			  overflow: hidden;
			}
		
		</style>
			  		
	</head>
	<body>
		<a href="#create-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="empleados">Lista de Empleados</g:link></li>
			</ul>
		</div>
		<div id="create-persona" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${direccionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${direccionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${telefonoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${telefonoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<br><br>
			<fieldset>
			<legend>Información personal</legend>
			<g:form name="formFoto"  action="save_foto" controller="foto" enctype="multipart/form-data">				
				<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'foto', 'error')} required">
					<label for="foto">
						<g:message code="foto.foto.label" default="Foto" />						
					</label>
					<input type="file" id="foto" name="foto" onchange="llamarInLine();"/>
				</div>
				<g:submitButton style="display:none;" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
			</fieldset>
			<g:form name="forma" action="save_persona"  enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="forma2"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Insertar" />					
				</fieldset>
			</g:form>
			
			
			
		</div>			
		
		
		<!-- hidden inline form -->
		<div id="inline">		
			<div id="create-estado" class="content scaffold-create" role="main">
				<h1>Nuevo Estado</h1>
				<g:hasErrors bean="${estadoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${estadoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form action="save_estado" >
					<fieldset class="form">
						<g:render template="../estado/forma"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
		
		<!-- hidden inline form -->
		<div id="inline3">		
			<div id="create-estado" class="content scaffold-create" role="main">
				<h1>Nuevo Tipo Telefono</h1>
				<g:form action="save_tipotelefono_persona" controller="tipoTelefono">
				<fieldset class="form">
					<g:render template="../tipoTelefono/forma"/>					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />					
				</fieldset>
			</g:form>
			</div>
		</div>
		
		<!-- hidden inline form -->
		<div id="inline100">		
			<div id="create-imagen" class="content scaffold-create" role="main">
				<h2>Imagen de Empleado</h2>
				<br><br>
				<g:form action="save_tipotelefono_persona" controller="tipoTelefono">
				<fieldset class="form">							
					<img id="imagen" class="imagenPerfil" src="<g:createLink controller='persona' action='renderImage' id="33"/>"/>
					<div id="preview-pane">
					    <div class="preview-container">
					      <img src="<g:createLink controller='persona' action='renderImage' id="33"/>" class="jcrop-preview" alt="Preview" />
					    </div>
					  </div>	
					<br><br><br><br>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />					
				</fieldset>
			</g:form>
			</div>
		</div>
		
		<a id="nuevaImagen" class="modalbox" href="#inline100" style="display:none;"></a>
		<!-- basic fancybox setup -->
		<script type="text/javascript">
			$(document).ready(function() {
				$(".modalbox").fancybox();
			});
		</script>
		<!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    <g:render template='phone' model="['phone':null,'i':'_clone','hidden':true]"/>
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
	</body>
</html>
