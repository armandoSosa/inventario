<%@ page import="com.redoaxaca.Valor" %>



<div class="fieldcontain ${hasErrors(bean: valorInstance, field: 'objetos', 'error')} required">
	<label for="objetos">
		<g:message code="valor.objetos.label" default="Objetos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objetos" name="objetos.id" from="${com.redoaxaca.Objeto.list()}" optionKey="id" required="" value="${valorInstance?.objetos?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: valorInstance, field: 'plantilla', 'error')} required">
	<label for="plantilla">
		<g:message code="valor.plantilla.label" default="Plantilla" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plantilla" name="plantilla.id" from="${com.redoaxaca.Plantilla.list()}" optionKey="id" required="" value="${valorInstance?.plantilla?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: valorInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="valor.valor.label" default="Valor" />
		
	</label>
	<g:textField name="valor" value="${valorInstance?.valor}"/>
</div>

