
<%@ page import="com.redoaxaca.Objeto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="metro">
<g:set var="entityName"
	value="${message(code: 'objeto.label', default: 'Objeto')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-objeto" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="menu">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="insertar5">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-objeto" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list objeto">

			<g:if test="${objetoInstance?.noInventario}">
				<li class="fieldcontain"><span id="noInventario-label"
					class="property-label"><g:message
							code="objeto.noInventario.label" default="No Inventario" /></span> <span
					class="property-value" aria-labelledby="noInventario-label"><g:fieldValue
							bean="${objetoInstance}" field="noInventario" /></span></li>
			</g:if>

			<g:if test="${objetoInstance?.objetosDepartamento}">
				<li class="fieldcontain"><span id="objetosDepartamento-label"
					class="property-label"><g:message
							code="objeto.objetosDepartamento.label"
							default="Objetos Departamento" /></span> <g:each
						in="${objetoInstance.objetosDepartamento}" var="o">
						<span class="property-value"
							aria-labelledby="objetosDepartamento-label"><g:link
								controller="objetoDepartamento" action="show" id="${o.id}">
								${o?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

			<g:if test="${objetoInstance?.objetosPersona}">
				<li class="fieldcontain"><span id="objetosPersona-label"
					class="property-label"><g:message
							code="objeto.objetosPersona.label" default="Objetos Persona" /></span>

					<g:each in="${objetoInstance.objetosPersona}" var="o">
						<span class="property-value"
							aria-labelledby="objetosPersona-label"><g:link
								controller="objetoPersona" action="show" id="${o.id}">
								${o?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

			<g:if test="${objetoInstance?.tipo}">
				<li class="fieldcontain"><span id="tipo-label"
					class="property-label"><g:message code="objeto.tipo.label"
							default="Tipo" /></span> <span class="property-value"
					aria-labelledby="tipo-label"><g:link controller="tipo"
							action="mostrar" id="${objetoInstance?.tipo?.id}">
							${objetoInstance?.tipo?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${objetoInstance?.tipoPropiedad}">
				<li class="fieldcontain"><span id="tipoPropiedad-label"
					class="property-label"><g:message
							code="objeto.tipoPropiedad.label" default="Tipo Propiedad" /></span> <span
					class="property-value" aria-labelledby="tipoPropiedad-label"><g:link
							controller="tipoPropiedad" action="show"
							id="${objetoInstance?.tipoPropiedad?.id}">
							${objetoInstance?.tipoPropiedad?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			


			<li class="fieldcontain"><span id="valores-label"
				class="property-label"><g:message code="objeto.valores.label"
						default="Arrendatario" /></span> <g:if
					test="${objetoInstance?.objetosPersona}">
					<g:each in="${objetoInstance.objetosPersona}" var="v">
						<span class="property-value" aria-labelledby="valores-label"><g:link
								controller="objetoPersona" action="mostrar" id="${v.id}">Fecha de inicio: <g:formatDate
									format="dd-MM-yyyy" date="${v?.fechaInicio}" />
							</g:link></span>
						<g:if test="${v?.fechaFin}">
							<span class="property-value" aria-labelledby="valores-label"><g:link
									controller="objetoPersona" action="mostrar" id="${v.id}">Fecha fin: <g:formatDate
										format="dd-MM-yyyy" date="${v?.fechaFin}" />
								</g:link></span>
						</g:if>
						<span class="property-value" aria-labelledby="valores-label"><g:link
								controller="objetoPersona" action="mostrar" id="${v.id}">Persona: ${v?.persona}
							</g:link></span>
						<br>
					</g:each>
				</g:if> <g:else>
					<span class="property-value" aria-labelledby="valores-label">Ninguno</span>
				</g:else>
				
				<span class="property-value" aria-labelledby="valores-label"><g:link
						controller="objetoPersona" action="insertar2"
						id="${objetoInstance.id}">Agregar persona</g:link></span></li>
				<br><br>
				
				
				
				
				
				<g:if test="${valores}">
				<li class="fieldcontain"><span id="valores-label"
					class="property-label"><h2>Características</h2></span>
							<br><br><br>
							<table><tr><th>Característica</th><th>Valor</th><th>Unidad</th></tr>
							<g:each
						in="${valores}" var="v">
						<tr>
						
								<td>${v?.plantilla?.caracteristicaUnidad?.caracteristica}</td><td><span class="property-value" aria-labelledby="valores-label"><g:link
								controller="valor" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></td><td>${v?.plantilla?.caracteristicaUnidad?.unidad}</td>
							</span>
							</tr>
					</g:each>
					<g:if test="${plantillas}">
						<g:each in="${plantillas}" var="p">
							<tr>
							<td>${p?.caracteristicaUnidad?.caracteristica}</td>
							<td><center>-</center></td>
							<td>${p?.caracteristicaUnidad?.unidad}</td>
							</tr>
						</g:each>
					</g:if>
					
					
					
					
					
					</table></li>
			</g:if>
			

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${objetoInstance?.id}" />
				<g:link class="edit" action="editar" id="${objetoInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>







