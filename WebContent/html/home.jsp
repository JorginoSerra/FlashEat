<%@include file="/html/common/header.jsp"%>
<div id="content">
	<div id="containterhome">
		<div id="busquedahome">
			<form action="/FlashEat/restaurante" id="homeform">
			<input type="hidden" name="accion" value="buscar">
			<button type="submit" class="btn btn-success">
					<i class="fa fa-search"></i>
					<a>Buscar</a>
				</button>
				<div class="selectc" id="selectlocld">
					<select name="localidad" id="locld" form="homeform">
						<option value="0" disabled="disabled" selected="selected">Selecciona tu localidad</option>
						<option value="1">Chantada</option>
						<option value="2">Monterroso</option>
						<option value="3">Ourense</option>
						<option value="4">A Coruña</option>
						<option value="5">Vigo</option>
					</select>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="/html/common/footer.jsp"%>