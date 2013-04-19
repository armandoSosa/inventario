<script type="text/javascript">
    var childCount = ${personaInstance.objetosPersona.size()} + 0;
 
    function agregarObjeto(){
      var clone = $("#objeto_clone").clone()
      var htmlId = 'objetosPersona['+childCount+'].';
      var objetoInput = clone.find("input[id$=objeto]");
 
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
      clone.find("select[id$=objeto]")
              .attr('id',htmlId + 'objeto')
              .attr('name',htmlId + 'objeto.id');      		
 
      clone.attr('id', 'objeto'+childCount);
      $("#childList").append(clone);
      clone.show();
      objetoInput.focus();
      childCount++;
    }
 
    //bind click event on delete buttons using jquery live
    $('.del-objetosPersona').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".objeto-div");
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
    <g:each var="objetosPersona" in="${personaInstance.objetosPersona}" status="i">    	       	
        <g:render template='objeto' model="['objeto':objetosPersona,'i':i,'hidden':false, 'objetosList':objetosList]"/>        
    </g:each>
</div>
<input type="button" value="Nuevo Objeto" onclick="agregarObjeto();" />