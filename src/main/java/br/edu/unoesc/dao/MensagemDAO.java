package br.edu.unoesc.dao;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.Avatar;
import br.edu.unoesc.model.Mensagem;
import br.edu.unoesc.model.Novidade;
import br.edu.unoesc.model.Pdf;
import br.edu.unoesc.model.Usuario;

@RequestScoped
public class MensagemDAO extends HibernateDAO<Mensagem> {

	public List<Mensagem> buscaMsgIdAsc() {
		this.conectar();
		try {
			TypedQuery<Mensagem> query = em.createNamedQuery("FILTRA_TODOS_ID_ASC",
					Mensagem.class);
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
		
	public List<Mensagem> filtraMsgPorPessoa(Usuario usuario){
		this.conectar();
		try {
			
			TypedQuery<Mensagem> query = em.createNamedQuery("FILTRA_POR_MSG_PESSOA", Mensagem.class);
			query.setParameter(1, usuario.getPessoas().get(0));
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}

	public List<Mensagem> filtraMsgSemResposta(){
		this.conectar();
		try {
			
			TypedQuery<Mensagem> query = em.createNamedQuery("FILTRA_MSG_SEM_RESPOSTA", Mensagem.class);
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
}
