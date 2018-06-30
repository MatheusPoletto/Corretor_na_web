package br.edu.unoesc.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import br.edu.unoesc.model.Administrador;
import br.edu.unoesc.model.Mensagem;
import br.edu.unoesc.model.Pdf;
import br.edu.unoesc.model.Usuario;

@RequestScoped
public class AdministradorDAO extends HibernateDAO<Administrador> {
	
	public Integer buscaQtdUsuario() {
		this.conectar();
		try {
			TypedQuery<Usuario> query = em.createNamedQuery("BUSCA_QTD_USUARIO", Usuario.class);
			return query.getResultList().size();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
	
	public Integer buscaQtdMsgSemResposta() {
		this.conectar();
		try {
			TypedQuery<Mensagem> query = em.createNamedQuery("BUSCA_QTD_MSG_SEM_RESPOSTA", Mensagem.class);
			return query.getResultList().size();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
	
	public Integer buscaQtdPdf() {
		this.conectar();
		try {
			TypedQuery<Pdf> query = em.createNamedQuery("BUSCA_QTD_PDF", Pdf.class);
			return query.getResultList().size();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
	
	public List<Usuario> buscarUsuariosSimples(){
		this.conectar();
		try {
			TypedQuery<Usuario> query = em.createNamedQuery("BUSCA_USUARIOS_SIMPLES", Usuario.class);
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}

}
