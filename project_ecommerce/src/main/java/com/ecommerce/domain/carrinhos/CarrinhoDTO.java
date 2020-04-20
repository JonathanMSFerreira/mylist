package com.ecommerce.domain.carrinhos;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

import org.modelmapper.ModelMapper;

import com.ecommerce.domain.carrinhos.CarrinhoProduto;
import com.ecommerce.domain.categorias.CategoriaProduto;
import com.ecommerce.domain.cores.CorProduto;
import com.ecommerce.domain.favoritos.Favorito;
import com.ecommerce.domain.fotos.FotoProduto;
import com.ecommerce.domain.tamanhos.TamanhoProduto;


public class CarrinhoDTO {
   
	
	 private Long id;

     private List<CarrinhoProduto> produtos;
		

    public static CarrinhoDTO create(Carrinho carrinho) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(carrinho, CarrinhoDTO.class);
    }

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public List<CarrinhoProduto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<CarrinhoProduto> produtos) {
		this.produtos = produtos;
	}

	
    
}
