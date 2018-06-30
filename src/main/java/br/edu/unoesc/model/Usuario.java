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
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString(of = { "codigo", "login", "senha" })
@EqualsAndHashCode(of = { "codigo" })
@Entity
@NamedQueries({
	@NamedQuery(name = Usuario.FILTRA_POR_LOGIN_E_SENHA, query = "select a from Usuario a where a.login = :login and a.senha = :senha "),
	@NamedQuery(name = Usuario.FILTRA_POR_LOGIN, query = "select a from Usuario a where a.login = :login "),
	@NamedQuery(name = "Usuario", query = "select a from Usuario a ") })
public @Data class Usuario implements MinhaEntidade {
	public static final String FILTRA_POR_LOGIN_E_SENHA = "FILTRA_POR_LOGIN_E_SENHA";
	public static final String FILTRA_POR_LOGIN = "FILTRA_POR_LOGIN";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column
	private String login;
	
	@Column
	private String senha;

	@OneToMany(mappedBy = "usuario", targetEntity = Pessoa.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Pessoa> pessoas = new ArrayList<>();
	
	@OneToMany(mappedBy = "usuario", targetEntity = Administrador.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Administrador> administradores = new ArrayList<>();

	@OneToMany(mappedBy = "usuario", targetEntity = Pdf.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Pdf> Pdfs = new ArrayList<>();
	
	@OneToMany(mappedBy = "usuario", targetEntity = Avatar.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Avatar> avatares = new ArrayList<>();
	
	
	public void setSenha(String senhaParaCriptografar){
		this.senha = DigestUtils.md5Hex(senhaParaCriptografar);
	}


	public Usuario(String login, String senha) {
		super();
		this.login = login;
		this.senha = DigestUtils.md5Hex(senha);
	}
	
	
}
