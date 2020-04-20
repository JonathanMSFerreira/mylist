package com.ecommerce.domain.carrinhoproduto;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.modelmapper.ModelMapper;

import com.ecommerce.domain.carrinhos.Carrinho;
import com.ecommerce.domain.carrinhos.CarrinhoProduto;
import com.ecommerce.domain.categorias.CategoriaProduto;
import com.ecommerce.domain.cores.CorProduto;
import com.ecommerce.domain.favoritos.Favorito;
import com.ecommerce.domain.fotos.FotoProduto;
import com.ecommerce.domain.produtos.Produto;
import com.ecommerce.domain.tamanhos.TamanhoProduto;


public class CarrinhoProdutoDTO {
   
	
    private Long id;

    
    private Carrinho carrinho;
	
	
    private Produto produto;
    
   

    public static CarrinhoProdutoDTO create(CarrinhoProduto carrinhoProduto) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(carrinhoProduto, CarrinhoProdutoDTO.class);
    }

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public Carrinho getCarrinho() {
		return carrinho;
	}

	public void setCarrinho(Carrinho carrinho) {
		this.carrinho = carrinho;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	
	
    
}
