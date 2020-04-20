package com.ecommerce.domain.categorias;


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


public class CategoriaDTO {
   
	
	    private Long id;

	   
		private String titulo;
		
		
		private String urlFoto;
		
		
		@OneToMany(mappedBy = "categoria", cascade = CascadeType.ALL)
	    private List<CategoriaProduto> categorias;
		
		
		
		


    public static CategoriaDTO create(Categoria categoria) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(categoria, CategoriaDTO.class);
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


    
}
