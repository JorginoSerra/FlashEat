<%@include file="/html/common/header.jsp"%>
<%@page import="es.flasheat.web.util.AttributeNames, es.flasheat.web.util.ParameterNames"%>
<%@page import="java.util.*, es.flasheat.model.*"%>

<div id="content">

	<form action="/FlashEat/restaurante" id="searchformm">
		<input type="hidden" name="accion" value="buscar">
		<div id="busqueda">
			<div class="busquedaopcion">
				<div class="busquedaopciontexto">
					<p>Valoración</p>
				</div>
				<div class="busquedaopcionclick">
					<div class="mover">
						<div class="valoracion">

							<fieldset class="rating">
								<input type="radio" id="star5" name="valoracion" value="5" /><label
									class="full" for="star5"></label> <input type="radio"
									id="star4" name="valoracion" value="4" /><label class="full"
									for="star4"></label> <input type="radio" id="star3"
									name="valoracion" value="3" /><label class="full" for="star3"></label>
								<input type="radio" id="star2" name="valoracion" value="2" /><label
									class="full" for="star2"></label> <input type="radio"
									id="star1" name="valoracion" value="1" /><label class="full"
									for="star1"></label>
							</fieldset>

						</div>
					</div>
				</div>
			</div>
			<div class="vl"></div>
			<div class="busquedaopcion">
				<div class="busquedaopciontexto">
					<p>Provincia</p>
				</div>
				<div class="busquedaopcionclick" class="ui-widget ubi">
					<div class="selectc selectlocld">
						<select name="provincia" class="locld" id="provinciaList"
							onChange="getLocalidades(this.value, true);">
						</select>
					</div>
				</div>
			</div>
			<div class="busquedaopcion" id="locanimado" style="display: none;">
				<div class="busquedaopciontexto">
					<p>Localidad</p>
				</div>

				<div class="busquedaopcionclick" class="ui-widget ubi">
					<div class="selectc selectlocld">
						<select name="loc" id="localidadList" class="locld">
						</select>
					</div>
				</div>
			</div>

			<div class="vl"></div>
			<div class="busquedaopcion">
				<div class="busquedaopciontexto">
					<p>Comidas</p>
				</div>
				<div class="selectc">
					<select name="comida" id="slct" form="searchformm">
						<option value="0">Todas</option>
					</select>
				</div>
			</div>
			<div class="vl"></div>
			<div class="busquedaopcion">
				<div class="busquedaopciontexto">
					<p>Envio</p>
				</div>
				<div class="busquedaopcionclick">
					<div class="demo">
						<input type="checkbox" id="enviogratis" name="enviogratis">
						<label for="enviogratis"><span></span>Envio Gratis</label>
					</div>
				</div>
			</div>
			<div class="vl"></div>
			<div class="busquedaopcion">

				<div class="busquedaopcionclick">
					<div class="demo" id="butserch">
						<button type="submit" class="btn btn-success">
							<i class="fa fa-search"></i> <a>Buscar</a>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<div id="restaurantes">
		<div class="restaurant-grid">

			<%
				List<Restaurante> restaurantes = (List<Restaurante>) request.getAttribute(AttributeNames.RESULTADOS);
				if (restaurantes != null) {
					if (restaurantes.size() != 0) {
						for (Restaurante r : restaurantes) {
			%>

			<div class="restaurant">
				<a href="/FlashEat/restaurante?accion=detalle&id=<%=r.getId()%>">
					<img src="/FlashEat/img/restaurante/<%=r.getId()%>/medium.png" />
				</a>
				<div class="infoR">
					<div class="static">
						<div class="valoracion">
							<fieldset class="ratingfixed">
								<%
									if (r.getValoracion() != null) {
													for (double i = 1; i <= 5; i++) {
														if (r.getValoracion() == 0) {
								%>
								<p>Sin valoracion</p>
								<%
									break;
														} else if (r.getValoracion() >= i) {
								%>


								<input type="radio" id="star<%=i%>" name="valoracion"
									value="<%=i%>" checked="checked" /><label class="full"
									for="star<%=i%>"></label>
								<%
									} else {
								%>

								<input type="radio" id="star<%=i%>" name="valoracion"
									value="<%=i%>" /><label class="vaciorat" for="star<%=i%>"></label>
								<%
									}

													}
								%>
								<%
									}
								%>
							</fieldset>
						</div>
					</div>
					<div class="tipoR">
						<%=r.getIdCategoria()%>
					</div>
				</div>
				<div class="hl"></div>
				<div class="textoR">
					<h2>
						<%=r.getNombre()%>
					</h2>
					<p class="envio">
						Envio
						<%
						if (r.getPrecioEnvio() == 0) {
					%>
						Gratis
						<%
						} else {
					%>
						<%=r.getPrecioEnvio()%>&euro;
						<%
							}
						%>
					</p>
					<p class="desc">
						<%=r.getDescuento()%>
						% de descuento en pedidos mayores a 40&euro;
					</p>
				</div>
			</div>

			<%
				}
					} else {
			%>
			<h2 id="noresults">NO SE HAN ENCONTRADO RESULTADOS</h2>
			<%
				}
				}
			%>
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
					}
				}).done(function() { 
					document.getElementById("provinciaList").selectedIndex = <%=request.getParameter(ParameterNames.PROVINCIA) %>;
					console.log("ejectdo localidades -  "+<%=request.getParameter(ParameterNames.PROVINCIA) %>)
					if (<%=request.getParameter(ParameterNames.PROVINCIA) %> != null){
						getLocalidades(<%=request.getParameter(ParameterNames.PROVINCIA) %>, false)
						}
				});

			
				$.ajax({
					type : "GET",
					url : "/FlashEat/tipocomidasws",
					data : "m=all&locate=ES",
					success : function(data) {

						// $("#provincia-list").html(data);	 -- si fuese html

						for (var i = 0; i < data.length; i++) {
							$("#slct").append(
									"<option value='" +data[i].id+"'>"
											+ data[i].nombre + "</option>");
						}
					}
				}).done(function() { 
					document.getElementById("slct").selectedIndex = <%=request.getParameter(ParameterNames.COMIDA) %>;
					console.log("ejectdo comida -  "+<%=request.getParameter(ParameterNames.COMIDA) %>)
					
					//Valoracion Guardar Busqueda
					for (var i = 1; i<=<%=request.getParameter(ParameterNames.VALORACION) %>; i++) {
						 $("#star"+i).prop("checked", true);
					 }
						 
				});
			});

	function getLocalidades(val, time) {
		$("#localidadList").empty();
		if (val == 0) {
			$("#locanimado").slideUp("slow", function() {
				console.log("animacionin realizada")
			});
		} else {
			if (time){
			$("#locanimado").slideDown("slow", function() {
				console.log("animacionin realizada")
			});
			} else{
			$("#locanimado").slideDown(0, function() {
				console.log("animacionin realizada")
			});
			}
			$.ajax({
				type : "GET",
				url : "/FlashEat/localizacionws",
				data : "m=loc&loc=" + val,
				success : function(data) {
					console.log(data);

					$("#localidadList").append("<option value='0'>Seleccionar Localidad</option>");
					for (var i = 0; i < data.length; i++) {
						$("#localidadList").append(
								"<option value='" +data[i].id+"'>"
										+ data[i].Nombre + "</option>");
					}

				}
			});
		}
	}
</script>
<%@include file="/html/common/footer.jsp"%>