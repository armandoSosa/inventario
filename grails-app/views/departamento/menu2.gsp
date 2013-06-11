<html>
<head>

<g:set var="entityName"
	value="${message(code: 'objeto.label', default: 'Objeto')}" />
<title>Ver departamentos</title>
<link rel="stylesheet"
	href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}"
	type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css/validacion', file: 'estilos.css')}"
	type="text/css">
<script type="text/javascript"
	src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'googleApi.js')}"></script>

<script type='text/javascript'>
	google.load('visualization', '1', {
		packages : [ 'orgchart' ]
	});
	google.setOnLoadCallback(drawChart);
	var chart;
	var data;
	var contador = 6;
	var rowActual;

	function drawChart() {
		data = new google.visualization.DataTable();
		data.addColumn('string', 'Name');
		data.addColumn('string', 'Manager');
		data.addColumn('string', 'ToolTip');
		data
				.addRows(${datos});
		chart = new google.visualization.OrgChart(document
				.getElementById('chart_div'));
		google.visualization.events.addListener(chart, 'select', selectHandler);
		chart.draw(data, {
			allowHtml : true
		});
	}

	function selectHandler() {
		$(".error").remove();
		$(".google-visualization-orgchart-nodesel")
				.focus()
				
	}


</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
</script>
</head>

<body>
	<a id="tipoLabel" class="modalbox" href="#inline">Nuevo Tipo</a>
	<div id='chart_div'></div>

</body>
</html>