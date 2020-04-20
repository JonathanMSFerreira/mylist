package com.ecommerce.domain.produtos;


import java.util.List;

import org.modelmapper.ModelMapper;

import com.ecommerce.domain.carrinhos.CarrinhoProduto;
import com.ecommerce.domain.categorias.CategoriaProduto;
import com.ecommerce.domain.cores.CorProduto;
import com.ecommerce.domain.favoritos.Favorito;
import com.ecommerce.domain.fotos.FotoProduto;
import com.ecommerce.domain.tamanhos.TamanhoProduto;


public class ProdutoDTO {
   
	
	 private Long id;

	    private String titulo;
	  
	    private String descricao;
	    
	    private String urlFoto;
	    
	    private Double menorPreco;
	    
	    private Boolean emPromocao;
	    
	    private Double maiorPreco;
	    
	  
	    private List<FotoProduto> fotos;
		
	   
	    private List<CorProduto> cores;
	    
	  
	    private List<TamanhoProduto> tamanhos;

	    
	 
	    private List<Favorito> favoritos;
	    
	    
	    private List<CarrinhoProduto> carrinhos;
	    
	    
	    private List<CategoriaProduto> categorias;
		


    public static ProdutoDTO create(Produto produto) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(produto, ProdutoDTO.class);
    }

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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getUrlFoto() {
		return urlFoto;
	}

	public void setUrlFoto(String urlFoto) {
		this.urlFoto = urlFoto;
	}

	public Double getMenorPreco() {
		return menorPreco;
	}

	public void setMenorPreco(Double menorPreco) {
		this.menorPreco = menorPreco;
	}

	public Boolean getEmPromocao() {
		return emPromocao;
	}

	public void setEmPromocao(Boolean emPromocao) {
		this.emPromocao = emPromocao;
	}

	public Double getMaiorPreco() {
		return maiorPreco;
	}

	public void setMaiorPreco(Double maiorPreco) {
		this.maiorPreco = maiorPreco;
	}

	public List<FotoProduto> getFotos() {
		return fotos;
	}

	public void setFotos(List<FotoProduto> fotos) {
		this.fotos = fotos;
	}

	public List<CorProduto> getCores() {
		return cores;
	}

	public void setCores(List<CorProduto> cores) {
		this.cores = cores;
	}

	public List<TamanhoProduto> getTamanhos() {
		return tamanhos;
	}

	public void setTamanhos(List<TamanhoProduto> tamanhos) {
		this.tamanhos = tamanhos;
	}

	public List<Favorito> getFavoritos() {
		return favoritos;
	}

	public void setFavoritos(List<Favorito> favoritos) {
		this.favoritos = favoritos;
	}

	public List<CarrinhoProduto> getCarrinhos() {
		return carrinhos;
	}

	public void setCarrinhos(List<CarrinhoProduto> carrinhos) {
		this.carrinhos = carrinhos;
	}

	public List<CategoriaProduto> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<CategoriaProduto> categorias) {
		this.categorias = categorias;
	}


	
    
    
    
}
