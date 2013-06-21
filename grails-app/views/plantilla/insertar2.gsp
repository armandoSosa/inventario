<%@ page import="com.redoaxaca.Tipo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'tipo.label', default: 'Tipo')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
<script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
	<script type="text/javascript"	src="${resource(dir: 'js', file: 'jquery-1.6.4.min.js')}"></script>
	
	
	
	

	
	
	
		
		
	
	
<script type="text/javascript">
	function validarTecleo(e, tipo) {
		var pasa = validar(e, tipo);
		mostrarAlerta('descripcion', !pasa, 'Solo se aceptan letras y números');
		return pasa;
	}

	function validarEnvio(e, tipo) {
		if ($('#descripcion').val().length<3){
			mostrarAlerta('descripcion', true, 'La descripción debe ser de al menos 3 caracteres');
		} else {
			$('#formTipo').submit();
		}
	}
	
	
</script>
<!-- Empieza multiselect -->
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'multiSelectArrastrar/common.css')}" type="text/css" />
	<!--<link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/ui-lightness/jquery-ui.css" />-->
	
	
	<link type="text/css" href="${resource(dir: 'css', file: 'multiSelectArrastrar/jquery-ui.css')}" rel="stylesheet" />
	<link type="text/css" href="${resource(dir: 'css', file: 'multiSelectArrastrar/ui.multiselect.css')}" rel="stylesheet" />
	
	<script type="text/javascript" src="${resource(dir: 'js', file: 'multiSelectArrastrar/jquery.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'multiSelectArrastrar/jquery-ui.min.js')}"></script>
	
	
	<script type="text/javascript" src="${resource(dir: 'js', file: 'multiSelectArrastrar/plugins/localisation/jquery.localisation-min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'multiSelectArrastrar/plugins/scrollTo/jquery.scrollTo-min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'multiSelectArrastrar/ui.multiselect.js')}"></script>
		<script type="text/javascript">
			$(function(){
				$.localise('ui-multiselect', {language: 'en', path: 'js/locale/'});
				$(".multiselect").multiselect();
				$('#switcher').themeswitcher();
			});
	</script>
	
	<!-- Termina multiSelect -->
	
	
	<!-- Elementos para validacion pop up animado -->
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}"/>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>

		<script>
			$(document).ready(function() {
				
				$('.tooltip').tooltipster({
				    animation: 'grow',
				    trigger: 'custom',
				    position: 'right'
				});
			});
			
			function mostrarAlerta(elemento, mostrar, mensaje) {
				if (mostrar) {
					$('#'+elemento).tooltipster('update', mensaje);
					$('#descripcion').tooltipster('show');
				} else {
					$('#'+elemento).tooltipster('hide');
				}
			}
		</script>
		
		<!--Termina: Elementos para validacion pop up animado -->


</head>
<body>
	<a href="#create-tipo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-tipo" class="content scaffold-create" role="main">
		<h1>Definición de objeto</h1>
		<g:form id="formTipo" name="formTipo" action="save_plantilla">
			<fieldset class="form">
				<g:render template="form2" />
			</fieldset>
			<fieldset class="buttons">
				<input class="save" type="submit" value="Crear"/>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
