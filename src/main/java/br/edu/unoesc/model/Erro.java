package br.edu.unoesc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class Erro {
	private Integer codigo;
	private String frase;
	private String sugestao;
	private Integer inicioErro;
	private Integer finalErro;

	public Erro(Integer codigo, String frase, String sugestao, Integer inicioErro, Integer finalErro) {
		super();
		this.codigo = codigo;
		this.frase = frase;
		this.inicioErro = inicioErro;
		this.finalErro = finalErro;
		
		sugestao = sugestao.replaceAll("<suggestion>", "");
		sugestao = sugestao.replaceAll("</suggestion>", "");
		if(!sugestao.endsWith(".")){
			sugestao += ".";
		}
		this.sugestao = sugestao;
	}
	
	
	
	
		
}
