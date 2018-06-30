package br.com.caelum.vraptor.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.apache.commons.codec.digest.DigestUtils;
import org.languagetool.JLanguageTool;
import org.languagetool.language.Portuguese;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.download.InputStreamDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.Validator;
import br.edu.unoesc.analisa.AnalisaDOCX;
import br.edu.unoesc.criador.CriadorPDF;
import br.edu.unoesc.dao.AdministradorDAO;
import br.edu.unoesc.dao.AvatarDAO;
import br.edu.unoesc.dao.MensagemDAO;
import br.edu.unoesc.dao.NovidadeDAO;
import br.edu.unoesc.dao.PdfDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.Avatar;
import br.edu.unoesc.model.GerenciadorImagem;
import br.edu.unoesc.model.Mensagem;
import br.edu.unoesc.model.Novidade;
import br.edu.unoesc.model.Pdf;
import br.edu.unoesc.model.Pessoa;
import br.edu.unoesc.model.Usuario;

@ApplicationScoped
@Controller
public class AdministradorController {

	@Inject
	private UsuarioDAO usuarioDAO;
	
	@Inject
	private AdministradorDAO admDao;

	@Inject
	private Result result;

	@Inject
	private Validator validator;

	private Usuario usuario = new Usuario();
	
	private String tipoMensagem = "TESTE", precisaMensagem = "NAO";
	
	private Integer totalArquivos = 0;
	
	private Boolean isPesquisa = false;
	
	private String nomeArquivo = "";
	
	private String base64DataString;


	public void index(Usuario usuario) {
		this.usuario = usuario;
		result.redirectTo(this).homeAdministrador();
	}

	//PARA ABRIR A PAGINA HOME DO USUARIO - EXIBE O CORRETOR DO LT
	@Path("/homeAdministrador")
	public void homeAdministrador() {
		if(usuarioAtivo()){
			MensagemDAO msgDao = new MensagemDAO();
			this.usuario = usuarioDAO.buscar(Usuario.class, this.usuario.getCodigo());//para atualizar a lista e dados do usuario
			try {
				byte[] bAvatar = Base64.getEncoder().encode(this.usuario.getAvatares().get(0).getImage());
				base64DataString = new String(bAvatar, "UTF-8");
			} catch (Exception e) {
				base64DataString = "img/def-user.png";
			}
			result.include("imagem", base64DataString);
			result.include("usuario", this.usuario);
			result.include("administrador", this.usuario.getAdministradores().get(0));		
			result.include("qtd_usuarios", this.admDao.buscaQtdUsuario());
			result.include("qtd_msg_sem_resposta", msgDao.buscaMsgIdAsc().size());
			result.include("qtd_pdf", this.admDao.buscaQtdPdf());
			
			result.include("mensagemview", msgDao.filtraMsgSemResposta());
		}
	}
	
	@Get("/HomeIndex")
	public void HomeIndex() {
		if(usuarioAtivo()){
			this.usuario = null;
			result.redirectTo(IndexController.class).index();
		}

	}
	
	@Path("/listaUsuarios")
	public void listaUsuarios() {
		if(usuarioAtivo()){
			result.include("imagem", base64DataString);
			result.include("administrador", this.usuario.getAdministradores().get(0));		
			result.include("usuariosview", admDao.buscarUsuariosSimples());
		}
	}
	
	@Get("/HomeUsuario")
	public void HomeUsuario() {
		if(usuarioAtivo()){
			result.redirectTo(UsuarioController.class).index(usuario);
		}

	}
	
	@Get("/HomeEntrar")
	public void HomeEntrar() {
		if(usuarioAtivo()){
			this.usuario = null;
			result.redirectTo(IndexController.class).entrar();
		}

	}

	
	//PARA RETORNAR MSG PARA A JSP
	private void precisaMensagem(String tipo, String jsp) {
		if(usuarioAtivo()){
			this.tipoMensagem = tipo;
			this.precisaMensagem = "SIM";
			result.include("precisaMensagem", precisaMensagem);
			result.include("tipoMensagem", tipoMensagem);
			switch (jsp) {
			default:
				result.redirectTo(this).homeAdministrador();
				break;
			}
			this.precisaMensagem = "NAO";
		}
	}
	
	@Get("/abrirMsgAdm/{codigo}")
	public void abrirMsg(Long codigo) {
		if(usuarioAtivo()){
			MensagemDAO msgDao = new MensagemDAO();
			Mensagem msg = msgDao.buscar(Mensagem.class, codigo);		
			result.redirectTo(this).msgVer(msg);
		}
	}
	
	@Path("msgVer")
	public void msgVer(Mensagem msg) {
		if(usuarioAtivo()){
			result.include("imagem", base64DataString);
			result.include("usuario", this.usuario);
			result.include("administrador", this.usuario.getAdministradores().get(0));		
			result.include("qtd_usuarios", this.admDao.buscaQtdUsuario());
			result.include("mensagem", msg);	
		}
	}
	
	@Post("/responderMsgAdm")
	public void responderMsgAdm(Mensagem mensagem) {
		if(usuarioAtivo()){
			MensagemDAO msgDao = new MensagemDAO();
			
			Mensagem m2 = msgDao.buscar(Mensagem.class, mensagem.getCodigo());		
			m2.setAdministrador(this.usuario.getAdministradores().get(0));
			m2.setDataResposta(new Date());
			m2.setResposta(mensagem.getResposta());
			try {
				
				msgDao.salvar(m2);
				result.redirectTo(this).index(usuario);
			} catch (DAOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Path("/novidadeNova")
	public void novidadeNova() {
		if(usuarioAtivo()){
			result.include("imagem", base64DataString);
			result.include("usuario", this.usuario);
			result.include("administrador", this.usuario.getAdministradores().get(0));		
			result.include("qtd_usuarios", this.admDao.buscaQtdUsuario());
		}
	}
	
	@Post("/novaNovidade")
	public void novaNovidade(Novidade novidade) {
		if(usuarioAtivo()){
			NovidadeDAO novDao = new NovidadeDAO(); 
			novidade.setAdministrador(this.usuario.getAdministradores().get(0));
			novidade.setVisibilidade("ALL");
			try {
				
				novDao.salvar(novidade);
				result.redirectTo(this).index(usuario);
			} catch (DAOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Get("/sairAdm")
	public void sairAdm() {
		this.usuario.setCodigo(null);
		result.redirectTo(IndexController.class).index();

	}

	
	private Boolean usuarioAtivo() {
		if ((usuario.getCodigo() != null) && usuario.getAdministradores().get(0) != null) {
			return true;
		} else {
			result.redirectTo(IndexController.class).precisaMensagem("ERRO_LOGIN_EXPIROU", "entrar.jsp");;
			return false;
		}
	}
	

}
