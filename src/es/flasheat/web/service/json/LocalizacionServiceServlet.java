package es.flasheat.web.service.json;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;

import es.flasheat.dao.impl.CategoriaDAOImpl;
import es.flasheat.service.LocalidadService;
import es.flasheat.service.ProvinciaService;
import es.flasheat.service.impl.LocalidadServiceImpl;
import es.flasheat.service.impl.ProvinciaServiceImpl;
import es.flasheat.util.DataException;

/**
 * Servlet implementation class ProvinciaServiceServlet
 */
@WebServlet("/localizacionws")
public class LocalizacionServiceServlet extends HttpServlet {
	Gson gson = new Gson();
	private static Logger logger = LogManager.getLogger(CategoriaDAOImpl.class.getName());
	private static final long serialVersionUID = 1L;

	private ProvinciaService provinciaService = null;
	private LocalidadService localidadService = null;

	public LocalizacionServiceServlet() {
		super();
		provinciaService = new ProvinciaServiceImpl();
		localidadService = new LocalidadServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Object result = null;
			String method = request.getParameter("m");
			if("nombre".equalsIgnoreCase(method)) {
				String nombre = request.getParameter("nombre");

				result = provinciaService.findByNombre(nombre);

			}else if ("pais".equalsIgnoreCase(method)) {
				String pais = request.getParameter("pais");
				result = provinciaService.findByPais(pais);
			}
			else if ("loc".equalsIgnoreCase(method)) {
				String loc = request.getParameter("loc");
				Long idLoc = Long.valueOf(loc);
				result = localidadService.findByProvincia(idLoc);
			}
			else {
				logger.warn("Unknow requested method: {}", method);
			}

			String json = gson.toJson(result);
			logger.info(json);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(json);
			out.flush();

		} catch (DataException e) {
			logger.warn("Sacando Provincias JSON", e);
		}catch (Exception e) {
			logger.warn("Sacando Provincias JSON", e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
