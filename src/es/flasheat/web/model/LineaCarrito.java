package es.flasheat.web.model;

import es.flasheat.model.Producto;

public class LineaCarrito {

	private Producto producto = null;
	private int unidad = 0;
	 
	/**
	 * Aqui si tiene sentido un constructor asi.
	 * @param producto
	 * @param unidad
	 * @return
	 */
	public LineaCarrito() {
	}
	public LineaCarrito(Producto producto, int unidad ) {
		setProducto(producto);
		setUnidad(unidad);
	}

	public Producto getProducto() {
		return producto;
	}
 
	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public int getUnidad() {
		return unidad;
	}

	public void setUnidad(int unidad) {
		this.unidad = unidad;
	}
	
}
