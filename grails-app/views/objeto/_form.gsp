<%@ page import="com.redoaxaca.Objeto" %>



<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'noInventario', 'error')} ">
	<label for="noInventario">
		<g:message code="objeto.noInventario.label" default="No Inventario" />
		
	</label>
	<g:textField name="noInventario" value="${objetoInstance?.noInventario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'objetosDepartamento', 'error')} ">
	<label for="objetosDepartamento">
		<g:message code="objeto.objetosDepartamento.label" default="Objetos Departamento" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${objetoInstance?.objetosDepartamento?}" var="o">
    <li><g:link controller="objetoDepartamento" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objetoDepartamento" action="create" params="['objeto.id': objetoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetoDepartamento.label', default: 'ObjetoDepartamento')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'objetosPersona', 'error')} ">
	<label for="objetosPersona">
		<g:message code="objeto.objetosPersona.label" default="Objetos Persona" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${objetoInstance?.objetosPersona?}" var="o">
    <li><g:link controller="objetoPersona" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objetoPersona" action="create" params="['objeto.id': objetoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="objeto.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${com.redoaxaca.Tipo.list()}" optionKey="id" required="" value="${objetoInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipoPropiedad', 'error')} required">
	<label for="tipoPropiedad">
		<g:message code="objeto.tipoPropiedad.label" default="Tipo Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPropiedad" name="tipoPropiedad.id" from="${com.redoaxaca.TipoPropiedad.list()}" optionKey="id" required="" value="${objetoInstance?.tipoPropiedad?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'valores', 'error')} ">
	<label for="valores">
		<g:message code="objeto.valores.label" default="Valores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${objetoInstance?.valores?}" var="v">
    <li><g:link controller="valor" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="valor" action="create" params="['objeto.id': objetoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'valor.label', default: 'Valor')])}</g:link>
</li>
</ul>

</div>

