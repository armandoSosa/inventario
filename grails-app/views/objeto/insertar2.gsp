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
		    var addCaracteristica = function(idTipo)
		    {
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax', id:'2', update:'divUnidad', params: '\'caracteristica1=\' + caracteristica.value')}
		    };
		    
		    var selectCaracteristica = function(idTipo)
		    {
		         ${ remoteFunction (controller:'caracteristica', action:'addUnidadAjax', id:'1', update:'divUnidad', params: '\'caracteristica1=\' + caracteristica.value')}
		    };
		</g:javascript>
	</head>
	<body>
		<a href="#create-objeto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
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
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="forma"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		
		
		<!-- Agregar estilo de objeto -->
		<div id="inline">
			<div id="create-tipo" class="content scaffold-create" role="main">
				<h1>Nuevo Tipo</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${tipoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${tipoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form action="save_tipo" >
					<fieldset class="form">
						<g:render template="../tipo/forma"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
		
		
		
		<!-- Agregar característica-->
		<div id="inline2">
			<div id="create-caracteristica" class="content scaffold-create" role="main">
				<h1>Nueva Característica</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${caracteristicaInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${caracteristicaInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form action="save_caracteristica" >
					<fieldset class="form">
						<g:render template="../caracteristica/forma"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>

		<!-- basic fancybox setup -->
		<script type="text/javascript">
			function validateEmail(email) { 
				var reg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				return reg.test(email);
			}
		
			$(document).ready(function() {
				$(".modalbox").fancybox();
				$("#contact").submit(function() { return false; });
		
				
				$("#send").on("click", function(){
					
				});
			});
		</script>
		
	</body>
</html>
