<%@ page import="com.redoaxaca.Tipo" %>



<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'objetos', 'error')} ">
	<label for="objetos">
		<g:message code="tipo.objetos.label" default="Objetos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoInstance?.objetos?}" var="o">
    <li><g:link controller="objeto" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objeto" action="create" params="['tipo.id': tipoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objeto.label', default: 'Objeto')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'plantilla', 'error')} ">
	<label for="plantilla">
		<g:message code="tipo.plantilla.label" default="Plantilla" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoInstance?.plantilla?}" var="p">
    <li><g:link controller="plantilla" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="plantilla" action="create" params="['tipo.id': tipoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'plantilla.label', default: 'Plantilla')])}</g:link>
</li>
</ul>

</div>

