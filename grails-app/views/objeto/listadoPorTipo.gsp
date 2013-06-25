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
<!-- termina combo buscador -->

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
	<g:render template="listadoTipo" />


	<!-- combo buscador -->
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
	<!-- termina combo buscador -->


</body>
</html>
