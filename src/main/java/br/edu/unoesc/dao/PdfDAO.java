package br.edu.unoesc.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.Pdf;
import br.edu.unoesc.model.Usuario;

@RequestScoped
public class PdfDAO extends HibernateDAO<Pdf> {
	
	public void salvaBlob(Pdf pdf, byte[] array) {
		byte[] bFile = array;
		
		 pdf.setPdf(bFile);
	        
	        try {
				salvar(pdf);
			} catch (DAOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		
		
	}
	
	public List<Pdf> filtraPorCodigoUsuario(Usuario usuario){
		this.conectar();
		try {
			
			TypedQuery<Pdf> query = em.createNamedQuery("FILTRA_POR_CODIGO_USUARIO", Pdf.class);
			query.setParameter(1, usuario);
			return query.getResultList();
		} catch (NoResultException e) {
			return null;
		} finally {
			this.finalizar();
		}
	}

}
