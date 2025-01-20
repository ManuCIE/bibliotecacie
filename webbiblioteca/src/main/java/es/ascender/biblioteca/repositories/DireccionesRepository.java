package es.ascender.biblioteca.repositories;

import java.util.List;

import es.ascender.biblioteca.negocio.Direcciones;

public interface DireccionesRepository {

	List<Direcciones> buscarTodos();

	void insertar(Direcciones direcciones);

	void borrar(Direcciones direcciones);

	List<Direcciones> buscarTodosOrdenados(String orden);

}