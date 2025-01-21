package es.ascender.biblioteca.controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ascender.biblioteca.negocio.Socio;
import es.ascender.biblioteca.repositories.SocioRepository;
import es.ascender.biblioteca.repositories.jdbc.SocioRepositoryJDBC;

@WebServlet("/SociosServlet")
public class SociosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SocioRepository repo = new SocioRepositoryJDBC();
	List<Socio> lista = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("orden") != null) {
			// out.println("Ordenado por " + request.getParameter("orden"));
			lista = repo.buscarTodosOrdenados(request.getParameter("orden"));
		} else {

			// out.println("Lista sin ordenar");
			lista = repo.buscarTodos();
		}

		request.setAttribute("lista", lista);
		RequestDispatcher dp = request.getRequestDispatcher("listasociosjdbc.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
