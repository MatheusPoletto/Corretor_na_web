package br.com.caelum.vraptor.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
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
import br.edu.unoesc.dao.AvatarDAO;
import br.edu.unoesc.dao.MensagemDAO;
import br.edu.unoesc.dao.PdfDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.Avatar;
import br.edu.unoesc.model.GerenciadorImagem;
import br.edu.unoesc.model.Mensagem;
import br.edu.unoesc.model.Pdf;
import br.edu.unoesc.model.Pessoa;
import br.edu.unoesc.model.Usuario;

@ApplicationScoped
@Controller
public class UsuarioController {

	@Inject
	private UsuarioDAO usuarioDAO;

	@Inject
	private Result result;

	@Inject
	private Validator validator;

	private Usuario usuario = new Usuario();
	
	private String tipoMensagem = "TESTE", precisaMensagem = "NAO";
	
	private Integer totalArquivos = 0;
	
	private Boolean isPesquisa = false;
	
	private String nomeArquivo = "";


	public void index(Usuario usuario) {
		this.usuario = usuario;
		result.redirectTo(this).homeUsuario();
	}

	@Path("/homeUsuario")
	public void homeUsuario() {
		if(usuarioAtivo()){
			this.usuario = usuarioDAO.buscar(Usuario.class, this.usuario.getCodigo());//para atualizar a lista e dados do usuario
			result.include("usuario", this.usuario);
			result.include("pessoa", this.usuario.getPessoas().get(0));	
			result.include("li_active", "home");
			result.include("path", "Home");
		}
	}
	
	//PARA CARREGAR TODAS AS ANALISES DO USUARIO
	@Path("/minhasAnalises")
	public void minhasAnalises() {
		this.usuario = usuarioDAO.buscar(Usuario.class, this.usuario.getCodigo());//para atualizar a lista e dados do usuario

		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		if((this.isPesquisa == false) || (this.nomeArquivo == null)){//SE N FOR PESQUISA OU SE FOR UMA PESQUISA NULA
		result.include("pdfsview", this.usuario.getPdfs());
		result.include("li_active", "minhasAnalises");
		result.include("path", "Minhas análises");
		}else {
			List<Pdf> resultado = new ArrayList<Pdf>();
			for(Pdf pdf : this.usuario.getPdfs()){
				if(pdf.getNomeArquivo().toUpperCase().contains(nomeArquivo.toUpperCase())){
					resultado.add(pdf);
				}
			}
			this.isPesquisa = false;
			result.include("pdfsview", resultado);
			result.include("li_active", "minhasAnalises");
			result.include("path", "Minhas análises / Resultado da pesquisa");
		}

	}

	//PARA ABRIR UM PDF SALVO NO SISTEMA
	@Get("/abrirPdf/{codigo}")
	public InputStreamDownload abrirPdf(Long codigo) {
		PdfDAO pdfDao = new PdfDAO();
		Pdf pdf = pdfDao.buscar(Pdf.class, codigo);
		ByteArrayInputStream in = new ByteArrayInputStream(pdf.getPdf());
		return new InputStreamDownload(in, "application/pdf", "teste.pdf");

	}
	
	//PARA SALVAR UM PDF NO SISTEMA
	@Post("/salvarDocumento/documento")
	public InputStreamDownload salvarDocumento(UploadedFile documento){
		try{
			CriadorPDF novoPdf = new CriadorPDF(documento.getFileName());
			AnalisaDOCX analisaDocx = new AnalisaDOCX();
			analisaDocx.Analisa(documento, novoPdf);			
			novoPdf.getDocumento().close();
			byte[] pdfBytes = novoPdf.getByteArrayOutputStream().toByteArray();
			
			PdfDAO pdfDAO = new PdfDAO();
			pdfDAO.salvaBlob(new Pdf(this.usuario, documento.getFileName(), analisaDocx.getComErro()), pdfBytes);
	
			ByteArrayInputStream in = new ByteArrayInputStream(pdfBytes);
			return new InputStreamDownload(in, "application/pdf", "teste.pdf");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("Erro no UsuarioController.java salvarDocumento EXCEPTION - "+ e.getMessage());
		precisaMensagem("ERRO_ARQUIVO", "novoEnvio.jsp");
	}
		return null;
	}
	
	//PARA SAIR DO SISTEMA
	@Get("/sair")
	public void sair() {
		this.usuario.setCodigo(null);
		result.redirectTo(IndexController.class).index();

	}

