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

@RequestScoped
public class NovidadeDAO extends HibernateDAO<Novidade> {

	public List<Novidade> buscaMsgIdAsc() {
		this.conectar();
		try {
			TypedQuery<Novidade> query = em.createNamedQuery("FILTRA_TODOS_NOV_ID_ASC",
					Novidade.class);
			return query.setMaxResults(3).getResultList();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}
	
       
		
}
