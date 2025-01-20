<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Direcciones"%>
<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.DireccionesRepositoryJDBC"%>
<%@ page import="es.ascender.biblioteca.repositories.DireccionesRepository"%>

<%
String dni = request.getParameter("dni");
String calle = request.getParameter("calle");
String numero = request.getParameter("numero");
int codigopostal = Integer.parseInt(request.getParameter("codigopostal"));
Direcciones d = new Direcciones(dni, calle, numero, codigopostal);
DireccionesRepository repo = new DireccionesRepositoryJDBC();

repo.insertar(d);

response.sendRedirect("listadireccionesjdbc.jsp");
%>