package es.ascender.biblioteca.repositories.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import es.ascender.biblioteca.negocio.Direcciones;
import es.ascender.biblioteca.repositories.DireccionesRepository;

public class DireccionesRepositoryJDBC implements DireccionesRepository {

	static final String DB_URL = "jdbc:mysql://localhost:3306/biblioteca";
	static final String USER = "root";
	static final String PASS = "";

	public List<Direcciones> buscarTodos() {
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet rs = null;
		List<Direcciones> lista = new ArrayList<Direcciones>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			rs = sentencia.executeQuery("select * from direcciones");
			while (rs.next()) {
				Direcciones d = new Direcciones(rs.getString("dni"), rs.getString("calle"), rs.getString("numero"),
						rs.getInt("codigopostal"));
				lista.add(d);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;

	}

	@Override
	public void insertar(Direcciones direcciones) {
		Connection conexion = null;
		Statement sentencia = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			String insertarsql = "insert into direcciones values ('" + direcciones.getDni() + "','"
					+ direcciones.getCalle() + "','" + direcciones.getNumero() + "','" + direcciones.getCodigopostal()
					+ "')";
			System.out.println(insertarsql);
			sentencia.executeUpdate(insertarsql);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void borrar(Direcciones direcciones) {
		Connection conexion = null;
		Statement sentencia = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			String borrarsql = "delete from direcciones where dni='" + direcciones.getDni() + "'";
			System.out.println(borrarsql);
			sentencia.executeUpdate(borrarsql);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<Direcciones> buscarTodosOrdenados(String orden) {
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet rs = null;
		List<Direcciones> lista = new ArrayList<Direcciones>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection(DB_URL, USER, PASS);
			sentencia = conexion.createStatement();
			rs = sentencia.executeQuery("select * from direcciones order by " + orden);
			while (rs.next()) {
				Direcciones d = new Direcciones(rs.getString("dni"), rs.getString("calle"), rs.getString("numero"),
						rs.getInt("codigopostal"));
				lista.add(d);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;

	}
}
