package br.edu.unoesc.criador;

import java.io.ByteArrayOutputStream;
import java.time.LocalDateTime;

import lombok.Getter;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfWriter;

@Getter
public class CriadorPDF {
	private Document documento;
	private String nomeDocumentoEnviado;
	private ByteArrayOutputStream byteArrayOutputStream;
	private Font fonteHeadTitulo = new Font(FontFamily.TIMES_ROMAN, 18.0f, Font.BOLD);
	private Font fonteNegrito = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.BOLD);
	private Font fonteNormal = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.NORMAL);
	private Font fonteDeNumero = FontFactory.getFont("TIMES_ROMAN", 10.0f, BaseColor.BLACK);	

	
	public CriadorPDF(String nomeDocumentoEnviado){
		this.documento = new Document();
		this.byteArrayOutputStream = new ByteArrayOutputStream();
		this.nomeDocumentoEnviado = nomeDocumentoEnviado;
		preparaDocumento();
	}
	
	
	private void preparaDocumento(){
		try {
			PdfWriter.getInstance(documento, byteArrayOutputStream);
			documento.open();
			
			//documento.add(new Paragraph("Resultado da analise"));
	        documento.addSubject("Resultado da análise do Corretor na web");
	        documento.addKeywords("www.corretornaweb.com.br");
	        documento.addCreator("Correto na web 2016");
	        documento.addAuthor("Matheus Otavio Poletto");	
	        
			criaHead();
		} catch (DocumentException e) {
			System.out.println("Erro no CriadorPDF.java preparaDocumento DOCUMENT EXCEPTION - "+ e.getMessage());
		}
	}
	
	public void criaHead(){
		try {
			Paragraph head1 = new Paragraph("Corretor na web", fonteHeadTitulo);
			head1.setAlignment(Element.ALIGN_CENTER);
			documento.add(head1);
			Paragraph head2 = new Paragraph("Arquivo:" +nomeDocumentoEnviado + " | Data: " + LocalDateTime.now(), fonteNormal);
			head2.setAlignment(Element.ALIGN_CENTER);
			documento.add(head2);
			
			documento.add(new Chunk("\n"));
			
			
		} catch (DocumentException e) {
			System.out.println("Erro no CriadorPDF.java criaHead DOCUMENT EXCEPTION - " + e.getMessage());
		}
	}

}
