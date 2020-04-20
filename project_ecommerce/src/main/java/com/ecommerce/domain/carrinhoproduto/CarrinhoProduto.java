package com.ecommerce.domain.carrinhoproduto;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.ecommerce.domain.carrinhos.Carrinho;
import com.ecommerce.domain.produtos.Produto;



@Entity
public class CarrinhoProduto {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

  
	@ManyToOne
    private Carrinho carrinho;
	
	
	
	@ManyToOne
    private Produto produto;


	
	
	public Carrinho getCarrinho() {
		return carrinho;
	}


	public void setCarrinho(Carrinho carrinho) {
		this.carrinho = carrinho;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Produto getProduto() {
		return produto;
	}


	public void setProduto(Produto produto) {
		this.produto = produto;
	}


	public Carrinho getCor() {
		return carrinho;
	}


	public void setCor(Carrinho carrinho) {
		this.carrinho = carrinho;
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
		CarrinhoProduto other = (CarrinhoProduto) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



	
	
	
		
	
}
