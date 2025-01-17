
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Socio"%>
<%@ page
	import="es.ascender.biblioteca.repositories.memoria.SocioRepositoryMemoria"%>
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
	SocioRepository repo = new SocioRepositoryMemoria();
	List<Socio> lista = repo.buscarTodos();
	%>

	<table>
		<tr>
			<th>DNI</th>
			<th>Nombre</th>
			<th>Apellidos</th>
		</tr>

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


</body>
</html>