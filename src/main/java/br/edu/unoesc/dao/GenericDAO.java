package br.edu.unoesc.dao;

import java.util.List;

import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.MinhaEntidade;

public interface GenericDAO<T extends MinhaEntidade> {

	void salvar(T entidade) throws DAOException;
	void excluir(T entidade) throws DAOException;
	T buscar(Class<T> classe, Long codigo);
	List<T> buscar(Class<T> classe, String descricao);
	List<T> listar(Class<T> classe);
	
}
