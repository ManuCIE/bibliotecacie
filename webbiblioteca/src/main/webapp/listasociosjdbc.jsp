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
<title>Insert title here</title>
</head>
<body>

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

	<table>
		<thead>
			<tr>
				<th><a href="?orden=dni">DNI</a></th>
				<th><a href="?orden=nombre">NOMBRE</a></th>
				<th><a href="?orden=apellidos">APELLIDOS</a></th>

			</tr>
		</thead>

		<tr>
			<%
			for (Socio s : lista) {
			%>
			<td><%=s.getDni()%></td>
			<td><%=s.getNombre()%></td>
			<td><%=s.getApellidos()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<a href="formulariosocio.html">Insertar socios</a>
	<a href="bibliotecainicio.html">Página principal</a>
	<a href="listasociosborrar.jsp">Borrar socios</a>

</body>
</html>