<%@ page import="com.redoaxaca.Persona" %>
<g:setProvider library="jquery"/>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'numeroEmpleado', 'error')} required">
	<label for="numeroEmpleado">
		<g:message code="persona.numeroEmpleado.label" default="Número Empleado" />
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

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimientoP">
		<g:message code="persona.fechaNacimiento.label" default="Fecha de Nacimiento" />		
	</label>
	<g:datePicker name="fechaNacimientoP" precision="day"  value="${personaInstance?.fechaNacimiento}" disabled="true" />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="persona.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${personaInstance?.email}" onblur="validarFocus(5, this.id, this.value);" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'telefono', 'error')} ">
<label for="telefono">
<g:message code="persona.telefono.label" default="Telefono" />
</label>
<input type="button" value="Nuevo Teléfono" name="telefono" onclick="crear(this)" />
<input type="hidden" id="cantidad" name="cantidad" value="${personaInstance?.telefonos?.size()}">
<input type="hidden" id="idfoto" name="idfoto" value="${params.id}"/>	
<fieldset id="fiel">
<g:set var="contador" value="${1}" />
<g:each in="${personaInstance?.telefonos?}" var="t">
<div id="div${contador}">
<input type="text" id="num${contador}" name="num${contador}" required="" value="${t.telefono}" maxLength="10" onkeypress="return validarTecleo(event, 2, this.id)" onblur="validarFocus(4, this.id, this.value);" class="tooltip"/>	
<g:select name="tipo${contador}" value="${t?.tipoTelefono?.id}" from="${com.redoaxaca.TipoTelefono.list()}" optionKey="id" required=""/>		
<input type="button" name="div${contador}" value="Quitar" onclick="borrar(this.name)"/>
<g:set var="contador" value="${contador + 1}" />
</div> 
</g:each>
</fieldset>	
</div>


<br><br>
<fieldset>
<legend>Dirección</legend>


<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'calle', 'error')} required">
	<label for="calle">
		<g:message code="direccion.calle.label" default="Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="calle" required="" value="${personaInstance?.direcciones?.calle?.get(index_direccion)}" style="text-transform:uppercase;" onkeypress="return validarTecleo(event, 4, this.id)" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noExterior', 'error')} required">
	<label for="noExterior">
		<g:message code="direccion.noExterior.label" default="No Exterior" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noExterior" required="" value="${personaInstance?.direcciones?.noExterior?.get(index_direccion)}" style="text-transform:uppercase;" class="tooltip"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'noInterior', 'error')} ">
	<label for="noInterior">
		<g:message code="direccion.noInterior.label" default="No Interior" />
		
	</label>
	<g:textField name="noInterior" value="${personaInstance?.direcciones?.noInterior?.get(index_direccion)}" style="text-transform:uppercase;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="direccion.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="colonia" required="" value="${personaInstance?.direcciones?.colonia?.get(index_direccion)}" style="text-transform:uppercase;" onkeypress="return validarTecleo(event, 4, this.id)" class="tooltip"/>
</div>

<div id="procedencia">
<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="municipio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${com.redoaxaca.Estado.list() }" optionKey="id" required=""
		noSelection="['': 'Seleccione un estado']"								 
		data-placeholder="Seleccione un estado" class="chzn-select" 
		value="${personaInstance?.direcciones?.municipio?.estado?.id.get(index_direccion)}"
		style="width:350px;" tabindex="2"		
		onChange="${ remoteFunction (
			controller:'estado', 
			action:'mostrarMunicipios', 
			params: '\'id=\' + this.value',
			update:'municipioDiv')}"/>	
</div>
<div id="municipioDiv" class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'municipio', 'error')} required">	
	<g:if test="${personaInstance?.direcciones?.municipio?.nombre}">
		<label for="municipio">
		<g:message code="direccion.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
		<g:select id="municipio" name="municipio.id" from="${com.redoaxaca.Municipio.list()}" optionKey="id" required=""
                  value="${personaInstance?.direcciones?.municipio?.id.get(index_direccion)}" data-placeholder="Selecciona un municipio" class="chzn-select" style="width:350px;" tabindex="2"/>		
	</g:if>
</div>
</div>


</fieldset>
<script src="${resource(dir: 'js', file: 'chosen/chosen.jquery.js')}" type="text/javascript"></script>
  <script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {no_results_text:'No se encontró algún dato'},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'No se encontró algún dato'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>

