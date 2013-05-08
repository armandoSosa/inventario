<%@ page import="com.redoaxaca.Persona" %>
<g:setProvider library="jquery"/>


<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'numeroEmpleado', 'error')} required">
	<label for="numeroEmpleado">
		<g:message code="persona.numeroEmpleado.label" default="Numero Empleado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numeroEmpleado" required="" value="${personaInstance?.numeroEmpleado}" onkeypress="return validar(event, 2)"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre(s)" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personaInstance?.nombre}" style="text-transform:uppercase;"  onkeypress="return validar(event,3)"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'paterno', 'error')} required">
	<label for="paterno">
		<g:message code="persona.paterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paterno" required="" value="${personaInstance?.paterno}" style="text-transform:uppercase;" onkeypress="return validar(event,3)"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'materno', 'error')} required">
	<label for="materno">
		<g:message code="persona.materno.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label> 
	<g:textField name="materno" required="" value="${personaInstance?.materno}" style="text-transform:uppercase;" onkeypress="return validar(event,3)"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'curp', 'error')} required">
	<label for="curp">
		<g:message code="persona.curp.label" default="CURP" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="curp" name="curp" required="" value="${personaInstance?.curp}" style="text-transform:uppercase;" onkeypress="return validar(event,1)" maxlength="18"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'rfc', 'error')} required">
	<label for="rfc">
		<g:message code="persona.rfc.label" default="RFC" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="rfc" name="rfc" required="" value="${personaInstance?.rfc}" style="text-transform:uppercase;" onkeypress="return validar(event,1)" maxlength="13"/>
</div>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="persona.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${personaInstance?.email}" />
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
	<g:textField name="calle" required="" value="${direccionInstance?.calle}" style="text-transform:uppercase;" onkeypress="return validar(event,3)"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="direccion.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="colonia" required="" value="${direccionInstance?.colonia}" style="text-transform:uppercase;" onkeypress="return validar(event,3)"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'ciudad', 'error')} required">	
	<label for="ciudad">
		<g:message code="municipio.ciudad.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${!params.idEstado}">
		<g:select id="estado" name="estado.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required=""
              noSelection="['':'Seleccione un estado']"
              onchange="${remoteFunction (
                      controller: 'persona',
                      action: 'getMunicipios',
                      params: '\'id=\' + this.value',
                      update: 'municipioDiv'
              )}"
              value="${municipioInstance?.ciudad?.id}" class="many-to-one" disabled="true"/>
	</g:if>
	<g:else>
		<g:select id="estado" name="estado.id" from="${com.redoaxaca.Estado.list()}" optionKey="id" required=""
              noSelection="['':'Seleccione un estado']"
              onchange="${remoteFunction (
                      controller: 'persona',
                      action: 'getMunicipios',
                      params: '\'id=\' + this.value',
                      update: 'municipioDiv'
              )}"
              value="${params.idEstado}" class="many-to-one" disabled="true"/>
	</g:else>	
	<a class="modalbox" href="#inline">Buscar</a>		
</div>

<div id="municipioDiv" class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>	
	
	<g:select id="municipio" name="municipio.id" from="${municipiosList}" optionKey="id" required="" value="${direccionInstance?.municipio?.id}" class="many-to-one"/>		
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

