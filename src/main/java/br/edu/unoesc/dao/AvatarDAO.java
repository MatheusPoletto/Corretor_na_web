package br.edu.unoesc.dao;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import javax.enterprise.context.RequestScoped;

import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.Avatar;

@RequestScoped
public class AvatarDAO extends HibernateDAO<Avatar> {

	public void salvaBlob(Avatar avatar, byte[] array) {
		//File file = new File(arquivo);// "C:\\teste\\a.jpg"
		//byte[] bFile = new byte[(int) file.length()];
		byte[] bFile = array;
		
		 avatar.setImage(bFile);
	        
	        try {
				salvar(avatar);
			} catch (DAOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		
		
	}

	
	public FileOutputStream pegaBlob(Avatar avatar) {
		Avatar avatar2 = buscar(Avatar.class, avatar.getCodigo());
        byte[] bAvatar = avatar2.getImage();	
        
        try{
        	System.out.println("entrou");
        	 //  FileOutputStream fos = new FileOutputStream("avatar.jpg"); 
        	  /* File file = new File("avatar.jpg");
        	   file.delete();
        	*/
           // FileOutputStream fos = new FileOutputStream("C:\\test.jpg"); 
        	 File file = new File("../imgUsuario");
             if (!file.exists()) {
                 if (file.mkdir()) {
                     System.out.println("Diretório imgUsuario foi criado!");
                 } else {
                     System.out.println("Diretório imgUsuario já existe!");
                 }
             }
            FileOutputStream fos = new FileOutputStream("../imgUsuario/avatar.jpg"); 
            fos.write(bAvatar);
        	fos.close();
        	return fos;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

       
		
	}

}
