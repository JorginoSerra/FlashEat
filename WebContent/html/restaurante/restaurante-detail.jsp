<%@include file="/html/common/header.jsp"%>
<%@page import="es.flasheat.web.util.AttributeNames"%>
<%@page import="java.util.*, es.flasheat.model.*"%>


<div id="content">
	<div class="topDetalles">
		<%								
						Restaurante restaurante = (Restaurante) request.getAttribute(AttributeNames.RESTAURANTE);
						if (restaurante != null) {
							%>
		<img
			src="/FlashEat/img/restaurante/<%=restaurante.getId()%>/medium.png" />

		<div class="topDetallesInfo">
			<div class=topDetallestop>

				<div class="Seguir">
					<input type="checkbox" id="Seguir" name="Seguir"> <label
						for="Seguir"><span></span>Seguir</label>
				</div>
				<div class="titulo">
					<h1><%=restaurante.getNombre()%></h1>
				</div>
				<div class="static">
					<div class="valoracion">
						<fieldset class="ratingfixed">
							<%				
							if(restaurante.getValoracion() != null){
							for (double i = 1; i<=5; i++) {
								if(restaurante.getValoracion()==0){
									%>
							<p id="novaloracion">Sin valoracion</p>
							<%
								break;
								}
								else if(restaurante.getValoracion()>=i){
									
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
			</div>


			<div class=topDetallesmed>
				<div class="infoD">
					<img src="/FlashEat/img/direccion.png" />
					<p>Calle de Alcalá, 4, Madrid, 28014</p>
				</div>
				<div class="infoD">
					<img src="/FlashEat/img/telefono.png" />
					<p><%=restaurante.getTelefono()%></p>
				</div>
				<div class="infoD">
					<img src="/FlashEat/img/bicicleta.png" />
					<p>
						Envio:
						<%if (restaurante.getPrecioEnvio()==0){
							%>
						Gratis
						<% 
						}else {%>
						<%=restaurante.getPrecioEnvio()%>&euro;
						<%} %>
					</p>
				</div>
				<div class="infoD">
					<img src="/FlashEat/img/regalo.png" />
					<p class=desc><%=restaurante.getDescuento()%>&euro; de
						descuento por pedidos mayores a 40&euro;
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="contentDetalles">
		<div id="menuD">
			<ul id="menuDetalle">
				<li><a href="#">Productos</a></li>
				<li><a href="#">Opiniones</a></li>
			</ul>
		</div>
		<div id="productos">
			<%
                  		List<Producto> productos =  (List<Producto>) request.getAttribute(AttributeNames.PRODUCTOS);
						if (productos != null) {
							for (Producto p : productos) {
					%>
			<div class="producto">
				<img src="/FlashEat/img/<%=p.getId()%>.png" />
				<div class="productoDatos">
					<div class=productoDatosinside>
						<h2><%=p.getNombre()%></h2>
						<p class=precio><%=p.getPrecio()%>&euro;/ud
						</p>
					</div>
					<div class=productoDatosinside>
						<p class="descripcion"><%=p.getDescripcion() %></p>
						<a href="#" class=anadirCarrito>Añadir al carrito</a>
					</div>
				</div>
			</div>
			<%
							}
							}
							}
						%>
		</div>
	</div>
</div>
<%@include file="/html/common/footer.jsp"%>