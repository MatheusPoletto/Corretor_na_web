package br.edu.unoesc.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Entity
@NamedQueries({ @NamedQuery(name = Mensagem.FILTRA_TODOS_ID_ASC, query = "select a from Mensagem a where a.resposta IS NULL order by a.codigo Desc"),
				@NamedQuery(name = Mensagem.FILTRA_POR_MSG_PESSOA, query = "select a from Mensagem a where (a.pessoa) like ?1 "),
				@NamedQuery(name = Mensagem.FILTRA_MSG_SEM_RESPOSTA, query = "select a from Mensagem a where a.resposta is null ")
		})
public @Data class Mensagem implements MinhaEntidade {
	
	public static final String FILTRA_TODOS_ID_ASC = "FILTRA_TODOS_ID_ASC";
	public static final String FILTRA_POR_MSG_PESSOA = "FILTRA_POR_MSG_PESSOA";
	public static final String FILTRA_MSG_SEM_RESPOSTA = "FILTRA_MSG_SEM_RESPOSTA";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	private String titulo;
	private String texto;
	
	@Temporal(TemporalType.TIMESTAMP) 
	private Date dataCriacao;
	
	@Temporal(TemporalType.TIMESTAMP) 
	private Date dataResposta;
	
	@ManyToOne
	@JoinColumn(name="administrador_codigo")
	private Administrador administrador;
	
	
	@ManyToOne
	@JoinColumn(name="pessoa_codigo")
	private Pessoa pessoa;
	
	private String resposta;

	public Mensagem(String titulo, Pessoa pessoa, String texto) {
		super();
		this.titulo = titulo;
		this.pessoa = pessoa;
		this.texto = texto;
		this.dataCriacao = new Date();
		this.dataResposta = null;
		this.administrador = null;
		this.resposta = null;
		
	}

}
