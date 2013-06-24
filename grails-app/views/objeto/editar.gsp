



<%@ page import="com.redoaxaca.Objeto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'objeto.label', default: 'Objeto')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<link rel="stylesheet"
	href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}"
	type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"
	type="text/css">
<script type="text/javascript"
	src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>

<!-- combo buscador -->
<link rel="stylesheet"
	href="${resource(dir: 'js', file: 'chosen/chosen.css')}"
	type="text/css">
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.scrollTo.js')}"></script>
<g:javascript src="jcrop/jquery.Jcrop.min.js" />

<!-- Termina combo buscador -->



<!-- basic fancybox setup -->

<g:javascript>
			var actualizaciones=0;
			var cadenaValores='valor0=0';
			var numeros="0";
			var submitObjeto = function() {
				cadenaValores=cadenaValores.replace("valor0=0", "valor0="+numeros.substring(1))+"&noInventario="+$("#noInventario").val()+"&tipoPropiedad="+$("#tipoPropiedad").val()+"&tipoObjeto="+$("#tipo").val();
		    	${ remoteFunction (controller:'objeto', action:'save_objeto3', id:'5', params: 'cadenaValores', onLoaded='start()')}
				
		    };
		    function generarCadenaValores(cadena){
		    	//alert($("#"+cadena).val());
		    	if (cadenaValores.indexOf(cadena) == -1) {//si no esta, se agrega
		    		cadenaValores+="&"+cadena+"="+$("#"+cadena).val();
		    		numeros+=cadena+"-";
		    	}
			}
			function reiniciarCadenaValores(){
		    	cadenaValores='valor0=0';
		    	numeros="0";
			}
			function start(){
			    timeout = setTimeout(reloadPage,1000);
			}
			function reloadPage() {
				location.href='listadoPorTipo';
			}
			
		</g:javascript>
<script type="text/javascript">
	$(document).ready(function() {
		$(".modalbox").fancybox();

	});
</script>
</head>

<body>
	<a href="#list-objeto" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="insertar3">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>












	<div id="create-objeto" class="content scaffold-create" role="main">
		<h1 class="titulo">Editar Objeto</h1>
		<g:form action="editar_objeto">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
					<label for="tipo"> <g:message code="objeto.tipo.label"
							default="Tipo" /> <span class="required-indicator">*</span>
					</label>
					<g:select id="tipo" name="tipo.id"
						from="${com.redoaxaca.Tipo.list()}" optionKey="id" required=""
						noSelection="['':'Seleccione un tipo']"
						value="${tipo?.id}"
						disabled="true"
						data-placeholder="Selecciona un tipo" class="chzn-select"
						style="width:350px;" tabindex="2"
						onChange="${ remoteFunction (controller:'objeto', action:'mostrarFormCarac', params: '\'id=\' + this.value', update:'divInfoTipoObjeto')}" />
				</div>
				<g:if test="${idObjeto}">
					<g:hiddenField id="idObjeto" name="idObjeto" value="${idObjeto}"/>
				</g:if>

				<g:render template="mostrarFormCaracteristicas" />
				
				
			</fieldset>

		</g:form>
	</div>

	<!-- empieza el combo buscador -->
	<script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}"
		type="text/javascript" charset="utf-8"></script>
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
	<!-- termina el combo buscador -->
</body>
</html>
