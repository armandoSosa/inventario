<script type="text/javascript">
    var childCount = ${personaInstance.telefonos.size()} + 0;
 
    function addPhone(){
      var clone = $("#telefono_clone").clone()
      var htmlId = 'telefonos['+childCount+'].';
      var telefonoInput = clone.find("input[id$=telefono]");
 
      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      telefonoInput.attr('id',htmlId + 'telefono')
              .attr('name',htmlId + 'telefono');
      clone.find("select[id$=tipoTelefono]")
              .attr('id',htmlId + 'tipoTelefono')
              .attr('name',htmlId + 'tipoTelefono.id');
 
      clone.attr('id', 'telefono'+childCount);
      $("#childList").append(clone);
      clone.show();
      telefonoInput.focus();
      childCount++;
    }
 
    //bind click event on delete buttons using jquery live
    $('.del-telefono').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".telefono-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }        
    });
 
</script>
 
<div id="childList">
    <g:each var="telefono" in="${personaInstance.telefonos}" status="i">
        <!-- Render the phone template (_phone.gsp) here -->        
        <g:render template='phone' model="['telefono':telefono,'i':i,'hidden':false]"/>
        <!-- Render the phone template (_phone.gsp) here -->
    </g:each>
</div>
<input type="button" value="Nuevo teléfono" onclick="addPhone();" />