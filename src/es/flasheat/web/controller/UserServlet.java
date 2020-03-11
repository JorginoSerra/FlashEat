package es.flasheat.web.controller;
import java.io.IOException;
import java.net.http.HttpResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import es.flasheat.dao.impl.CategoriaDAOImpl;
import es.flasheat.model.Usuario;
import es.flasheat.service.UsuarioService;
import es.flasheat.service.impl.UsuarioServiceImpl;
import es.flasheat.util.DataException;
import es.flasheat.util.MailException;
import es.flasheat.util.PasswordEncryptionUtil;
import es.flasheat.web.util.*;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(CategoriaDAOImpl.class.getName());

	public static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd"); 
	
	private UsuarioService userService = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		userService = new UsuarioServiceImpl();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter(ParameterNames.ACCION);
		if (ActionNames.REGISTRO.equalsIgnoreCase(accion)) {
			// TODO Auto-generated method stub
			String nombre = request.getParameter(ParameterNames.NOMBRE);
			String apellidos = request.getParameter(ParameterNames.APELLIDOS);
			String fechaNac = request.getParameter(ParameterNames.FECHA_NAC);	
			String telefono = request.getParameter(ParameterNames.TELEFONO);
			String sexo = request.getParameter(ParameterNames.SEXO);
			String email = request.getParameter(ParameterNames.EMAIL);
			String contraseña = request.getParameter(ParameterNames.CONTRASENA);
			
			logger.debug("Fecha nacimiento{} ", fechaNac);
			Date fechanacimiento = null;
			try {
				fechanacimiento = DATE_FORMAT.parse(fechaNac);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				logger.warn("convirtiendo fechanacimiento "+fechaNac, e);
				response.getWriter().append("Se ha producido un error: "+e.getMessage());
			}  		
			
			Usuario u = new Usuario();
			u.setNombre(nombre);
			u.setApellidos(apellidos);
			u.setFechaDeNacimiento(fechanacimiento);
			u.setIdSexo(sexo);
			u.setEmail(email);
			u.setContraseña(contraseña);
			u.setTelefono(telefono);
			
			try {
				Usuario up = userService.findByEmail(u.getEmail());
				if(up == null) {
					userService.insertar(u);
					up = userService.findByEmail(u.getEmail());
					if(up == null) {
						response.getWriter().append("Ha ocurrido un error, no se ha podido registrar").append(request.getContextPath());
					}else {
						request.getRequestDispatcher("html/home.jsp").forward(request, response);
					}
				}else {
					response.getWriter().append("Ya existe una cuenta con este correo electrónico").append(request.getContextPath());
				}

			} catch (DataException e) {
				logger.warn("Registrando "+email, e);
				response.getWriter().append("Se ha producido un error: "+e.getMessage());
			} catch (MailException e) {
				logger.warn("Enviando mail a "+email, e);
				response.getWriter().append("Se ha producido un error: "+e.getMessage());
			}
		}

		else if(ActionNames.LOGIN.equalsIgnoreCase(accion)) {
			String login = request.getParameter(ParameterNames.LOGIN);
			String password = request.getParameter(ParameterNames.PASSWORD);
			logger.debug("Logging email {}",login);
			try {
				Usuario u = userService.findByEmail(login);
				if (u == null || (!PasswordEncryptionUtil.checkPassword(password, u.getContraseña()))) {
					response.getWriter().append("Usuario y/o Contraseña incorrecto");				
				} else {
					request.getSession().setAttribute("usuario", u);
					request.getRequestDispatcher("html/home.jsp").forward(request, response);
				}
			} catch (DataException e) {
				logger.warn("Autenticando "+login, e);
				response.getWriter().append("Se ha producido un error: "+e.getMessage());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
