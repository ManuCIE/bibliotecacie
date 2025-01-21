<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Socio"%>

<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.SocioRepositoryJDBC"%>
<%@ page import="es.ascender.biblioteca.repositories.SocioRepository"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrar socios</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


	<%
	SocioRepository repo = new SocioRepositoryJDBC();
	List<Socio> lista = null;

	if (request.getParameter("orden") != null) {
		out.println("Ordenado por " + request.getParameter("orden"));
		lista = repo.buscarTodosOrdenados(request.getParameter("orden"));
	} else {

		out.println("Lista sin ordenar");
		lista = repo.buscarTodos();
	}
	%>

<div class="container">
	<table class="table table-striped table-hover">
		<thead>
		<tr class="table-info">
			<th><a href="?orden=dni">DNI</a></th>
			<th><a href="?orden=nombre">NOMBRE</a></th>
			<th><a href="?orden=apellidos">APELLIDOS</a></th>
			<th>BORRAR</th>
		</tr>

		<tr>
			<%
			for (Socio s : lista) {
			%>
			<td><%=s.getDni()%></td>
			<td><%=s.getNombre()%></td>
			<td><%=s.getApellidos()%></td>
			<td><a class = "btn btn-danger href="borrarsociojdbc.jsp?dni=<%=s.getDni()%>">borrar</a></td>
		</tr>
		<%
		}
		%>
	</table>

	<p>
		<a class = "btn btn-info" href="bibliotecainicio.html">Página principal</a>
	</p>



</body>
</html>