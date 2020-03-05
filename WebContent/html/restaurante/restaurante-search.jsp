<%@include file="/html/common/header.jsp"%>
<%@page import="es.flasheat.web.util.AttributeNames"%>
<%@page import="java.util.*, es.flasheat.model.*"%>

<div id="content">

	<form action="/FlashEat/restaurante" id="searchformm">
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
					<p>Ubicación</p>
				</div>
				<div class="busquedaopcionclick" id="ubi">
					<input type="hidden" name="accion" value="buscar">
					<div class="selectc" id="selectlocld">
						<select name="localidad" id="locld" form="searchformm">
							<option value="0" disabled="disabled" selected="selected">Localidad</option>
							<option value="1">Chantada</option>
							<option value="2">Monterroso</option>
							<option value="3">Ourense</option>
							<option value="4">A Coruña</option>
							<option value="5">Vigo</option>
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
						<option value="1">Arabe</option>
						<option value="2">Hamburguesas</option>
						<option value="3">Italiana</option>
						<option value="4">Japonesa</option>
						<option value="5">Mexicana</option>
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
					<i class="fa fa-search"></i>
					<a>Buscar</a>
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
							if (restaurantes.size()!=0){
							for (Restaurante r : restaurantes) {
					%>

			<div class="restaurant">
				<a href="/FlashEat/restaurante?accion=detalle&id=<%=r.getId()%>">
				<img src="/FlashEat/img/restaurante/<%=r.getId()%>/medium.png" /></a>
				<div class="infoR">
					<div class="static">
						<div class="valoracion">
							<fieldset class="ratingfixed">
								<%				
							if(r.getValoracion() != null){
							for (double i = 1; i<=5; i++) {
								if(r.getValoracion()==0){
									%>
								<p>Sin valoracion</p>
								<%
								break;
								}
								else if(r.getValoracion()>=i){
									
					%>


								<input type="radio" id="star<%=i %>" name="valoracion"
									value="<%=i %>" checked="checked" /><label class="full"
									for="star<%=i %>"></label>
								<%}else{%>

								<input type="radio" id="star<%=i %>" name="valoracion"
									value="<%=i %>" /><label class="vaciorat" for="star<%=i %>"></label>
								<%}
								
								}%>
								<%}%>
							</fieldset>
						</div>
					</div>
					<div class="tipoR">
						<%=
									r.getIdCategoria()
								%>
					</div>
				</div>
				<div class="hl"></div>
				<div class="textoR">
					<h2>
						<%=
									r.getNombre()
								%>
					</h2>
					<p class="envio">
						Envio
						<%if (r.getPrecioEnvio()==0){
							%>
							Gratis
							<% 
						}else {%>
						<%=r.getPrecioEnvio()%>&euro;
						<%} %>
					</p>
					<p class="desc">
						<%=
									r.getDescuento()
								%>
						% de descuento en pedidos mayores a 40&euro;
					</p>
				</div>
			</div>

			<%
						}
						}else{
							%>
							<h2 id="noresults">NO SE HAN ENCONTRADO RESULTADOS</h2>
							<%
						}
						}
					%>
		</div>
	</div>
</div>

<%@include file="/html/common/footer.jsp"%>