<%@ page import="com.redoaxaca.Caracteristica"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'caracteristica.label', default: 'Caracteristica')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

<script type="text/javascript"
	src="${resource(dir: 'js', file: 'validacion/funciones.js')}"></script>

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
			
			function mostrarAlerta(elemento, mostrar, mensaje) {
				if (mostrar) {
					$('#'+elemento).tooltipster('update', mensaje);
					$('#caracteristica').tooltipster('show');
				} else {
					$('#'+elemento).tooltipster('hide');
				}
			}
		</script>

<!--Termina: Elementos para validacion pop up animado -->

<script type="text/javascript">
	function validarTecleo(e, tipo) {
		var pasa = validar(e, tipo);

		mostrarAlerta('caracteristica', !pasa, 'Solo se aceptan letras y números');
		return pasa;
	}

	function validarEnvio() {
		alert(serializeList($('#carac_1')))
	}

	function serializeList(container)
	{
	  var str = ''
	  var n = 0
	  var els = container.find('li')
	  for (var i = 0; i < els.length; ++i) {
	    var el = els[i]
	    var p = el.id.lastIndexOf('_')
	    if (p != -1) {
	      if (str != '') str = str + '&'
	      str = str + el.id.substring(0, p) + '[]=' + (n + 1)
	      ++n
	    }
	  }
	  return str
	}

	
	
	
</script>



<!-- Autocomplete y Sortable -->
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'autocomplete/jquery-1.9.1.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'autocomplete/jquery-ui-1.10.3.custom.js')}"></script>

<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/autocomplete', file: 'jquery-ui-1.10.3.custom.css')}" />




<style>
#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
}

#sortable li {
	margin: 0 5px 5px 5px;
	padding: 0.4em;
	height: 40px;
}

#sortable li span {
	position: absolute;
	margin-left: -1.3em;
}
</style>






<script>
var tipos = ${tipos};
var caracteristicas = ${caracteristicas};
var unidades = ${unidades};
var orden="";

var contador=1;


  $(function() {
    $( "#tipo" ).autocomplete({
      source: tipos,
      sortable: true
    });
  });


  $(function() {
	  
	    $( "#sortable" ).sortable({
	    	update: function(event, ui) {
				orden = $(this).sortable('toArray').toString();
				$("#orden").val(orden);
			}
		
		}
	    );
	    $( "#sortable" ).disableSelection();



	    
	  });

  function verificarTipo() {
	  
  }

  function enviar() {
	  orden = $("#sortable").sortable('toArray').toString();
	  $("#orden").val(orden);

	  $("#formcarac").submit();  
  }

  

  function caracteristicaSeleccionada(event, ui) {
	  var caracteristica = ui.item.value;
	  alert(caracteristica);
  }

  function addCaracteristica() {
	  
	  var cadena="";
		cadena+="<td><input id='carac_"+contador+"' name='carac_"+contador+"' style='text-transform: uppercase;' class='tooltip ui-widget' title='' required='' /></td>";
		cadena+="<td><input id='unidad_"+contador+"' name='unidad_"+contador+"' style='text-transform: uppercase;' class='tooltip ui-widget' title='' required='' /></td>";
		$('#sortable').append("<tr id='fila_"+contador+"'>"+cadena+"<td><input type='button' onClick='remover("+contador+");' value='X'/></td></tr>");

		$( "#carac_"+contador ).autocomplete({
		      source: caracteristicas,
		      sortable: true,
		      close: function( event, ui ) {
			      	var inicio = $(this).val().indexOf("(");
			      	if (inicio!=-1) {
						var fin = $(this).val().indexOf(")");
						var anterior =$(this).val();
						$(this).val(anterior.substring(0,inicio-1));
						$("#unidad_"+this.id.substring(6,this.id.length)).val(anterior.substring(inicio+1,fin));
					}
			      }
		    });
		$( "#unidad_"+contador ).autocomplete({
		      source: unidades,
		      sortable: true
		    });
	    
		contador++;
	}

	function remover(id) {
		$("#fila_"+id).remove();
	}
  </script>




<!-- Termia autocomplete y Sortable -->


</head>
<body>
	<g:render template="verificarExistencia" />
	<a href="#create-caracteristica" class="skip" tabindex="-1"><g:message
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
	<div id="create-caracteristica" class="content scaffold-create"
		role="main">
		<h1>
			<g:message code="Crear Característica" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${caracteristicaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${caracteristicaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form id="formcarac" name="formcarac" action="save_tipo2">
			<fieldset class="form">


				<div class=" fieldcontain ui-widget">
					<label for="tipo">Tipo de objeto </label> <input id="tipo"
						name="tipo" style='text-transform: uppercase;' class="tooltip"
						title="" required="" />
				</div>





				<div class="fieldcontain ">
					<table>
						<thead>
							<tr>
								<th>Característica</th>
								<th>Unidad</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="sortable">

						</tbody>
					</table>

				</div>

				<div class="fieldcontain">
					<input type="button" onClick="addCaracteristica()"
						value="+ Otra característica" />
				</div>
				<input id="orden" name="orden" type="text" value="" />

			</fieldset>
			<fieldset class="buttons">
				<a class="save" onClick="enviar()">Crear</a>
				<g:submitButton name="envio" value="enPrueba" />
				<g:link name="cancel" class="cancelar" action="menu">Cancelar</g:link>
				
			</fieldset>
		</g:form>
	</div>

</body>
</html>