	//PARA RETORNAR MSG PARA A JSP
	private void precisaMensagem(String tipo, String jsp) {
		this.tipoMensagem = tipo;
		this.precisaMensagem = "SIM";
		result.include("precisaMensagem", precisaMensagem);
		result.include("tipoMensagem", tipoMensagem);
		switch (jsp) {
		case "novoEnvio.jsp":
			result.redirectTo(this).novoEnvio();
			break;
		case "perfilUsuario.jsp":
			result.redirectTo(this).perfilUsuario();
			break;

		default:
			result.redirectTo(this).homeUsuario();
			break;
		}
		this.precisaMensagem = "NAO";
	}
	
	//ENVIAR NOVO DOCX PARA ANALISE
	@Path("/novoEnvio")
	public void novoEnvio() {
		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		result.include("li_active", "novoEnvio");
		result.include("path", "Novo envio");
	}
	
	@Path("/ajuda")
	public void ajuda() {
		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		result.include("li_desative", "sim");
		result.include("li_active", "ajuda");
		result.include("path", "Ajuda");
		
	}
	
	@Path("/ajPeFrequente")
	public void ajPeFrequente() {
		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		result.include("li_desative", "sim");
		result.include("li_active", "ajuda");
		result.include("path", "Ajuda / Perguntas frequentes");
		
	}
	
	@Path("/ajPeMinhas")
	public void ajPeMinhas() {
		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		result.include("li_desative", "sim");
		result.include("li_active", "ajuda");
		result.include("path", "Ajuda / Minhas perguntas");
		
		MensagemDAO msgDao = new MensagemDAO();
		result.include("mensagemview", msgDao.filtraMsgPorPessoa(this.usuario));
		
	}
	
	@Path("/ajPeNova")
	public void ajPeNova() {
		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		result.include("li_desative", "sim");
		result.include("li_active", "ajuda");
		result.include("path", "Ajuda / Nova pergunta");
		
	}
	
	@Path("/ajPeNovaEnviada")
	public void ajPeNovaEnviada() {
		result.include("usuario", this.usuario);
		result.include("pessoa", this.usuario.getPessoas().get(0));
		result.include("li_desative", "sim");
		result.include("li_active", "ajuda");
		result.include("path", "Ajuda / Nova pergunta / Mensagem enviada");
		result.include("mensagem_ao_usuario", "Sucesso, sua mensagem foi enviada e está na fila de espera.");
		
	}
	
	//CARREGAR O PERFIL DO USUARIO
	@Path("/perfilUsuario")
	public void perfilUsuario(){
		if(usuarioAtivo()){
			calcularTotalArquivos();
			String base64DataString;
			try {
				byte[] bAvatar = Base64.getEncoder().encode(this.usuario.getAvatares().get(0).getImage());
				base64DataString = new String(bAvatar, "UTF-8");
			} catch (Exception e) {
				base64DataString = "img/def-user.png";
			}
			result.include("imagem", base64DataString);
			result.include("usuario", this.usuario);
			result.include("pessoa", this.usuario.getPessoas().get(0));		
			result.include("totalArquivos", this.totalArquivos);
			result.include("li_active", "perfilUsuario");
			result.include("path", "Perfil");
		}
	}
	
	//CARREGAR AS INFORMACOES BASICAS PARA ALTERACOES
	@Path("/editarPerfil")
	public void editarPerfil(){
		if(usuarioAtivo()){
			result.include("usuario", this.usuario);
			result.include("pessoa", this.usuario.getPessoas().get(0));		
			result.include("li_active", "perfilUsuario");
			result.include("path", "Perfil / Editar Perfil");
		}
	}
	
	//ALTERAR AS INFORMACOES BASICAS ATRAVES DO EDITAR PERFIL 
	@Post("/alterarBasico")
	public void alterarBasico(Pessoa pessoa) {
		if(usuarioAtivo()){			
			this.usuario.getPessoas().get(0).setNome(pessoa.getNome());
			this.usuario.getPessoas().get(0).setGenero(pessoa.getGenero());
			this.usuario.getPessoas().get(0).setEndereco(pessoa.getEndereco());
			this.usuario.getPessoas().get(0).setEmail(pessoa.getEmail());
			
			try {
				usuarioDAO.salvar(this.usuario);
			} catch (DAOException e) {
				e.printStackTrace();
				precisaMensagem("ERRO_SALVAR_BD", "perfilUsuario.jsp");;
			}
			
			precisaMensagem("SUCESSO_ALTERAR_BASICO", "perfilUsuario.jsp");
		}
	}
	
