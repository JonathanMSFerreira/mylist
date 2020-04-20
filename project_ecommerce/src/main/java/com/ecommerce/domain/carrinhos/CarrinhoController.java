package com.ecommerce.domain.carrinhos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/carrinhos")
public class CarrinhoController {
    
	
	@Autowired
    private CarrinhoService service;

    @GetMapping()
    public ResponseEntity get() {
     
    	List<CarrinhoDTO> carrinhos = service.getCarrinhos();
        return ResponseEntity.ok(carrinhos);
    
    }

    @GetMapping("/{id}")
    public ResponseEntity get(@PathVariable("id") Long id) {
    
    	CarrinhoDTO carrinho = service.getCarrinhoById(id);
        return ResponseEntity.ok(carrinho);
    }

//    @GetMapping("/tipo/{tipo}")
//    public ResponseEntity getCarrosByTipo(@PathVariable("tipo") String tipo) {
//        List<ProdutoDTO> carros = service.getCarrosByTipo(tipo);
//        return carros.isEmpty() ?
//                ResponseEntity.noContent().build() :
//                ResponseEntity.ok(carros);
//    }

    @PostMapping
    @Secured({ "ROLE_ADMIN" })
    public ResponseEntity post(@RequestBody Carrinho carrinho) {

        CarrinhoDTO c = service.insert(carrinho);

        URI location = getUri(c.getId());
        return ResponseEntity.created(location).build();
    }

    private URI getUri(Long id) {
        return ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(id).toUri();
    }
//
//    @PutMapping("/{id}")
//    public ResponseEntity put(@PathVariable("id") Long id, @RequestBody Produto produto) {
//
//        produto.setId(id);
//
//        ProdutoDTO c = service.update(produto, id);
//
//        return c != null ?
//                ResponseEntity.ok(c) :
//                ResponseEntity.notFound().build();
//    }

    
    
 
    @Secured({ "ROLE_ADMIN" })
    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") Long id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
