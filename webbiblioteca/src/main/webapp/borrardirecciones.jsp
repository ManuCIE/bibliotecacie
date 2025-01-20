
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Direcciones"%>
<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.DireccionesRepositoryJDBC"%>
<%@ page
	import="es.ascender.biblioteca.repositories.DireccionesRepository"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	String dni = request.getParameter("dni");
	Direcciones d = new Direcciones(dni);
	DireccionesRepository repo = new DireccionesRepositoryJDBC();

	repo.borrar(d);
	response.sendRedirect("listadireccionesjdbc.jsp");
	%>

</body>
</html>