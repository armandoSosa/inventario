<%@ page import="com.redoaxaca.Persona" %>

<fieldset>
<legend>Información personal</legend>
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

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'curp', 'error')} required">
	<label for="curp">
		<g:message code="persona.curp.label" default="Curp" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="curp" required="" value="${personaInstance?.curp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'rfc', 'error')} required">
	<label for="rfc">
		<g:message code="persona.rfc.label" default="Rfc" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rfc" required="" value="${personaInstance?.rfc}"/>
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


<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="telefono.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${telefonoInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono">
		<g:message code="telefono.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoTelefono" name="tipoTelefono.id" from="${com.redoaxaca.TipoTelefono.list()}" optionKey="id" required="" value="${telefonoInstance?.tipoTelefono?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="persona.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="foto" name="foto" />
</div>
</fieldset>

<fieldset>
<legend>Dirección</legend>


<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'calle', 'error')} required">
	<label for="calle">
		<g:message code="direccion.calle.label" default="Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="calle" required="" value="${direccionInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="direccion.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="colonia" required="" value="${direccionInstance?.colonia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="municipio.ciudad.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ciudad" name="ciudad.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.ciudad?.id}" class="many-to-one"/>
	<a class="modalbox" href="#inline">Nuevo Estado</a>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${com.redoaxaca.Municipio.list()}" optionKey="id" required="" value="${direccionInstance?.municipio?.id}" class="many-to-one"/>
	<a class="modalbox" href="#inline2">Nuevo Municipio</a>
</div>


<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noExterior', 'error')} required">
	<label for="noExterior">
		<g:message code="direccion.noExterior.label" default="No Exterior" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noExterior" required="" value="${direccionInstance?.noExterior}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noInterior', 'error')} ">
	<label for="noInterior">
		<g:message code="direccion.noInterior.label" default="No Interior" />
		
	</label>
	<g:textField name="noInterior" value="${direccionInstance?.noInterior}"/>
</div>

</fieldset>

