
<%@ page import="com.redoaxaca.Objeto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objeto.label', default: 'Objeto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-objeto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="insertar2"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		
		<div id="list-objeto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
		
		<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
			<label for="tipo">
				<g:message code="objeto.tipo.label" default="Tipo" />
			</label>
			
			<g:if test="${!idTipo}">
				<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}"
					noSelection="['':'Seleccione un tipo de objeto']"
					optionKey="id" required="" value="${objetoInstance?.tipo?.id}"
					class="many-to-one"
					onchange="${remoteFunction(
							   controller: 'objeto',
							   action: 'listadoTipoAjax',
		                       update: 'tabla',
		                       params: '\'tipo=\' + this.value')}"/>
		
			</g:if>
			<g:else>
				<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}"
					noSelection="['':'Seleccione un tipo de objeto']"
					optionKey="id" required="" value="${idTipo}"
					class="many-to-one"
					onchange="${remoteFunction(
							   controller: 'objeto',
							   action: 'listadoTipoAjax',
		                       update: 'tabla',
		                       params: '\'tipo=\' + this.value')}"/>
			</g:else>	
			
		</div>
		<br>
		<g:render template="listado"/>
	</body>
</html>
