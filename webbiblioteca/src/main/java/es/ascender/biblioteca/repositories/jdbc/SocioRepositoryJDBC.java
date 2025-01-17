package es.ascender.biblioteca.repositories.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import es.ascender.biblioteca.negocio.Socio;
import es.ascender.biblioteca.repositories.SocioRepository;

public class SocioRepositoryJDBC implements SocioRepository {

	static final String DB_URL = "jdbc:mysql://localhost:3306/biblioteca";
	static final String USER = "root";
	static final String PASS = "";

	public List<Socio> buscarTodos() {
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet rs = null;
		List<Socio> lista = new ArrayList<Socio>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			rs = sentencia.executeQuery("select * from socios");
			while (rs.next()) {
				Socio s = new Socio(rs.getString("dni"), rs.getString("nombre"), rs.getString("apellidos"));
				lista.add(s);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;

	}

	@Override
	public void insertar(Socio socio) {
		Connection conexion = null;
		Statement sentencia = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			String insertarsql = "insert into socios values ('" + socio.getDni() + "','" + socio.getNombre() + "','"
					+ socio.getApellidos() + "')";
			System.out.println(insertarsql);
			sentencia.executeUpdate(insertarsql);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void borrar(Socio socio) {
		Connection conexion = null;
		Statement sentencia = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			String borrarsql = "delete from socios where dni='" + socio.getDni() + "'";
			System.out.println(borrarsql);
			sentencia.executeUpdate(borrarsql);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<Socio> buscarTodosOrdenados(String orden) {
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet rs = null;
		List<Socio> lista = new ArrayList<Socio>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			rs = sentencia.executeQuery("select * from socios order by " + orden);
			while (rs.next()) {
				Socio s = new Socio(rs.getString("dni"), rs.getString("nombre"), rs.getString("apellidos"));
				lista.add(s);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;

	}
}
