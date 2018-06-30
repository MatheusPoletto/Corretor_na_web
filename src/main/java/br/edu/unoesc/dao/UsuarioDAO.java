package br.edu.unoesc.dao;

import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import br.edu.unoesc.model.Usuario;

@RequestScoped
public class UsuarioDAO extends HibernateDAO<Usuario> {

	public Usuario buscarUsuario(String login, String senha) {
		this.conectar();
		try {
			TypedQuery<Usuario> query = em.createNamedQuery("FILTRA_POR_LOGIN_E_SENHA",
					Usuario.class);
			query.setParameter("login", login);
			query.setParameter("senha", senha);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
	
	public Usuario buscarLogin(String login) {
		this.conectar();
		try {
			TypedQuery<Usuario> query = em.createNamedQuery("FILTRA_POR_LOGIN",
					Usuario.class);
			query.setParameter("login", login);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
}
