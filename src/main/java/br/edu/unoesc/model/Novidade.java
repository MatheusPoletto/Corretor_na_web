package br.edu.unoesc.model;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
@NamedQueries({ @NamedQuery(name = Novidade.FILTRA_TODOS_NOV_ID_ASC, query = "select a from Novidade a order by a.codigo Desc")
})
@Entity
public @Data class Novidade implements MinhaEntidade{
	
	public static final String FILTRA_TODOS_NOV_ID_ASC = "FILTRA_TODOS_NOV_ID_ASC";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;

	@ManyToOne
	@JoinColumn(name="administrador_codigo")
	private Administrador administrador;
	
	@Column
	private String visibilidade;
	
	@Column
	private String titulo;
	
	@Column
	private String conteudo;
	

	public Novidade(Administrador administrador, String visibilidade, String titulo, String conteudo) {
		super();
		this.administrador = administrador;
		this.visibilidade = visibilidade;
		this.titulo = titulo;
		this.conteudo = conteudo;
		
		
	}
	

}
