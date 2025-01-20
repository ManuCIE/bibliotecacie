<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Direcciones"%>

<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.DireccionesRepositoryJDBC"%>
<%@ page import="es.ascender.biblioteca.repositories.DireccionesRepository"%>
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
	List<Direcciones> lista = repo.buscarTodos();
	%>

	<table>
		<tr>
			<th>DNI</th>
			<th>CALLE</th>
			<th>NÚMERO</th>
			<th>CÓDIGO POSTAL</th>
			<th>BORRAR</th>
		</tr>

		<tr>
			<%
			for (Direcciones d : lista) {
			%>
			<td><%=d.getDni()%></td>
			<td><%=d.getCalle()%></td>
			<td><%=d.getNumero()%></td>
			<td><%=d.getCodigopostal()%></td>
			<td><a href="borrardirecciones.jsp?dni=<%=d.getDni()%>">borrar</a></td>
		</tr>
		<%
		}
		%>
	</table>

	<p>
		<a href="bibliotecainicio.html">Página principal</a>
	</p>



</body>
</html>