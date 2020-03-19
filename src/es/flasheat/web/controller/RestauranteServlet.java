package es.flasheat.web.controller;

import java.io.IOException;
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
import es.flasheat.model.Producto;
import es.flasheat.model.Provincia;
import es.flasheat.model.Restaurante;
import es.flasheat.model.criteria.RestauranteCriteria;
import es.flasheat.service.ProductoService;
import es.flasheat.service.ProvinciaService;
import es.flasheat.service.RestauranteService;
import es.flasheat.service.impl.ProductoServiceImpl;
import es.flasheat.service.impl.ProvinciaServiceImpl;
import es.flasheat.service.impl.RestauranteServiceImpl;
import es.flasheat.util.DataException;
import es.flasheat.web.util.AttributeNames;
import es.flasheat.web.util.ParameterNames;

/**
 * Servlet implementation class RestauranteServlet
 */
@WebServlet("/restaurante")
public class RestauranteServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(CategoriaDAOImpl.class.getName());

	private static final long serialVersionUID = 1L;
	private RestauranteService restauranteService = null;
	private ProductoService productoService = null;
	private ProvinciaService provinciaService = null;
	Gson gson = new Gson();
	
	public boolean isInteger(String numero){
	    try{
	        Integer.parseInt(numero);
	        return true;
	    }catch(NumberFormatException e){
	        return false;
	    }
	}

	public RestauranteServlet() {
		super();
		restauranteService = new RestauranteServiceImpl();
		productoService = new ProductoServiceImpl();
		provinciaService = new ProvinciaServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Provincia> provincias = provinciaService.findByPais("ES");
			String provinciasJson = gson.toJson(provincias);
			request.setAttribute(AttributeNames.PROVINCIAS, provinciasJson);
		} catch (DataException e) {
			logger.warn("Sacando Provincias JSON", e);
		}

		String accion = request.getParameter(ParameterNames.ACCION);


		if("buscar".equalsIgnoreCase(accion)) {
			String comida = request.getParameter("comida"); 
			String localidad = request.getParameter("loc"); 
			String valoracion = request.getParameter("valoracion"); 
			String envio = request.getParameter("enviogratis"); 
			String provincia = request.getParameter("provincia"); 
			Integer idValoracion = 1;

			RestauranteCriteria restauranteCriteria = new RestauranteCriteria();
			if(comida != null) {
				Long idComida = Long.valueOf(comida);
				if(idComida != 0) {
					restauranteCriteria.setCategoria(idComida);
				}
			}

			if(envio != null) {
				if("on".equalsIgnoreCase(envio)) {
					boolean envioGratis=true;
					restauranteCriteria.setEnvioGratis(envioGratis);
				}
			}
			if(valoracion != null) {
				idValoracion = Integer.valueOf(valoracion); 
				restauranteCriteria.setValoracion(idValoracion);
			}
			
			if(localidad != null) {
				Long idLocalidad = Long.valueOf(localidad); 
				if(idLocalidad != 0) {
					restauranteCriteria.setLocalidad(idLocalidad);
				}
			}
			if(provincia != null && isInteger(provincia)) {
				Long idProvincia = Long.valueOf(provincia);
				if (idProvincia != 0) {
				restauranteCriteria.setIdProvincia(idProvincia);
			}}
			try {
				List<Restaurante> restaurantes = restauranteService.findByCriteria(restauranteCriteria, "ES");
				request.setAttribute(AttributeNames.RESULTADOS, restaurantes);
				request.getRequestDispatcher("/html/restaurante/restaurante-search.jsp").forward(request, response);

			} catch (DataException e) {
				logger.warn("Buscando "+restauranteCriteria, e);
			}
		}else if("detalle".equalsIgnoreCase(accion)){

			String id = request.getParameter("id");
			Long idRestaurante = Long.valueOf(id);

			try {
				List<Producto> productos= productoService.findByRestaurante(idRestaurante, "ES");
				Restaurante restaurante = restauranteService.findById(idRestaurante, "ES");
				request.setAttribute(AttributeNames.PRODUCTOS, productos);
				request.setAttribute(AttributeNames.RESTAURANTE, restaurante);
				request.getRequestDispatcher("/html/restaurante/restaurante-detail.jsp").forward(request, response);

			} catch (DataException e) {
				logger.warn("Detalles "+idRestaurante, e);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
