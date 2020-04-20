package com.ecommerce.domain.tamanhos;



import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;



@Entity
public class Tamanho {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

  
	private String tamanho;
	
	
	
	@OneToMany(mappedBy = "tamanho", cascade = CascadeType.ALL)
    private List<TamanhoProduto> produtos;
	
	



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}



	
	
	

	public List<TamanhoProduto> getProdutos() {
		return produtos;
	}


	public void setProdutos(List<TamanhoProduto> produtos) {
		this.produtos = produtos;
	}


	public String getTamanho() {
		return tamanho;
	}


	public void setTamanho(String tamanho) {
		this.tamanho = tamanho;
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
		Tamanho other = (Tamanho) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



	
	
	
		
	
}
