package br.edu.unoesc.model;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@EqualsAndHashCode(of = "codigo")
@Entity
@NamedQueries({ @NamedQuery(name = Pdf.FILTRA_POR_CODIGO_USUARIO, query = "select a from Pdf a where (a.usuario) like ?1 ")})
public @Data class Pdf implements MinhaEntidade {
	public static final String FILTRA_POR_CODIGO_USUARIO = "FILTRA_POR_CODIGO_USUARIO";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String nomeArquivo;
	private String comErro;

	@Column(name = "pdf", unique = false, nullable = false, length = 100000)
	private byte[] pdf;

	@ManyToOne(cascade = {CascadeType.MERGE})
	@JoinColumn(name = "usuario_codigo")
	private Usuario usuario;

	public Pdf(Usuario usuario, String nomeArquivo, String comErro) {
		super();
		this.usuario = usuario;
		this.nomeArquivo = nomeArquivo;
		this.comErro = comErro;
	}

}

