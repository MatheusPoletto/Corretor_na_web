package br.edu.unoesc.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

@NoArgsConstructor
@EqualsAndHashCode(of = "codigo")
@Entity
public @Data class Avatar implements MinhaEntidade{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	//@Lob @Basic(fetch= FetchType.EAGER)
	@Column(name = "image", unique = false, nullable = false, length = 100000)
	private byte[] image;

	@ManyToOne
	@JoinColumn(name="usuario_codigo")
	private Usuario usuario;

	public Avatar(byte[] image) {
		super();
		if(image == null){
			Path path = Paths.get("img/def-user.png");
			byte[] data;
			try {
				this.image = data = Files.readAllBytes(path);
			} catch (IOException e) {
				data = new byte[20];
				this.image = data;
			}
		}else{
			this.image = image;
		}
		
	}
	
}
