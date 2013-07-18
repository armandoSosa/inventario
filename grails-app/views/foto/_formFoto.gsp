<g:form name="formFoto"  action="${action}" id="${id}" controller="foto" enctype="multipart/form-data">				
				<div class="fieldcontain ${hasErrors(bean: fotoInstance, field: 'foto', 'error')} required">
					<label for="foto">
						<g:message code="foto.foto.label" default="Foto" />						
					</label>
					<input type="file" id="foto" name="foto" value="${params.fotoid}" onchange="llamarInLine();"/>
					<g:hiddenField id="idpersona" name="idpersona" value="${params.id}"/>
				</div>
				<g:submitButton style="display:none;" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>