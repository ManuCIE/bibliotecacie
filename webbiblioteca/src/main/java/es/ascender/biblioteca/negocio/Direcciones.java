package es.ascender.biblioteca.negocio;

public class Direcciones {

	private String dni;
	private String calle;
	private String numero;
	private int codigopostal;

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public int getCodigopostal() {
		return codigopostal;
	}

	public void setCodigopostal(int codigopostal) {
		this.codigopostal = codigopostal;
	}

	public Direcciones(String dni, String calle, String numero, int codigopostal) {
		super();
		this.dni = dni;
		this.calle = calle;
		this.numero = numero;
		this.codigopostal = codigopostal;
	}

	public Direcciones(String calle, String numero) {
		super();
		this.calle = calle;
		this.numero = numero;
	}
	
	public Direcciones(String dni) {
		super();
		this.dni = dni;
	}

	public Direcciones() {
		super();
	}

}