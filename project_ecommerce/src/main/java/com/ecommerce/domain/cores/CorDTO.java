package com.ecommerce.domain.cores;


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


public class CorDTO {
   
	
	private Long id;	
	
	private String cor;
	

    private List<CorProduto> produtos;
	
		

    public static CorDTO create(Cor cor) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(cor, CorDTO.class);
    }

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public List<CorProduto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<CorProduto> produtos) {
		this.produtos = produtos;
	}

	
	
	
    
}
