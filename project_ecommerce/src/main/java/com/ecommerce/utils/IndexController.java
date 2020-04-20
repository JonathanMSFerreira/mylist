package com.ecommerce.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ecommerce.domain.produtos.Produto;
import com.ecommerce.domain.produtos.ProdutoRepository;

@RestController
@RequestMapping("/")
public class IndexController {

	@Autowired
	ProdutoRepository pr;
	
	
    @GetMapping("/cargaDados")
    public String get() {
    	    	     	
    	      Produto p = new Produto();  
            
    	      p.setDescricao("lorem ipsu etc aqui estão as descricção");
    	      p.setEmPromocao(false);
    	      p.setMenorPreco(120.00);
    	      p.setMaiorPreco(150.00);
    	      p.setTitulo("Camisa social");
    	      pr.save(p);
    	    
    	      Produto p2 = new Produto();  
    	    
    	      p2.setDescricao("lorem ipsu etc aqui estão as descricção");
    	      p2.setEmPromocao(false);
    	      p2.setMenorPreco(90.80);
    	      p2.setMaiorPreco(111.3);
    	      p2.setTitulo("Vestido");
    	    
    	      pr.save(p2);

    	
    	
    	
        return "API dos Carros.";
    }

    @GetMapping("/userInfo")
    public UserDetails userInfo(@AuthenticationPrincipal UserDetails user) {
        return user;
    }
    
    
  
    
    
    
    
    
}
