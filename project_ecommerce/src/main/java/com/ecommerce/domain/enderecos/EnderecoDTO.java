package com.ecommerce.domain.enderecos;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.modelmapper.ModelMapper;

import com.ecommerce.domain.carrinhos.CarrinhoProduto;
import com.ecommerce.domain.categorias.CategoriaProduto;
import com.ecommerce.domain.cores.CorProduto;
import com.ecommerce.domain.favoritos.Favorito;
import com.ecommerce.domain.fotos.FotoProduto;
import com.ecommerce.domain.tamanhos.TamanhoProduto;
import com.ecommerce.domain.users.User;


public class EnderecoDTO {
   
	
	private Long id;

	  
	private String estado;
	
	
	private String cidade;
	
	private String bairro;
	
	
	private String logradouro;
	
	private String CEP;
	
	
	private Boolean deletado = false;
	
	
	@ManyToOne
	private User user;
	


    public static EnderecoDTO create(Endereco endereco) {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(endereco, EnderecoDTO.class);
    }



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getEstado() {
		return estado;
	}



	public void setEstado(String estado) {
		this.estado = estado;
	}



	public String getCidade() {
		return cidade;
	}



	public void setCidade(String cidade) {
		this.cidade = cidade;
	}



	public String getBairro() {
		return bairro;
	}



	public void setBairro(String bairro) {
		this.bairro = bairro;
	}



	public String getLogradouro() {
		return logradouro;
	}



	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}



	public String getCEP() {
		return CEP;
	}



	public void setCEP(String cEP) {
		CEP = cEP;
	}



	public Boolean getDeletado() {
		return deletado;
	}



	public void setDeletado(Boolean deletado) {
		this.deletado = deletado;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}

	

	
    
}
