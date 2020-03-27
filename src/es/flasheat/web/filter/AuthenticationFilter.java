package es.flasheat.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import es.flasheat.dao.impl.CategoriaDAOImpl;
import es.flasheat.model.Usuario;
import es.flasheat.web.util.AttributeNames;
import es.flasheat.web.util.SessionManager;
import es.flasheat.web.util.ViewPath;

/**
 * Servlet AuthenticationFilter
 */
//@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/html/user/edit-profile.jsp"})
public class AuthenticationFilter implements Filter {
	private static Logger logger = LogManager.getLogger(CategoriaDAOImpl.class.getName());

	public AuthenticationFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String url = httpRequest.getRequestURL().toString();

		Usuario u = (Usuario) SessionManager.get(httpRequest, AttributeNames.USUARIO);
		if(u==null) {
			httpResponse.sendRedirect(ViewPath.LOGINC);
		} else {
			chain.doFilter(request, response);
		}
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
