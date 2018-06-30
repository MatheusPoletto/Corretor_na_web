package br.edu.unoesc.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Entity
@NamedQueries({
	@NamedQuery(name = Administrador.BUSCA_QTD_USUARIO, query = "select a from Usuario a"),
	/*@NamedQuery(name = Administrador.BUSCA_QTD_MSG_SEM_RESPOSTA, query = "select m from Mensagem m where m.resposta = 0 "),*/
	@NamedQuery(name = Administrador.BUSCA_QTD_PDF, query = "select p from Pdf p"),
	@NamedQuery(name = Administrador.BUSCA_USUARIOS_SIMPLES, query = "select u from Usuario u")
	})
public @Data class Administrador implements MinhaEntidade {
	
	public static final String BUSCA_QTD_USUARIO = "BUSCA_QTD_USUARIO";
	public static final String BUSCA_QTD_MSG_SEM_RESPOSTA = "BUSCA_QTD_MSG_SEM_RESPOSTA";
	public static final String BUSCA_QTD_PDF = "BUSCA_QTD_PDF";
	public static final String BUSCA_USUARIOS_SIMPLES = "BUSCA_USUARIOS_SIMPLES";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	private String nome;
	private Integer nivel;
	
	@ManyToOne
	@JoinColumn(name="usuario_codigo")
	private Usuario usuario;
	
	@OneToMany(mappedBy = "administrador", targetEntity = Mensagem.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Mensagem> mensagens = new ArrayList<>();
	
	@OneToMany(mappedBy = "administrador", targetEntity = Novidade.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Novidade> novidade = new ArrayList<>();


	public Administrador(String nome, Usuario usuario) {
		super();
		this.nome = nome;
		this.usuario = usuario;
		this.nivel = 3;
	}
	
}
