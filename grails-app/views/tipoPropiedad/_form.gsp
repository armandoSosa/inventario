<%@ page import="com.redoaxaca.TipoPropiedad" %>



<div class="fieldcontain ${hasErrors(bean: tipoPropiedadInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tipoPropiedad.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipoPropiedadInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPropiedadInstance, field: 'objetos', 'error')} ">
	<label for="objetos">
		<g:message code="tipoPropiedad.objetos.label" default="Objetos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoPropiedadInstance?.objetos?}" var="o">
    <li><g:link controller="objeto" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objeto" action="create" params="['tipoPropiedad.id': tipoPropiedadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objeto.label', default: 'Objeto')])}</g:link>
</li>
</ul>

</div>

