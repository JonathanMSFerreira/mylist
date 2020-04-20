package com.ecommerce.domain.produtos;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.ecommerce.domain.carrinhos.CarrinhoProduto;
import com.ecommerce.domain.categorias.CategoriaProduto;
import com.ecommerce.domain.cores.CorProduto;
import com.ecommerce.domain.favoritos.Favorito;
import com.ecommerce.domain.fotos.FotoProduto;
import com.ecommerce.domain.tamanhos.TamanhoProduto;

@NoArgsConstructor

@Entity
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titulo;
  
    private String descricao;
    
    private String urlFoto;
    
    private Double menorPreco;
    
    private Boolean emPromocao;
    
    private Double maiorPreco;
    
    
    
    
    @OneToMany(mappedBy = "produto", cascade = CascadeType.ALL)
    private List<FotoProduto> fotos;
	
   
    @OneToMany(mappedBy = "produto", cascade = CascadeType.ALL)
    private List<CorProduto> cores;
    
  
    @OneToMany(mappedBy = "produto", cascade = CascadeType.ALL)
    private List<TamanhoProduto> tamanhos;

    
    @OneToMany(mappedBy = "produto", cascade = CascadeType.ALL)
    private List<Favorito> favoritos;
    
    
	@OneToMany(mappedBy = "produto", cascade = CascadeType.ALL)
    private List<CarrinhoProduto> carrinhos;
    
    
	
	@OneToMany(mappedBy = "produto", cascade = CascadeType.ALL)
    private List<CategoriaProduto> categorias;
	
	
	
	
	
		
	public List<CategoriaProduto> getCategorias() {
		return categorias;
	}
	public void setCategorias(List<CategoriaProduto> categorias) {
		this.categorias = categorias;
	}
	public List<CarrinhoProduto> getCarrinhos() {
		return carrinhos;
	}
	public void setCarrinhos(List<CarrinhoProduto> carrinhos) {
		this.carrinhos = carrinhos;
	}
	public List<Favorito> getFavoritos() {
		return favoritos;
	}
	public void setFavoritos(List<Favorito> favoritos) {
		this.favoritos = favoritos;
	}
	public List<TamanhoProduto> getTamanhos() {
		return tamanhos;
	}
	public void setTamanhos(List<TamanhoProduto> tamanhos) {
		this.tamanhos = tamanhos;
	}
	public List<CorProduto> getCores() {
		return cores;
	}
	public void setCores(List<CorProduto> cores) {
		this.cores = cores;
	}
	public Boolean getEmPromocao() {
		return emPromocao;
	}
	public void setEmPromocao(Boolean emPromocao) {
		this.emPromocao = emPromocao;
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
		Produto other = (Produto) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

    
    



}

