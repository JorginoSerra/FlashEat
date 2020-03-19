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
<div class="busquedaopcionclick" id="busopckhome" class="ui-widget ubi">
					<div class="selectc selectlocld" id="selectlchome">
						<select name="provincia" class="locld" id="provinciaList"
							onChange="getLocalidades(this.value);">
						</select>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(
		function() {
			$.ajax({
				type : "GET",
				url : "/FlashEat/localizacionws",
				data : "m=pais&pais=ES",
				success : function(data) {

					// $("#provincia-list").html(data);	 -- si fuese html
					$("#provinciaList").append("<option value='0'>Seleccionar Provincia</option>");
					for (var i = 0; i < data.length; i++) {
						$("#provinciaList").append(
								"<option value='" +data[i].id+"'>"
										+ data[i].nombre + "</option>");
					}

					$("#localidadList").empty();
				}
			});
			});
</script>
<%@include file="/html/common/footer.jsp"%>