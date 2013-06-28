<%@ page import="com.redoaxaca.ObjetoPersona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro">
		<g:set var="entityName" value="${message(code: 'objetoPersona.label', default: 'ObjetoPersona')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.css')}" type="text/css">
		 <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.min.js')}"></script>
		  <script type="text/javascript" src="${resource(dir: 'images', file: 'fancybox/jquery.fancybox.js?v=2.0.6')}"></script>
		  
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
	
	</head>
	<body>
		<a href="#create-objetoPersona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-objetoPersona" class="content scaffold-create" role="main">
			<h1>Asignación de Objetos</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${objetoPersonaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${objetoPersonaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="guardarObjetoPersona" >
				<fieldset class="form">				
					<div class="fieldcontain ${hasErrors(bean: objetoPersonaInstance, field: 'persona', 'error')} required">
						<label for="persona">
							<g:message code="objetoPersona.persona.label" default="Persona" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="persona" value="${personaInstance}" disabled="true"/>						
					</div>
					<br>
					<div id="objetos"></div>
					<div id="content" class="centrado">
					      <select id="countries" class="multiselect" multiple="multiple" name="caracteristicas">
					      		<g:if test="${objetosList}">
									<g:each var="objeto" in="${objetosList}">
										<option value="${objeto.id}">
											${objeto.tipo.descripcion}
										</option>
									</g:each>
								</g:if>
								<!-- Agregamos las características que ya tiene asignadas el tipo de objeto -->
								 <g:if test="${objetosList}">
									<g:each var="objeto" in="${objetosList}">
										<option value="${objeto.id}" selected="selected" disabled>
											${objeto.tipo.descripcion}
										</option>
									</g:each>
								</g:if>
					      </select>
					        
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			
		</div>
		<g:render template='objeto' model="['telefono':null,'i':'_clone','hidden':true, 'objetosList':null]"/>		
	</body>
</html>
