<%@include file="/html/common/header.jsp"%>
<%@page
	import="es.flasheat.web.model.*, es.flasheat.web.controller.*, es.flasheat.web.util.*"%>

<div id="content">

	<div id="procesoCarrito">
		<img src="../../img/carrito1.png" />
	</div>

	<div id=containterCarrito>
		<div id="productosCarrito">
			<div id="labels">
				<p>Producto</p>
				<p>Precio/ud</p>
			</div>
			<%
			Carrito c = (Carrito) SessionManager.get(request,AttributeNames.CARRITO);
			double precioTotal = 0d;
if (c != null){
	for (LineaCarrito l: c.getLineas()) {
		precioTotal += l.getProducto().getPrecio() * l.getUnidad();
		%>
			<div class="productoCarrito">
				<img src="../../img/hamburguesa-doble.png" />
				<div class="productoDatos">
					<div class=productoCarritoinside>
						<h2><%=l.getProducto().getNombre()%></h2>
						<p class=precio><%=l.getProducto().getPrecio() * l.getUnidad()%>&euro;</p>
					</div>
					<div class=productoCarritoinside>
						<select name="select" id="cantidad" disabled="disabled">
							<option><%=l.getUnidad()%></option>
						</select>
					</div>
				</div>
			</div>
			<%
                     }
	}
                     %>
		</div>
		<div id="Continuar">
			<div id="CarritoDerecha">
				<div id="topCarrito">
					<img src="../../img/carrito.png" />
					<p>Carrito</p>
				</div>
				<div id="recuadroCarrito">
					<div id="recuadroCarrito1">
						<p>Subtotal:</p>
						<p class="precio"><%=precioTotal%>&euro;</p>
					</div>
					<p>(<%if (c != null) {%><%=c.getLineas().size() %><%}else{%>0<%} %> productos)</p>
					<a id="continuar" class="continue"
						href="/FlashEat/html/carrito/proceso-pago-1.jsp">Proceder al
						pago</a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/html/common/footer.jsp"%>