<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Direcciones"%>

<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.DireccionesRepositoryJDBC"%>
<%@ page
	import="es.ascender.biblioteca.repositories.DireccionesRepository"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	DireccionesRepository repo = new DireccionesRepositoryJDBC();
	List<Direcciones> lista = null;

	if (request.getParameter("orden") != null) {
		out.println("Ordenado por " + request.getParameter("orden"));
		lista = repo.buscarTodosOrdenados(request.getParameter("orden"));
	} else {

		out.println("Lista sin ordenar");
		lista = repo.buscarTodos();
	}
	%>

	<table>
		<thead>
			<tr>
				<th><a href="?orden=dni">DNI</a></th>
				<th><a href="?orden=calle">CALLE</a></th>
				<th><a href="?orden=numero">NÚMERO</a></th>
				<th><a href="?orden=codigopostal">CÓDIGO POSTAL</a></th>
			</tr>
		</thead>

		<tr>
			<%
			for (Direcciones d : lista) {
			%>
			<td><%=d.getDni()%></td>
			<td><%=d.getCalle()%></td>
			<td><%=d.getNumero()%></td>
			<td><%=d.getCodigopostal()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<a href="bibliotecainicio.html">Página principal</a>


</body>
</html>