<%@ page import="com.redoaxaca.CaracteristicaUnidad"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
		
<link rel="stylesheet"
	href="${resource(dir: 'js', file: 'chosen/chosen.css')}"
	type="text/css">
<script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}"  type="text/javascript" charset="utf-8"></script>








<!-- Elementos para validacion pop up animado -->
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}" />
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>

<script>
			$(document).ready(function() {
				$('#caracteristica_chzn').addClass('tooltip');
				$('.tooltip').tooltipster({
				    animation: 'grow',
				    trigger: 'custom',
				    position: 'right'
				});
			});
			
			function mostrarAlerta(elemento, mostrar, mensaje) {
				if (mostrar) {
					
					$('#caracteristica_chzn').tooltipster('update', mensaje);
					$('#caracteristica_chzn').tooltipster('show');
					
				} else {
					$('#caracteristica_chzn').tooltipster('hide');
				}
			}
		</script>

<!--Termina: Elementos para validacion pop up animado -->

<script type="text/javascript">
	function validarEnvio(e, tipo) {
		//debemos verificar que el tipo no exista
		var cadenaValores="caracteristicaTexto="+$("#caracteristica").val()+"&unidadTexto="+$("#unidad").val();
		${remoteFunction (controller:'caracteristicaUnidad', action:'verificarSiExiste', params: 'cadenaValores', update: 'verificarSiExiste')}
		
	}
</script>




</head>
<body>
	<g:render template="verificarExistencia" />
	<a href="#create-caracteristicaUnidad" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="menu">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-caracteristicaUnidad" class="content scaffold-create"
		role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${caracteristicaUnidadInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${caracteristicaUnidadInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form id="formcarac" name="formcarac" action="save">
			<fieldset id="field" name="field" class="form tooltip" title="">


				<div
					class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'caracteristica', 'error')} required">
					<label for="caracteristica"> <g:message
							code="caracteristicaUnidad.caracteristica.label"
							default="Caracteristica" /> <span class="required-indicator">*</span>
					</label>
					<g:select id="caracteristica" name="caracteristica.id"
						from="${com.redoaxaca.Caracteristica.list()}" optionKey="id"
						required=""
						value="${caracteristicaUnidadInstance?.caracteristica?.id}"
						data-placeholder="Selecciona una característica"
						class="chzn-select" style="width:350px;" tabindex="2" 
						onChange="mostrarAlerta('mensaje', false, '');"/>
				</div>

				

				<div
					class="fieldcontain ${hasErrors(bean: caracteristicaUnidadInstance, field: 'unidad', 'error')} required">
					<label for="unidad"> <g:message
							code="caracteristicaUnidad.unidad.label" default="Unidad" /> <span
						class="required-indicator">*</span>
					</label>
					<g:select id="unidad" name="unidad.id"
						from="${com.redoaxaca.Unidad.list()}" optionKey="id" required=""
						value="${caracteristicaUnidadInstance?.unidad?.id}"
						data-placeholder="Selecciona una unidad"
						class="chzn-select tooltip" style="width:350px;" tabindex="2"
						title="" onChange="mostrarAlerta('mensaje', false, '');"
						/>
					
				</div>
			</fieldset>
			<fieldset class="buttons">
				<a class="save" onClick="validarEnvio()">Crear</a>
				<g:link name="cancel" class="cancelar" action="menu">Cancelar</g:link>
			</fieldset>
		</g:form>
	</div>
	
	<script src="${resource(dir: 'js', file: 'chosen/chosen.jquery.js')}"
		type="text/javascript"></script>
	<script type="text/javascript">
		var config = {
			'.chzn-select' : {
				no_results_text : 'No se encontró algún dato con'
			},
			'.chzn-select-deselect' : {
				allow_single_deselect : true
			},
			'.chzn-select-no-single' : {
				disable_search_threshold : 10
			},
			'.chzn-select-no-results' : {
				no_results_text : 'Oops, nothing found!'
			},
			'.chzn-select-width' : {
				width : "95%"
			}
		}
		for ( var selector in config) {
			$(selector).chosen(config[selector]);
		}
	</script>
</body>
</html>
