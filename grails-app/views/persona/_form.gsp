<%@ page import="com.redoaxaca.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'numeroEmpleado', 'error')} required">
	<label for="numeroEmpleado">
		<g:message code="persona.numeroEmpleado.label" default="Numero Empleado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numeroEmpleado" required="" value="${personaInstance?.numeroEmpleado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'paterno', 'error')} required">
	<label for="paterno">
		<g:message code="persona.paterno.label" default="Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paterno" required="" value="${personaInstance?.paterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'materno', 'error')} required">
	<label for="materno">
		<g:message code="persona.materno.label" default="Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="materno" required="" value="${personaInstance?.materno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="persona.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${personaInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="persona.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${personaInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'objetosPersona', 'error')} ">
	<label for="objetosPersona">
		<g:message code="persona.objetosPersona.label" default="Objetos Persona" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.objetosPersona?}" var="o">
    <li><g:link controller="objetoPersona" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objetoPersona" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'foto', 'error')} ">
	<label for="foto">
		<g:message code="persona.foto.label" default="Foto" />
		
	</label>
	<g:select id="foto" name="foto.id" from="${com.redoaxaca.Foto.list()}" optionKey="id" value="${personaInstance?.foto?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'curp', 'error')} ">
	<label for="curp">
		<g:message code="persona.curp.label" default="Curp" />
		
	</label>
	<g:textField name="curp" value="${personaInstance?.curp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'rfc', 'error')} ">
	<label for="rfc">
		<g:message code="persona.rfc.label" default="Rfc" />
		
	</label>
	<g:textField name="rfc" value="${personaInstance?.rfc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'archivado', 'error')} ">
	<label for="archivado">
		<g:message code="persona.archivado.label" default="Archivado" />
		
	</label>
	<g:checkBox name="archivado" value="${personaInstance?.archivado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'direcciones', 'error')} ">
	<label for="direcciones">
		<g:message code="persona.direcciones.label" default="Direcciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="direccion" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'puestosPersona', 'error')} ">
	<label for="puestosPersona">
		<g:message code="persona.puestosPersona.label" default="Puestos Persona" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.puestosPersona?}" var="p">
    <li><g:link controller="puestoPersona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="puestoPersona" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'puestoPersona.label', default: 'PuestoPersona')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="persona.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sexo" name="sexo.id" from="${com.redoaxaca.Sexo.list()}" optionKey="id" required="" value="${personaInstance?.sexo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'subordinado', 'error')} ">
	<label for="subordinado">
		<g:message code="persona.subordinado.label" default="Subordinado" />
		
	</label>
	<g:select name="subordinado" from="${com.redoaxaca.Persona.list()}" multiple="multiple" optionKey="id" size="5" value="${personaInstance?.subordinado*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="persona.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="persona.usuarios.label" default="Usuarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.usuarios?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="usuario" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</li>
</ul>

</div>

