<%@include file="/html/common/header.jsp"%>
        <div id="content">
                <div id="crearDireccionf" style="display: none;">
                        <div id="crearDireccion">
                            <h1>Añadir nueva dirección</h1>
                            <form id="direccionfrm">
                               <div class="busquedaopcionclick">       
                                        <div class="selectc">
                                                <select name="slct" class="slct">                                        
                                                </select>
                                              </div>  
                                </div>
                                <div class="busquedaopcionclick">       
                                        <div class="selectc">
                                                <select name="slct" class="slct">                                        
                                                </select>
                                        </div>
                                </div>
                                <div class="busquedaopcionclick">       
                                        <div class="selectc">
                                                <select name="slct" class="slct">                                        
                                                </select>
                                        </div>  
                                </div>
								<div class="busquedaopcionclick">       
                                        <div class="selectc">
                                                 <input type="text" id="textoclick">
                                        </div>  
                               </div>
                            </form>
                        </div>
                    </div>
            <div id="procesoCarrito" class="procesoCarritoD">
                <img src="../../img/carrito2.png" />
            </div>
            <div id="containterCarrito">
                <div id="productosCarrito" class="productosCarritoD">
                    <div id="titulosdireccion">
                        <p>Selecciona tu dirección de envío</p>
                    </div>
                    <div id=containterDirecciones>
                        <div class="cuadrodireccion">
                            <p class="nombreD">Nombre Apellido1 Apellido2</p>
                            <p class="calleD">Calle, direccion</p>
                            <p class="localidadD">Localidad, Provincia</p>
                            <p class="telefD">Telefono: telfno</p>
                            <div class="centrarbotonD">
                                <a class="elegir" href="#">Seleccionar</a><br/>
                            </div>
                            <a class="modifD" href="">Modificar dirección</a>
                        </div>
                        <div id=containterDirecciones>
                            <div class="cuadrodireccion">
                                    <div class="centrarbotonD">
                                <a href="#" class="fa fa-plus-square iconoplusD"></a>
                                    </div>
                                <a class="modifD" onclick="nueva()">Añadir nueva dirección</a>
                            </div>
                    </div>
                </div>
            </div>
            <div id="Continuar">
                <div id="CarritoDerecha" class="cartD">
                    <div id="topCarrito">
                        <img src="../../img/direccion.png" />
                        <p>Direccion</p>
                    </div>
                    <div id="recuadroCarrito">
                        <div id="recuadroCarrito1">
                            <p>Subtotal:</p>
                            <p class="precio">23.5</p>
                        </div>
                        <p>(5 productos)</p>
                        <a id="continuar" href="#">Continuar</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
       function nueva() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
  document.getElementById("crearDireccionf").style.display = "block";
  document.getElementsByTagName("body")[0].style.overflow = "hidden";

}
    </script>
        <%@include file="/html/common/footer.jsp"%>