<%@ page import="com.redoaxaca.Caracteristica" %>




<div id="divUnidad" name="divUnidad" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'unidad', 'error')} required">
			divUnidad${session.numUnidades}
			<fieldset class="form">
				<div id="contenedorSelecTipo${session.numUnidades}"
					class="fieldcontain ${hasErrors(bean: objetoInstance, field: 'tipo', 'error')} required">
					<label for="tipo1"> <g:message code="objeto.tipo.label"
							default="Tipo de objeto" /> <span class="required-indicator">*</span>
					</label>
						<g:if test="${!session.idTipo}">
							<g:select id="tipo1${session.numUnidades}" name="tipo1${session.numUnidades}" from="${com.redoaxaca.Tipo.list()}"
								noSelection="['':'Seleccione un tipo de objeto']"
								optionKey="id" required="" value="1"
								class="many-to-one"
								disabled="true"/>
					
						</g:if>
						<g:else>
							<g:select id="tipo1${session.numUnidades}" name="tipo1${session.numUnidades}" from="${com.redoaxaca.Tipo.list()}"
								noSelection="['':'Seleccione un tipo de objeto']"
								optionKey="id" required="" value="${session.idTipo}"
								class="many-to-one"
								disabled="true"/>
						</g:else>	
				</div>
				
				<div id="textFieldCaract${session.numUnidades}" class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
					<label for="caracteristica${session.numUnidades}">
						<g:message code="caracteristica.caracteristica.label" default="Caracteristica${session.numUnidades}" />
						<span class="required-indicator">*</span>
					</label>
					<g:if test="${caracteristica}">
						<g:textField id="caracteristica${session.numUnidades}" name="caracteristica${session.numUnidades}" required="" value="${caracteristica}"/>
					</g:if>
					<g:else>
						<g:textField id="caracteristica${session.numUnidades}" name="caracteristica${session.numUnidades}" required="" value="${caracteristicaInstance?.caracteristica}"/>
					</g:else>
					
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: caracteristicaInstance, field: 'caracteristica', 'error')} ">
					<g:if test="${agregarUnidad && agregarUnidad=='2'}">
							<!--<g:render template="../unidad/forma"/>-->
							<!-- <fieldset class="form"> -->
								<legend>Agregar unidad</legend>
								<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'unidad', 'error')} ">
									<label for="unidadTexto${session.numUnidades}">
										<g:message code="unidad.unidad.label" default="Unidad" />
										
									</label>
									<g:textField id="unidadTexto${session.numUnidades}" name="unidadTexto${session.numUnidades}" value="${unidadInstance?.unidad}"/>
									<br>
									<br>
									<fieldset class="buttons">
										<a id="agregar${session.numUnidades}" name="agregar${session.numUnidades}" href="javascript:void(0)" onclick="agregarUnidad();return false;">Agregar</a>
										<a id="cancelar${session.numUnidades}" name="cancelar${session.numUnidades}"href="javascript:void(0)" onclick="selectCaracteristica();return false;">Cancelar</a>
									</fieldset>
									
								</div>
							<!-- </fieldset> -->
			
					</g:if>
					<g:else>
						<label for="unidad${session.numUnidades}">
							<g:message code="caracteristica.unidad.label" default="Unidad" />
							<span class="required-indicator">*</span>
						</label>
						<g:if test="${unidadId}"> <!-- Si se agrego una unidad, debemos seleccionarla automaticamente -->
							<g:select id="unidad${session.numUnidades}" name="unidad${session.numUnidades}" from="${com.redoaxaca.Unidad.list()}" optionKey="id" required="" value="${unidadId}" class="many-to-one"/>
						</g:if>
						<g:else>
							<g:select id="unidad${session.numUnidades}" name="unidad${session.numUnidades}" from="${com.redoaxaca.Unidad.list()}" optionKey="id" required="" value="${caracteristicaInstance?.unidad?.id}" class="many-to-one"/>
						</g:else>
						
				        <a id="nuevaUnidad${session.numUnidades}" name="nuevaUnidad${session.numUnidades}" href="javascript:void(0)" onclick="addCaracteristica();return false;">Nueva unidad</a>
					</g:else>
				</div>	
			</fieldset>
			
			<fieldset class="buttons">
				<a name="create${session.numUnidades}" class="save" href="javascript:void(0)" onclick="submitCaracteristica();return false;">Crear</a>
				<!--<g:submitButton name="create" class="save" value="Crear" />-->
			</fieldset>
	
</div>



