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
		$(".google-visualization-orgchart-nodesel").focus();
		if(chart.getSelection()[0]!=null) {
			$("#linkAgregar").click();
		}
		//$(".google-visualization-orgchart-nodesel").after("<div id='div1' name='div1' class='divFijo'></div>");
		//$("#div1").tooltipster('update', 'hola');
		//$("#div1").tooltipster('show');
		//alert('mostrado');
		//$(".google-visualization-orgchart-nodesel").tooltipster('update', 'hola');
		//$(".google-visualization-orgchart-nodesel").tooltipster('show');
		 
		//$(".tooltip").tooltipster('update', 'hola');
		
		//$(".tooltip").tooltipster('show');
		//alert('hola');
	}

	function almacenarRowElemento(row) {
		rowActual = row;
	}

	function quitarEtiquetas() {
		$(".error").remove();
	}

	function verificarHijos() {
		
		var arrayHijos = chart.getChildrenIndexes(chart.getSelection()[0].row);
		
		if (data.getNumberOfRows()==1){
			//es el nodo raíz
			$("#formEliminar").html("No es posible eliminar el nodo raíz <fieldset class='buttons'> <a name='create' class='save' href='javascript:void(0)' onClick='cerrarFormEliminar()'>Aceptar</a> </fieldset>");
		} else if(arrayHijos.length>0){
			//hay hijos
			$("#formEliminar").html("Debe eliminar los subdepartamentos para eliminar este departamento <fieldset class='buttons'> <a name='create' class='save' href='javascript:void(0)' onClick='cerrarFormEliminar()'>Aceptar</a> </fieldset>");
		} else {
			$("#formEliminar").html("¿Estás seguro que deseas eliminar el departamento?<fieldset class='buttons'><a name='create' class='save' href='javascript:void(0)' onclick='eliminarElemento();'>Si</a></fieldset>");
		}
		//for(var i=0;i<arrayHijos.length;i++){
			//alert(arrayHijos[i]);
		//}
	}

	function cerrarFormEliminar() {
		$("#inline2").fadeOut("fast", function() {
			$(this).before("No se ha realizado algún cambio");
			setTimeout("parent.$.fancybox.close()", 1000);
		});
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


		$("#inline2").fadeOut("fast", function() {
			$(this).before("Se ha eliminado correctamente");
			setTimeout("parent.$.fancybox.close()", 1000);
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
		$(".google-visualization-orgchart-nodesel").focus();
		
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
				setTimeout("parent.$.fancybox.close()", 1000);
			});
			$("#txtNuevoNodo").val("");
		} else {
			alert('El nombre del departamento ingresado ya existe');
		}
		
	}

	function editarForm() {
		$("#formEditar").html("<input id='txtEditarLabel' type='text' value='"+data.getFormattedValue(chart.getSelection()[0].row,0)+"'><fieldset class='buttons'><a name='create' class='save' href='javascript:void(0)' onclick='editar()'>Si</a></fieldset>");

	}

	function editar() {
		data.setFormattedValue(chart.getSelection()[0].row, 0, $("#txtEditarLabel").val());
		chart.draw(data, {});
		$("#inline3").fadeOut("fast", function() {
			$(this).before("Se ha editado correctamente");
			setTimeout("parent.$.fancybox.close()", 1000);
		});
		$("#txtEditarLabel").val("");
		
		//alert(data.getNumberOfRows());
		//alert(data.getNumberOfColumns());
	}

	function submitJSON() {
		//alert(data.toJSON());
		
		$("#datos").val(data.toJSON().toString());
		$("#formulario").submit();

		
		//document.location.href="/inventarios3/departamento/menu2";
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
</script>











<!-- Elementos para validacion pop up animado -->
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/tooltipster-master/css', file: 'tooltipster.css')}" />
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'tooltipster-master/js/jquery.tooltipster.js')}"></script>

<script>
			$(document).ready(function() {
				
				$('.tooltip').tooltipster({
				    animation: 'grow',
				    trigger: 'custom',
				    position: 'right'
				});
			});
		</script>

<!--Termina: Elementos para validacion pop up animado -->





<style type="text/css">
.divFijo {
	width: 2px;
}
</style>

</head>

<body>
	<a id='linkAgregar' name='linkAgregar' class='modalbox' href='#inline4'  hidden='true'>Agregar</a>

	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="menu2">
					<g:message code="Ver departamentos" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-objeto" class="content scaffold-list" role="main">
		<h1>Modificar Departamentos</h1>
		<br>
		
		<br>
		<fieldset class="form">
			Dé clic sobre el departamento al que desea hacer modificaciones
			<br>
			<br>
			<div id='chart_div' style="border-style:solid;padding: 10px; "></div>
		</fieldset>

	</div>
	

	<div id="inline" name="inline" class=".inline">
		<div id="create-tipo" class="content scaffold-create" role="main">
			<h2>Agregar hijo</h2>
			<g:form action="save_tipo2">
				<fieldset class="form">
					<input id="txtNuevoNodo" name="txtNuevoNodo" type="text">
				</fieldset>
				<fieldset class="buttons">
					<a class="save" onclick="agregarElemento();">Crear</a>
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
	
	<div id="inline4" class=".inline">
		<div id="create-tipo2" class="content scaffold-create" role="main">
			<div id="selecOpcion" name="selecOpcion">
				<h2>Seleccione la opción deseada</h2>
				
				
				<br><br>
				<table>
					<tr>
						<td><a class='modalbox add' href='#inline' style='text-color:white;'>Agregar</a></td>
						<td><a class='modalbox edit' href='#inline3' onclick='editarForm()' >Editar</a></td>
						<td><a class='modalbox delete' href='#inline2' onClick='verificarHijos();'>Eliminar</a></td>
					</tr>
				</table>
				
				<br>
				
				<br>
				
				
				
				
				<g:form action="save_tipo2">
	
					<div id="formEditar"></div>
	
				</g:form>
			</div>
		</div>
	</div>
	<g:form id="formulario" name="formulario" action="save_departamentos">
		<g:hiddenField name="datos" id="datos"  />
		<fieldset class="buttons">
					
					<a name="create" class="save" href="javascript:void(0)"	onclick="submitJSON();return false;">Guardar</a>
					<g:link name="cancel" class="cancelar" action="menu2">Cancelar</g:link>
		</fieldset>
	
	</g:form>
</body>
</html>