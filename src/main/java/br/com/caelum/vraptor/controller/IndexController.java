package br.com.caelum.vraptor.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.languagetool.JLanguageTool;
import org.languagetool.language.BrazilianPortuguese;
import org.languagetool.language.Portuguese;
import org.languagetool.rules.Rule;
import org.languagetool.rules.RuleMatch;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.download.ByteArrayDownload;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.download.InputStreamDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.edu.unoesc.analisa.AnalisaDOCX;
import br.edu.unoesc.criador.CriadorPDF;
import br.edu.unoesc.dao.NovidadeDAO;
import br.edu.unoesc.dao.PdfDAO;
import br.edu.unoesc.model.Novidade;
import br.edu.unoesc.model.Pdf;
import br.edu.unoesc.model.Usuario;

@ApplicationScoped
@Controller
public class IndexController {

	private final Result result;
	private String tipoMensagem = "TESTE", precisaMensagem = "NAO";
	private Boolean comMensagem = false;
	/**
	 * @deprecated CDI eyes only
	 */
	protected IndexController() {
		this(null);
	}

	@Inject
	public IndexController(Result result) {
		this.result = result;
	}

	@Path("/")
	public void index(){
		result.include("li_active", "index");
		
		try {
			NovidadeDAO novDao = new NovidadeDAO();		
			result.include("novidadeview", novDao.buscaMsgIdAsc());
		} catch (Exception e) {
			Novidade novidade = new Novidade();
			result.redirectTo(this).index();
		}
		
	}
	
	@Path("/entrar")
	public void entrar(){
		result.include("li_active", "entrar");
	}
	
	@Path("/registro")
	public void registro(){			
		result.include("li_active", "registro");		
	}
	
	@Path("/sobre")
	public void sobre(){	
		result.include("li_active", "sobre");
	}
	
	@Path("/corretor")
	public void corretor(){	
		result.include("li_active", "semActive");
	}
	
	@Path("/regras")
	public void regras(){	
		result.include("li_active", "semActive");
		JLanguageTool lgBr = new JLanguageTool(new BrazilianPortuguese());
		result.include("regraview", lgBr.getAllRules());
	}
	
	//PARA RETORNAR MSG PARA A JSP
	public void precisaMensagem(String tipo, String jsp) {
		this.tipoMensagem = tipo;
		this.comMensagem = true;
		this.precisaMensagem = "SIM";
		result.include("precisaMensagem", precisaMensagem);
		result.include("tipoMensagem", tipoMensagem);	
		switch (jsp) {
		case "index.jsp":
			result.redirectTo(this).index();
			break;
		case "entrar.jsp":
			result.redirectTo(this).entrar();
			break;
		case "registro.jsp":
			result.redirectTo(this).registro();
			break;
		case "sobre.jsp":
			result.redirectTo(this).sobre();
			break;
		default:
			result.redirectTo(this).index();
			break;
		}
		precisaMensagem = "NAO";
	}

	/*@Post("/salvarDocumento/documento")
	public InputStreamDownload salvarDocumento(UploadedFile documento){
		try{
			CriadorPDF novoPdf = new CriadorPDF(documento.getFileName());
			AnalisaDOCX analisaDocx = new AnalisaDOCX();
			analisaDocx.Analisa(documento, new JLanguageTool(new Portuguese()), novoPdf);			
			novoPdf.getDocumento().close();
			byte[] pdfBytes = novoPdf.getByteArrayOutputStream().toByteArray();
			
			
			
			ByteArrayInputStream in = new ByteArrayInputStream(pdfBytes);
			return new InputStreamDownload(in, "application/pdf", "teste.pdf");
	}catch(Exception e){
		System.out.println("Erro no IndexController.java salvarDocumento EXCEPTION - "+ e.getMessage());
		result.redirectTo(this).precisaMensagem("ERRO_ARQUIVO");
	}
		return null;
	}*/

}