package br.edu.unoesc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Entity
@NamedQueries({ @NamedQuery(name = Pessoa.FILTRA_POR_NOME, query = "select a from Pessoa a where upper(a.nome) like ?1 "),
	@NamedQuery(name = Pessoa.TODOS, query = "select a from Pessoa a ")})
public @Data class Pessoa implements MinhaEntidade {

	public static final String FILTRA_POR_NOME = "FILTRA_POR_NOME";
	public static final String FILTRA_POR_DATA = "FILTRA_POR_DATA";
	public static final String TODOS = "TODOS";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	private String nome;
	private String email;
	private String genero;
	private String endereco;
	
	//@Temporal(TemporalType.DATE)
	//private Date data;
	
	@ManyToOne
	@JoinColumn(name="usuario_codigo")
	private Usuario usuario;
	
	@OneToMany(mappedBy = "pessoa", targetEntity = Mensagem.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Mensagem> mensagens = new ArrayList<>();
	
	

	public Pessoa(String nome, Usuario usuario, String email, String genero, String endereco) {
		super();
		this.nome = nome;
		this.usuario = usuario;
		this.email = email;
		this.genero = genero;
		this.endereco = endereco;
	}
	
	
}
