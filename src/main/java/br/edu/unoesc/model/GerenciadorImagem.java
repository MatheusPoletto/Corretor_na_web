package br.edu.unoesc.model;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;

import br.edu.unoesc.dao.AvatarDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import lombok.Getter;
import lombok.Setter;



@Getter
@Setter
public class GerenciadorImagem {
	  
	  public void salva(InputStream imagem, Usuario usuario) throws IOException, DAOException {
		    byte[] bytes = IOUtils.toByteArray(imagem);
		    AvatarDAO avatarDao = new AvatarDAO();
		    avatarDao.salvaBlob(usuario.getAvatares().get(0), bytes);
		    
		    UsuarioDAO usuarioDao = new UsuarioDAO();
		    usuarioDao.salvar(usuario);
		  }
	  
	

}
