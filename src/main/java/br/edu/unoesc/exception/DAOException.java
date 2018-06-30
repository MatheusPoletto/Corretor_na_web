package br.edu.unoesc.exception;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DAOException extends Exception {

	private static final long serialVersionUID = 5093346828738795858L;

	private String mensagem;
	private String mensagemTratada;

	public DAOException(String mensagem) {
		super();
		this.mensagem = mensagem;
	}
	
	public DAOException(String mensagem, Throwable t) {
		super(mensagem, t);
		this.mensagem = mensagem;
		this.mensagemTratada = trataMensagem(t.getLocalizedMessage());
	}
	
	private String trataMensagem(String mensagem) {
		if (mensagem.contains("not-null property references a null or transient value")) {
			if (mensagem.contains("br.edu.unoesc.modelo.Aluno.data")) {
				return "campo data do aluno obrigatório";	
			}
		}
		return null;
	}
	
}
