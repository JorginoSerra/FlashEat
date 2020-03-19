<%@include file="/html/common/header.jsp"%>
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
                    <div class="productoCarrito">
                        <img src="../../img/hamburguesa-doble.png" />
                        <div class="productoDatos">
                            <div class=productoCarritoinside>
                                <h2>Hamburguesa doble + patatas + refresco</h2>
                                <p class=precio>5</p>
                            </div>
                            <div class=productoCarritoinside>
                                <select name="select" id="cantidad">
                                        <option value="1">Cantidad: 1</option> 
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4" selected>4</option>
                                        <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                    </div>
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
                                    <p class="precio">23.5</p>
                                </div>
                                <p>(5 productos)</p>
                                <a id="continuar" class="continue" href="#">Proceder al pago</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/html/common/footer.jsp"%>