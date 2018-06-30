package br.edu.unoesc.analisa;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import lombok.Getter;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.languagetool.JLanguageTool;
import org.languagetool.language.BrazilianPortuguese;
import org.languagetool.language.Portuguese;
import org.languagetool.rules.Rule;
import org.languagetool.rules.RuleMatch;

import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.edu.unoesc.criador.CriadorPDF;
import br.edu.unoesc.model.Erro;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.draw.LineSeparator;

@Getter
public class AnalisaDOCX {
	//VARIAVEL SALVA NO PDF - INDICA SE TAL PDF POSSUI ERROS OU NAO PARA QUE NA HORA DE EXIBIR NA JSP O PDF SEJA MARCADO COMO OK OU ERRO
	private String comErro = "n";
	private ArrayList<String> regrasDesativadas;

	public void Analisa(UploadedFile documento, CriadorPDF pdf) throws IOException, DocumentException {
		carregaRegrasDesativadas();
		XWPFDocument doc = new XWPFDocument(documento.getFile());
		List<XWPFParagraph> paragrafos = doc.getParagraphs();
		doc.close(); //FECHA O DOCUMENTO
		Boolean encontrouErro = false; // SE NAO TIVER ENCONTRADO NO FINAL VAI EXIBIR UMA MENSAGEM DE DOCUMENTO OK

		//PASSA TODOS OS PARAGRAFOS DO DOCUMENTO ENVIADO
		for (XWPFParagraph paragrafo : paragrafos) {
			JLanguageTool language = new JLanguageTool(new BrazilianPortuguese());
			language.disableRules(regrasDesativadas);
			List<RuleMatch> regrasPt = language.check(paragrafo.getText());
		
			ArrayList<Erro> erros = new ArrayList<Erro>();			
			regrasPt.forEach(regra->erros.add(new Erro(erros.size()+1, paragrafo.getText().substring(regra.getFromPos(), regra.getToPos()), regra.getMessage(), regra.getFromPos(), regra.getToPos())));
			
			if(!regrasPt.isEmpty()){
				encontrouErro = true;
				this.comErro="s";
				Integer controleNext = 0; // PARA SABER SE TEM UM PROXIMO ERRO NA LISTA

				//LINHA DIVISORIA PARA CADA PARAGRAFO MOSTRADO
				LineSeparator ls = new LineSeparator();
				pdf.getDocumento().add(new Chunk(ls));
				
				//MOSTRA DO INICIO DO PARAGRAFO ATE O PRIMEIRO ERRO DA LISTA ERROS								
				Paragraph corpoParagrafo = new Paragraph();
				corpoParagrafo.add(new Chunk("Parágrafo: "+ paragrafo.getText().substring(0, erros.get(0).getInicioErro()), pdf.getFonteNormal()));
				corpoParagrafo.setAlignment(Element.ALIGN_JUSTIFIED);
				
				for (Iterator<Erro> it = erros.iterator(); it.hasNext();) {
					Erro erroAtual = it.next();
				    
					//MOSTRA O ERRO ATUAL DE SUA POSICAO INICIAL ATE FINAL COM FUNDO AMARELO ( MARCACAO )
					Chunk chunkErro = new Chunk(paragrafo.getText().substring(erroAtual.getInicioErro(), erroAtual.getFinalErro()), pdf.getFonteNormal());
					chunkErro.setBackground(BaseColor.YELLOW);
					corpoParagrafo.add(chunkErro);	

					//SE TIVER UM PROXIMO ERRO VAI MOSTRAR DO ERRO ATUAL ATE O INICIO DO PROXIMO ERRO E VOLTA AO ITERATOR 
				    if(it.hasNext()){
				    	controleNext+=1;
				    	
				    	try {
				    		Chunk chunkContinuaAteProximo = new Chunk(paragrafo.getText().substring(erroAtual.getFinalErro(), erros.get(controleNext).getInicioErro()), pdf.getFonteNormal());
							corpoParagrafo.add(chunkContinuaAteProximo);
						} catch (Exception e) {
							e.printStackTrace();
						}
				    	
				    }else{ // SE NAO MOSTRA O FINAL DO ERRO ATUAL ATE A ULTIMA COLUNA DO PARAGRAFO
				    	Chunk chunkContinuaAteProximo = new Chunk(paragrafo.getText().substring(erroAtual.getFinalErro(), paragrafo.getText().length()), pdf.getFonteNormal());
						corpoParagrafo.add(chunkContinuaAteProximo);
				    }		  
				}
				pdf.getDocumento().add(corpoParagrafo);
				//PARA DIVIDIR UMA PARAGRAFO DO OUTRO COM ESPACO EM BRANCO
				pdf.getDocumento().add(new Paragraph(new Chunk("  ", pdf.getFonteNormal())));
				
				//SE FOR UM ERRO MOSTRA A FRASE NO SINGULAR SE NAO MOSTRA NO PLURAL
				String descErro = "";
				if(erros.size() == 1){
					descErro = "Foi detectado 1 possível erro nesse parágrafo. ";
				}else if(erros.size() > 1){
					descErro = "Foram detectados "+erros.size()+" possíveis erro nesse parágrafo. ";
				}
				
				//MOSTRA A QUANTIDADE DE ERROS DETECTADOS NO PARAGRAFO ATUAL
				Paragraph parafragoRes = new Paragraph();
				parafragoRes.add(new Chunk(descErro, pdf.getFonteNegrito()));
				parafragoRes.setAlignment(Element.ALIGN_JUSTIFIED);
				pdf.getDocumento().add(parafragoRes);
	
				//MOSTRA TODOS OS ERROS DO PARAGRAFO DA LISTA ATUAL
				for (Erro erro : erros) {
					Paragraph parafragoToken = new Paragraph();
					parafragoToken.add(new Chunk("Marcação " + erro.getCodigo() +": " + erro.getFrase() +" > "+erro.getSugestao(), pdf.getFonteNormal()));
					parafragoToken.setIndentationLeft(5.0f);
					parafragoToken.setAlignment(Element.ALIGN_JUSTIFIED);
					pdf.getDocumento().add(parafragoToken);
					
		
				}
			}//PASOU EM TODAS AS REGRAS VIOLADAS DO LANGUAGE TOOL
		}//PASSOU EM TODOS OS PARAGRAFOS DO DOCUMENTO

		//SE NAO ENCONTROU ERRO NENHUM NO DOCUMENTO MOSTRA A MENSAGEM DE OK
		if (!encontrouErro) {
			LineSeparator ls = new LineSeparator();
			pdf.getDocumento().add(new Chunk(ls));

			Paragraph parafragoCorpo = new Paragraph();
			parafragoCorpo.add(new Chunk("Não foi encontrado nenhum erro no arquivo.", pdf.getFonteNormal()));
			parafragoCorpo.setAlignment(Element.ALIGN_CENTER);
			pdf.getDocumento().add(parafragoCorpo);
		}
	}//FIM ANALISA

	private void carregaRegrasDesativadas() {
		regrasDesativadas = new ArrayList<String>();
		regrasDesativadas.add("EQUIPE"); // pt-EU regra --> substitui "equipe" por "equipa"
		regrasDesativadas.add("EQUIPES"); // pt-EU regra --> substitui "equipes" por "equipas"
		regrasDesativadas.add("O_DE_DO_CONTROLE"); // pt-EU regra --> substitui "controle" por "controlo"
		regrasDesativadas.add("SOB_CONTROLE"); // pt-EU regra --> substitui "sob controle" por "sob controlo"
		regrasDesativadas.add("A_GUARDA-NOCTURNO"); // pt-EU regra --> substitui "a guarda-nocturno" por "a guarda-nocturna"
		
	}

}
