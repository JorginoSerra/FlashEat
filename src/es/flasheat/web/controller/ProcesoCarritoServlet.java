package es.flasheat.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;

import es.flasheat.dao.impl.CategoriaDAOImpl;
import es.flasheat.model.LineaPedido;
import es.flasheat.model.Pedido;
import es.flasheat.model.Producto;
import es.flasheat.model.Provincia;
import es.flasheat.model.Restaurante;
import es.flasheat.model.Usuario;
import es.flasheat.model.criteria.RestauranteCriteria;
import es.flasheat.service.PedidoService;
import es.flasheat.service.ProductoService;
import es.flasheat.service.ProvinciaService;
import es.flasheat.service.RestauranteService;
import es.flasheat.service.impl.PedidoServiceImpl;
import es.flasheat.service.impl.ProductoServiceImpl;
import es.flasheat.service.impl.ProvinciaServiceImpl;
import es.flasheat.service.impl.RestauranteServiceImpl;
import es.flasheat.util.DataException;
import es.flasheat.web.model.Carrito;
import es.flasheat.web.model.LineaCarrito;
import es.flasheat.web.util.ActionNames;
import es.flasheat.web.util.AttributeNames;
import es.flasheat.web.util.ParameterNames;
import es.flasheat.web.util.SessionManager;
import es.flasheat.web.util.ViewPath;

/**
 * Servlet implementation class ProcesoCarrito
 */
@WebServlet("/carrito")
public class ProcesoCarritoServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(CategoriaDAOImpl.class.getName());

	private static final long serialVersionUID = 1L;
	private PedidoService pedidoService = null;
	private ProductoService productoService = null;


	public ProcesoCarritoServlet() {
		super();
		pedidoService = new PedidoServiceImpl();
		productoService = new ProductoServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter(ParameterNames.ACCION);
		if (ActionNames.ADDTOCART.equalsIgnoreCase(accion)) {
			Carrito c = (Carrito) SessionManager.get(request,AttributeNames.CARRITO);
			if (c.getLineas().isEmpty()) {
				String restaurante = request.getParameter(ParameterNames.RESTAURANTE);
				String producto = request.getParameter(ParameterNames.PRODUCTO);
				String unidades = request.getParameter(ParameterNames.UNIDADES);
				String precio = request.getParameter(ParameterNames.PRECIO);

				Long idRestaurante = Long.valueOf(restaurante);
				Long idProducto = Long.valueOf(producto);
				Integer numUnidades = Integer.valueOf(unidades);
				Double idPrecio = Double.valueOf(precio);
				Pedido p = new Pedido();
				LineaPedido l = new LineaPedido();
				
				l.setIdProducto(idProducto);
				l.setPrecio(idPrecio);
				l.setCantidad(numUnidades);
				p.setPrecio(idPrecio);
				p.setIdEstado(3);
				p.setIdRestaurante(idRestaurante);
				p.addLinea(l);
				p.setFecha(new Date());

				try {
					pedidoService.insertarCarrito(p);
					Carrito cart = (Carrito) SessionManager.get(request,AttributeNames.CARRITO);
					LineaCarrito lc = new LineaCarrito();
					Producto ppp = productoService.findById(l.getIdProducto(), "ES");
					lc.setProducto(ppp);
					lc.setUnidad(numUnidades);
					cart.add(lc);

					request.getRequestDispatcher("restaurante?accion=detalle&id="+idRestaurante).forward(request, response);

				} catch (DataException e) {
					e.printStackTrace();
				}

			} else {

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
