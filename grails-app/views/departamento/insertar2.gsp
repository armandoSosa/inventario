<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'objeto.label', default: 'Objeto')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
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
				.after(
						"<span class='error'><a class='modalbox' href='#inline' style='text-color:white;' >Agregar</a><br><a class='modalbox' href='#inline3' onclick='editarForm()'>Editar</a><br><a class='modalbox' href='#inline2' onClick='verificarHijos();'>Eliminar</a></span>");
	}

	function almacenarRowElemento(row) {
		rowActual = row;
	}

	function quitarEtiquetas() {
		$(".error").remove();
	}

	function verificarHijos() {
		
		var arrayHijos = chart.getChildrenIndexes(chart.getSelection()[0].row);
		if (arrayHijos.length>0){
			//hay hijos
			$("#formEliminar").html("Debe eliminar los subdepartamentos para eliminar este departamento <fieldset class='buttons'> <a name='create' class='save' href='javascript:void(0)'>Aceptar</a> </fieldset>");
		} else {
			$("#formEliminar").html("¿Estás seguro que deseas eliminar el departamento?<fieldset class='buttons'><a name='create' class='save' href='javascript:void(0)' onclick='eliminarElemento();'>Si</a></fieldset>");
		}
		//for(var i=0;i<arrayHijos.length;i++){
			//alert(arrayHijos[i]);
		//}
	}

	function eliminarElemento() {
		var arrayHijos = chart.getChildrenIndexes(chart.getSelection()[0].row);
		for (i=0; i<arrayHijos.lenght; i++) {
			data.removeRow(arrayHijos[i]);
		}
		data.removeRow(chart.getSelection()[0].row);
		chart.draw(data, {
			allowHtml : true
		});
	}
	function eliminarHijo(row){
		data.removeRow(row);
	}

	function agregarElemento() {
		//alert(contador.toString()+' '+$('#txtNuevoNodo').val()+' '+data.getValue(chart.getSelection()[0].row, 0).toString());
		//validamos si ya existe el elemento para impedir que se agregue nuevamente
		var pasa=1;
		for (var i=0; i<data.getNumberOfRows(); i++ ) {
			if (data.getFormattedValue(i,0) == $('#txtNuevoNodo').val()) {
				pasa=0;
			}
		}
		if (pasa==1) {
			data.addRows([ [ {
				v : contador.toString(),
				f : $('#txtNuevoNodo').val()
			}, data.getValue(chart.getSelection()[0].row, 0).toString(), '' ] ]);
			contador++;
			chart.draw(data, {
				allowHtml : true
			});
			$("#inline").fadeOut("fast", function() {
				$(this).before("Se ha agregado correctamente");
				setTimeout("$.fancybox.close()", 1000);
				$("#inline").html(html);
			});
		} else {
			alert('El nombre del departamento ingresado ya existe');
		}
		
	}

	function editarForm() {
		$("#formEditar").html("<input id='txtEditarLabel' type='text' value='"+data.getFormattedValue(chart.getSelection()[0].row,0)+"'><fieldset class='buttons'><a name='create' class='save' href='javascript:void(0)' onclick='editar()'>Si</a></fieldset>");
	}

	function editar() {
		data.setFormattedValue(chart.getSelection()[0].row, 0, $("#txtEditarLabel").val());
		chart.draw(data, {
			
		});
		//alert(data.getNumberOfRows());
		//alert(data.getNumberOfColumns());
	}

	function submitJSON() {
		//alert(data.toJSON());
		var datos='datos='+data.toJSON().toString();

		${ remoteFunction (controller:'departamento', action:'save_departamentos', id:'1', update:'divPrincipal', params: 'datos')}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
</script>
</head>

<body>

	<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="menu2"><g:message code="Ver departamentos" /></g:link></li>
			</ul>
		</div>
	<a id="tipoLabel" class="modalbox" href="#inline">Nuevo Tipo</a>
	<div id='chart_div'></div>
	<div id="inline" class=".inline">
		<div id="create-tipo" class="content scaffold-create" role="main">
			<h2>Agregar hijo</h2>
			<g:form action="save_tipo2">
				<fieldset class="form">
					<input id="txtNuevoNodo" name="txtNuevoNodo" type="text">
				</fieldset>
				<fieldset class="buttons">
					<a name="create" class="save" href="javascript:void(0)"
						onclick="agregarElemento();">Crear</a>
					<!--<g:submitButton name="create" class="save" value="Crear" />-->
				</fieldset>
				<fieldset class="buttons">
					<!--<g:submitButton name="create" class="save" value="Crear" />-->
				</fieldset>
			</g:form>
		</div>
	</div>
	<div id="inline2" class=".inline">
		<div id="create-tipo2" class="content scaffold-create" role="main">
			<h2>Eliminar</h2>
			<g:form action="save_tipo2">
				<div id="formEliminar"></div>
			</g:form>
		</div>
	</div>
	<div id="inline3" class=".inline">
		<div id="create-tipo2" class="content scaffold-create" role="main">
			<h2>Editar</h2>
			<g:form action="save_tipo2">
				<div id="formEditar"></div>
			</g:form>
		</div>
	</div>
	<input type='button' onclick='submitJSON();' value='mostrar'>
</body>
</html>