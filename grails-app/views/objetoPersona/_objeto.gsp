<div id="objeto${i}" class="objeto-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='objetosPersona[${i}].id' value='${objeto?.id}'/>
    <g:hiddenField name='objetosPersona[${i}].deleted' value='false'/>
    <g:hiddenField name='objetosPersona[${i}].new' value='false'/>    
    <g:select id="objetosPersona[${i}].objeto" name="objetosPersona[${i}].objeto.id" from="${com.redoaxaca.Objeto.list()}" optionKey="id" required="" value="${objetoPersonaInstance?.objeto?.id}"/>       
    <span class="del-objetosPersona">
        <input type="button" value="Quitar"/>
    </span>   
</div>