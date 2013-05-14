<%@ page import="com.redoaxaca.Persona" %>
<g:setProvider library="jquery"/>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'numeroEmpleado', 'error')} required">
	<label for="numeroEmpleado">
		<g:message code="persona.numeroEmpleado.label" default="Numero Empleado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numeroEmpleado" required="" value="${personaInstance?.numeroEmpleado}" onkeypress="return validarTecleo(event, 2, this.id)" onblur="validarFocus(4, this.id, this.value);" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoPersonaInstance, field: 'puesto', 'error')} required">
	<label for="puesto">
		<g:message code="puestoPersona.puesto.label" default="Puesto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="puesto" name="puesto.id" from="${com.redoaxaca.Puesto.list()}" optionKey="id" required="" value="${puestoPersonaInstance?.puesto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre(s)" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personaInstance?.nombre}" style="text-transform:uppercase;"  onkeypress="return validarTecleo(event, 3, this.id)" onblur="validarFocus(3, this.id, this.value);" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'paterno', 'error')} required">
	<label for="paterno">
		<g:message code="persona.paterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paterno" required="" value="${personaInstance?.paterno}" style="text-transform:uppercase;" onkeypress="return validarTecleo(event, 3, this.id)" onblur="validarFocus(3, this.id, this.value);"class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'materno', 'error')} required">
	<label for="materno">
		<g:message code="persona.materno.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label> 
	<g:textField name="materno" required="" value="${personaInstance?.materno}" style="text-transform:uppercase;" onkeypress="return validarTecleo(event, 3, this.id)" onblur="validarFocus(3, this.id, this.value);" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'curp', 'error')} required">
	<label for="curp">
		<g:message code="persona.curp.label" default="CURP" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="curp" name="curp" required="" value="${personaInstance?.curp}" style="text-transform:uppercase;" onkeypress="return validarString(event, this.id, 18, this.value)" onblur="validarFocus(1, this.id, this.value);" class="tooltip" maxlength="18"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'rfc', 'error')} required">
	<label for="rfc">
		<g:message code="persona.rfc.label" default="RFC" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="rfc" name="rfc" required="" value="${personaInstance?.rfc}" style="text-transform:uppercase;" onkeypress="return validarString(event, this.id, 13, this.value)" onblur="validarFocus(2, this.id, this.value);" class="tooltip" maxlength="13"/>
</div>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="persona.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${personaInstance?.email}" onblur="validarFocus(5, this.id, this.value);" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'telefono', 'error')} ">
	<table>
		<tbody>			
			<tr class="prop">
				<td valign="top" class="name"><label for="books">Teléfono:</label></td>
				<td valign="top" class="value ${hasErrors(bean:personaInstance,field:'persona','errors')}">
				<g:render template="phones" model="['personaInstance':personaInstance]" />
				</td>
			</tr>
		</tbody>
	</table>
</div>

<br><br>
<fieldset>
<legend>Dirección</legend>


<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'calle', 'error')} required">
	<label for="calle">
		<g:message code="direccion.calle.label" default="Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="calle" required="" value="${direccionInstance?.calle}" style="text-transform:uppercase;" onkeypress="return validarTecleo(event, 4, this.id)" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="direccion.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="colonia" required="" value="${direccionInstance?.colonia}" style="text-transform:uppercase;" onkeypress="return validarTecleo(event, 4, this.id)" class="tooltip"/>
</div>

<div id="procedencia">
<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">	
	<label for="estado">
		<g:message code="municipio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" required="" value="${estadoInstance?.nombre}" style="text-transform:uppercase;" disabled="true" class="tooltip"/>	
	<a class="modalbox" href="#inline" onclick="ocultarValidaciones()">Buscar</a>		
</div>

<div id="municipioDiv" class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">	
</div>
</div>
<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noExterior', 'error')} required">
	<label for="noExterior">
		<g:message code="direccion.noExterior.label" default="No Exterior" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noExterior" required="" value="${direccionInstance?.noExterior}" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noInterior', 'error')} ">
	<label for="noInterior">
		<g:message code="direccion.noInterior.label" default="No Interior" />
		
	</label>
	<g:textField name="noInterior" value="${direccionInstance?.noInterior}"/>
</div>

</fieldset>

