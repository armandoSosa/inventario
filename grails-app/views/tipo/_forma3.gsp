<%@ page import="com.redoaxaca.Tipo" %>



<div class="fieldcontain ${hasErrors(bean: tipoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipo.descripcion.label" default="Descripción" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="tipoTexto" name="tipoTexto" class="tipoTexto" required="" value=""/>
	
	<fieldset class="buttons">
		<a name="create" class="save" href="javascript:void(0)" onclick="submitTipo();return false;">Crear</a>
		<g:remoteLink name="create" class="save" action="save_tipo3" update="divPrincipal"
						        			onComplete="\$('#inline').fadeOut('fast', function(){
						\$(this).before('Persona encontrada');
						setTimeout('\$.fancybox.close()', 1000);
						
					});" params="[tipo1: parametroTipoObjeto();]">Clic</g:remoteLink>
						<!--<g:submitButton name="create" class="save" value="Crear" />-->
	</fieldset>
</div>
