package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.codec.digest.DigestUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.edu.unoesc.dao.AvatarDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.Avatar;
import br.edu.unoesc.model.Pessoa;
import br.edu.unoesc.model.Usuario;

@Controller
public class AcessoController {

	@Inject
	private UsuarioDAO usuarioDAO;

	@Inject
	private Result result;

	@Inject
	private Validator validator;

	@Path("/index")
	public void index() {
		result.include("variable", "");
	}

	@Post("/autenticarUsuario")
	public void autenticarUsuario(Usuario usuario) {
			Usuario usuarioBusca = usuarioDAO.buscarUsuario(usuario.getLogin(), usuario.getSenha());
			if (usuarioBusca == null) {
				result.redirectTo(IndexController.class).precisaMensagem("ERRO_LOGIN_INCORRETO", "entrar.jsp");
			} else {
				if(usuarioBusca.getAdministradores().size() == 0){
					result.redirectTo(UsuarioController.class).index(usuarioBusca);
				}else {
					result.redirectTo(AdministradorController.class).index(usuarioBusca);
					
				}
			}
		}
	
	@Get("/redirecionaLogin")
	public void redirecionaLogin() {
				result.redirectTo(IndexController.class).precisaMensagem("ERRO_LOGIN_EXPIROU", "entrar.jsp");
		
	}
	
	@Post("/cadastrarUsuario")
	public void cadastrarUsuario(Usuario usuario, Pessoa pessoa) {
		Usuario usuarioBuscar = usuarioDAO.buscarLogin(usuario.getLogin());
		if (usuarioBuscar == null) {
			try {
				if(pessoa.getEndereco() == null){
					pessoa.setEndereco("");
				}
				if(pessoa.getGenero() == null){
					pessoa.setGenero("");
				}
				
				pessoa.setUsuario(usuario);
				
				Avatar avatar = new Avatar(null);
				avatar.setUsuario(usuario);
				
				PessoaDAO pessoaDao = new PessoaDAO();
				AvatarDAO avatarDao = new AvatarDAO();
				usuarioDAO.salvar(usuario);
				avatarDao.salvar(avatar);				
				pessoaDao.salvar(pessoa);
				
				result.redirectTo(IndexController.class).precisaMensagem("SUCESSO", "registro.jsp");
				System.out.println("oi1");
			} catch (DAOException e) {
				result.redirectTo(IndexController.class).precisaMensagem("ALERTA_LOGIN_EXISTE", "registro.jsp");
				System.out.println("oi2");
				e.printStackTrace();
			}
		} else {
			result.redirectTo(IndexController.class).precisaMensagem("ALERTA_LOGIN_EXISTE", "registro.jsp");
			System.out.println("oi3");
		}
	}



}
