package es.flasheat.web.model;

import java.util.ArrayList;
import java.util.List;

public class Carrito {
	
private List<LineaCarrito> lineas = null;
	
	public Carrito() {
		lineas = new ArrayList<LineaCarrito>();
	}
	
	public void add(LineaCarrito p) {
		lineas.add(p);
	}

	public List<LineaCarrito> getLineas() {
		return lineas;
	}

	public void setLineas(List<LineaCarrito> lineas) {
		this.lineas = lineas;
	}

}
