package com.ecommerce.domain.categorias;



import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;



@Entity
public class Categoria {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

  
	private String titulo;
	
	
	private String urlFoto;
	
	
	@OneToMany(mappedBy = "categoria", cascade = CascadeType.ALL)
    private List<CategoriaProduto> categorias;
	
	
	
	
	


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}






	


	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


	public String getUrlFoto() {
		return urlFoto;
	}


	public void setUrlFoto(String urlFoto) {
		this.urlFoto = urlFoto;
	}


	public List<CategoriaProduto> getCategorias() {
		return categorias;
	}


	public void setCategorias(List<CategoriaProduto> categorias) {
		this.categorias = categorias;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Categoria other = (Categoria) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



	
	
	
		
	
}
