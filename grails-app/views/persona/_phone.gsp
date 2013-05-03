<div id="telefono${i}" class="telefono-div" <g:if test="${hidden}">style="display:none;"</g:if>>

		


	<g:set id="idn" var="idn" value="${i}" />
    <g:hiddenField name='telefonos[${i}].id' value='${telefono?.id}'/>
    <g:hiddenField name='telefonos[${i}].deleted' value='false'/>
    <g:hiddenField name='telefonos[${i}].new' value='false'/> 	
    <g:textField name='telefonos[${i}].telefono' value='${telefono?.telefono}' />
    <g:select id ="telefonos[${i}].tipoTelefono" name="telefonos[${i}].tipoTelefono.id" from="${com.redoaxaca.TipoTelefono.list()}" noSelection="['':'Seleccione un tipo de telefono']" optionKey="id" required="" value=""/>
    <span  class="del-telefono" id ="telefonos[${i}].span" >
        <input type="button" value="Quitar"/>
    </span>
</div>