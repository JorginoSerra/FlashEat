<%@include file="/html/common/header.jsp"%>
<%@page import="es.flasheat.web.util.AttributeNames"%>
<div id="content">
	<div id="containterhome">
		<div id="busquedahome">
			<form action="/FlashEat/restaurante" id="homeform">
			<input type="hidden" name="accion" value="buscar">
			<button type="submit" class="btn btn-success">
					<i class="fa fa-search"></i>
					<a>Buscar</a>
				</button>
				<div class="busquedaopcionclick" id="ubi" class="ui-widget">
							<div class="selectc" id="selectlocld">
  						<input name="provincia" placeholder="Escribir Provincia" id="locld">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$( function() {
	 console.log("entra")
    var availableTags = <%=request.getAttribute(AttributeNames.PROVINCIAS)%>
	 console.log(availableTags)
	 var data = new Array(availableTags.length);
    for (var i = 0; i<availableTags.length; i++){
    	data[i] = availableTags[i]['nombre']
    }
    console.log(data)
    $( "#locld" ).autocomplete({
      source: data
    });
  
  } );
</script>
<%@include file="/html/common/footer.jsp"%>