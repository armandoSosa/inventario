<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		<script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
		<g:javascript>
			var caracteristicasAgregadas=0;
			var tipoObjetoAgregados=0;
			var unidadesAgregadas=0;
			var cadenaCaracteristica="";
			var cadenaValores='valor0=0';
			var divUnidadCadena="";
			var numeros="";
			
		    var addCaracteristica = function() {
		    	actualizarDiv();
		    	guardarSoloCaracteristica();
		    	//alert('divUnidad'+${session.numUnidades});
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax2', id:'2', update:'divUnidad', params: 'cadenaCaracteristica')}
		    	unidadesAgregadas++;
		    };
		    
		    var selectCaracteristica = function()
		    {
		    	actualizarDiv();
		    	guardarSoloCaracteristica();
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax2', id:'1', update:'divUnidad', params: 'cadenaCaracteristica')}
		    	unidadesAgregadas++;
		    };
		    
		    function actualizarDiv(){
		    	divUnidadCadena="divUnidad"+unidadesAgregadas;
		    }
		    
		    var agregarUnidad = function()
		    {
		    	guardarCaracteristicaYUnidad();
		    	unidadesAgregadas++;
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax2', id:'3', update:'divUnidad', params: 'cadenaCaracteristica')}
		    	
		    };
		    
		    var submitCaracteristica = function()
		    {	
		    	parametrosCaracteristicas();
		    	
		    	unidadesAgregadas++;
		    	
		    	${ remoteFunction (controller:'objeto', action:'save_caracteristica2', id:'4', update:'divplantilla1'+session.numUnidades, params: 'cadenaCaracteristica')}
		    	
		    	$("#inlinee"+caracteristicasAgregadas).fadeOut("fast", function(){
						$(this).before("Característica agregada correctamente");
						setTimeout("$.fancybox.close()", 1000);
						
					});
					caracteristicasAgregadas++;
				
				
		    };
		    
		    var submitTipo = function()
		    {
		    	parametroTipoObjeto();
		    	${ remoteFunction (controller:'objeto', action:'save_tipo2', id:'5', update:'divPrincipal', params: 'cadenaCaracteristica')}
		    	
		    	
		    	$(inline).fadeOut("fast", function(){
						$(this).before("Tipo de objeto agregado correctamente");
						setTimeout("$.fancybox.close()", 1000);
						$("#inline").html(html);
						
					});
				
				
				${remoteFunction(
					   action: 'addPlantillasAjaxDescripcion',
                       update: 'divplantilla1'+session.numUnidades,
					   onSuccess: 'divplantilla1'+session.numUnidades,
                       params: 'cadenaCaracteristica')}
                       
		    }
		    
		    var submitObjeto = function()
		    {	
		    	cadenaValores=cadenaValores.replace("valor0=0", "valor0="+numeros)+"&noInventario="+$("#noInventario").val()+"&tipoPropiedad="+$("#tipoPropiedad").val();
		    	${ remoteFunction (controller:'objeto', action:'save_objeto', id:'5', params: 'cadenaValores', onLoaded='start()')}
		    };
		    
		    function generarCadenaValores(cadena){
		    	//alert($("#"+cadena).val());
		    	
		    	if (cadenaValores.indexOf(cadena) == -1) {//si no esta, se agrega
		    		cadenaValores+="&"+cadena+"="+$("#"+cadena).val();
		    		numeros+=cadena+",";
		    	}
			}
			function tipoSelect() {
				alert($("#tipo"+tipoObjetoAgregados).val());
				cadenaCaracteristica='valor2='+unidadesAgregadas+'&valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&tipo="+$("#tipo"+unidadesAgregadas).val();
			}
			
			function parametrosCaracteristicas(){
		    	cadenaCaracteristica='valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&caracteristica1="+$("#caracteristica"+unidadesAgregadas).val()+"&unidadTexto="+$("#unidad"+unidadesAgregadas).val()+"&tipo1="+$("#tipo1"+unidadesAgregadas).val();
			}
			
			function parametroTipoObjeto(){
		    	cadenaCaracteristica='valor2='+unidadesAgregadas+'&valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&tipo1="+$("#tipoTexto"+unidadesAgregadas).val();
				return cadenaCaracteristica;
			}

			function guardarSoloCaracteristica() {
				//alert($("#caracteristica"+unidadesAgregadas).val());
				cadenaCaracteristica='valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&caracteristica1="+$("#caracteristica"+unidadesAgregadas).val()+'&divUnidad='+${session.numUnidades};
			}
			
			function guardarCaracteristicaYUnidad() {
				cadenaCaracteristica='valor1='+unidadesAgregadas+'&valor0='+caracteristicasAgregadas+"&caracteristica1="+$("#caracteristica"+unidadesAgregadas).val()+"&unidadTexto="+$("#unidadTexto"+unidadesAgregadas).val();
			}
			
			function reloadPage() {
				location.href='listadoPorTipo';
			}
			function start(){
			    timeout = setTimeout(reloadPage,1000);
			}
		</g:javascript>
	</head>
	<body>
		<a href="#create-objeto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listadoPorTipo"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-objeto" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${objetoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${objetoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save_objeto" >
				<fieldset class="form">
					<g:render template="forma3"/>
				</fieldset>
				<fieldset class="buttons">
					<a name="create" class="save" href="javascript:void(0)" onclick="submitObjeto();return false;">CrearObj</a>
					
				</fieldset>
			</g:form>
		</div>
		
		
		

		<!-- basic fancybox setup -->
		<script type="text/javascript">		
			$(document).ready(function() {
				$(".modalbox").fancybox();

			});
		</script>
		
	</body>
</html>
