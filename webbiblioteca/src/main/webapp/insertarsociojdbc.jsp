<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Socio"%>
<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.SocioRepositoryJDBC"%>
<%@ page import="es.ascender.biblioteca.repositories.SocioRepository"%>

<%
String dni = request.getParameter("dni");
String nombre = request.getParameter("nombre");
String apellidos = request.getParameter("apellidos");
Socio s = new Socio(dni, nombre, apellidos);
SocioRepository repo = new SocioRepositoryJDBC();

repo.insertar(s);

response.sendRedirect("formulariodirecciones.html");
%>