	//ALTERAR A SENHA ATRAVES DO EDITAR PERFIL 
	@Post("/alterarConta")
	public void alterarConta(Usuario usuario, String senhaAtual, String novaSenha, String repetirNovaSenha) {
		if(usuarioAtivo()){
			if(novaSenha.equals(repetirNovaSenha)){
				//SE AS SENHAS SAO IGUAIS (EM MD5) VE SE A SENHA ATUAL ESTA CORRETA
				if((this.usuario.getLogin().equals(usuario.getLogin())) && (this.usuario.getSenha().equals(DigestUtils.md5Hex(senhaAtual)))){
					//SE O USUARIO E SENHA DO USUARIO DA SESSAO ESTIVEREM IGUAIS
					this.usuario.setSenha(novaSenha);					
					try {
						usuarioDAO.salvar(this.usuario);
					} catch (DAOException e) {
						e.printStackTrace();
						precisaMensagem("ERRO_SALVAR_BD", "perfilUsuario.jsp");
					}
					//VAI SALVAR E REDIRECIONAR PARA O PERFIL DO USUARIO
					precisaMensagem("SUCESSO_ALTERAR_SENHA", "perfilUsuario.jsp");
				}else {
					//SE NAO VAI REDIRECIONAR PARA O PERFIL DO USUARIO COM UMA MSG DE CAMPO INCORRETO
					precisaMensagem("ERRO_SENHA_INCORRETA", "perfilUsuario.jsp");
					//result.redirectTo(this).perfilUsuario();
				}
			}else{
				//SE AS SENHAS NOVAS NAO SAO IGUAIS NEM PASSA PELO BANCO E RETORNA UMA MSG QUE ELAS NAO SAO IGUAIS
				precisaMensagem("ERRO_SENHAS_NOVAS_DIFERENTES", "perfilUsuario.jsp");
			}
		}
	}
	
	//ALTERAR A FOTO ATRAVES DO EDITAR PERFIL 
	@Post("/alterarFoto/imagem")
	public void alterarFoto(UploadedFile imagem) throws UnsupportedEncodingException {
		if(usuarioAtivo()){
			try {
				GerenciadorImagem imagens = new GerenciadorImagem();
				imagens.salva(imagem.getFile(), this.usuario);

			} catch (IOException e) {
				e.printStackTrace();
				precisaMensagem("ERRO_SALVAR_BD", "perfilUsuario.jsp");
			} catch (DAOException e) {
				e.printStackTrace();
				precisaMensagem("ERRO_SALVAR_BD", "perfilUsuario.jsp");
			}
			precisaMensagem("SUCESSO_ALTERAR_FOTO", "perfilUsuario.jsp");
		}
	}
	
	@Post("/procurarDocumento")
	public void procurarDocumento(String nomeArquivo){
		if(usuarioAtivo()){
			this.nomeArquivo = nomeArquivo;
			this.isPesquisa = true;
			result.redirectTo(this).minhasAnalises();
		}
	}
	
	//CALCULAR O TOTAL DE ANALISES QUE O USUARIO JA ENVIOU
	private void calcularTotalArquivos(){
		PdfDAO pdfDao = new PdfDAO();
		List<Pdf> pdfs = pdfDao.filtraPorCodigoUsuario(this.usuario);
		this.totalArquivos = pdfs.size();
	}
	
	@Post("/enviarMensagem")
	public void enviarMensagem(Mensagem mensagem) {
		if(usuarioAtivo()){
			mensagem.setPessoa(this.usuario.getPessoas().get(0));
			System.out.println(mensagem.getTexto());
			MensagemDAO msgDao = new MensagemDAO();
			try {
				msgDao.salvar(mensagem);
				result.redirectTo(this).ajPeNovaEnviada();
			} catch (DAOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Get("/abrirMsg/{codigo}")
	public void abrirMsg(Long codigo) {
		if(usuarioAtivo()){
			MensagemDAO msgDao = new MensagemDAO();
			Mensagem msg = msgDao.buscar(Mensagem.class, codigo);		
			result.redirectTo(this).ajPeMinhaVer(msg);
		}
	}
	
	@Path("ajPeMinhaVer")
	public void ajPeMinhaVer(Mensagem msg) {
		if(usuarioAtivo()){
			result.include("usuario", this.usuario);
			result.include("pessoa", this.usuario.getPessoas().get(0));
			result.include("li_desative", "sim");
			result.include("li_active", "ajuda");
			result.include("path", "Ajuda / Minhas perguntas / Ver");
			result.include("mensagem", msg);		
		}
	}
	
	private Boolean usuarioAtivo() {
		if ((usuario.getCodigo() != null) && usuario.getPessoas().get(0) != null) {
			return true;
		} else {
			result.redirectTo(IndexController.class).precisaMensagem("ERRO_LOGIN_EXPIROU", "entrar.jsp");;
			return false;
		}
	}

}
