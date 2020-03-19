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
import es.flasheat.service.CategoriaService;
import es.flasheat.service.impl.CategoriaServiceImpl;
import es.flasheat.util.DataException;
import es.flasheat.web.util.ActionNames;
import es.flasheat.web.util.ParameterNames;

/**
 * Servlet implementation class ProvinciaServiceServlet
 */
@WebServlet("/tipocomidasws")
public class TipoDeComidaServiceServlet extends HttpServlet {
	Gson gson = new Gson();
	private static Logger logger = LogManager.getLogger(CategoriaDAOImpl.class.getName());
	private static final long serialVersionUID = 1L;

	private CategoriaService categoriaService = null;

	public TipoDeComidaServiceServlet() {
		super();
		categoriaService = new CategoriaServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Object result = null;
			String method = request.getParameter(ParameterNames.METHOD);
			if(ActionNames.ALL.equalsIgnoreCase(method)) {
				String locate = request.getParameter(ParameterNames.LOCATE);
				result = categoriaService.findAll(locate);
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
