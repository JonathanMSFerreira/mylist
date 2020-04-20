package com.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ecommerce.domain.produtos.Produto;
import com.ecommerce.domain.produtos.ProdutoRepository;

@SpringBootApplication
public class CarrosApplication {


	
	
    public static void main(String[] args) {
    	
    	
    	
        SpringApplication.run(CarrosApplication.class, args);

//       BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//       System.out.println(encoder.encode("123"));
      
        
        
  
    
    
      
  }
    
    
}
