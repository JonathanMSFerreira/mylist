package com.ecommerce.domain.carrinhos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.ecommerce.utils.exception.ObjectNotFoundException;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CarrinhoService {

    @Autowired
    private CarrinhoRepository rep;

    public List<CarrinhoDTO> getCarrinhos() {
        List<CarrinhoDTO> list = rep.findAll().stream().map(CarrinhoDTO::create).collect(Collectors.toList());
        return list;
    }

    public CarrinhoDTO getCarrinhoById(Long id) {
        Optional<Carrinho> carrinho = rep.findById(id);
        return carrinho.map(CarrinhoDTO::create).orElseThrow(() -> new ObjectNotFoundException("Carrinho não encontrada"));
    }
//
//    public List<ProdutoDTO> getCarrosByTipo(String tipo) {
//        return rep.findByTipo(tipo).stream().map(ProdutoDTO::create).collect(Collectors.toList());
//    }

    public CarrinhoDTO insert(Carrinho carrinho) {
        Assert.isNull(carrinho.getId(),"Não foi possível inserir o registro");

        return CarrinhoDTO.create(rep.save(carrinho));
    }
//
//    public ProdutoDTO update(Produto produto, Long id) {
//        Assert.notNull(id,"Não foi possível atualizar o registro");
//
//        // Busca o carro no banco de dados
//        Optional<Produto> optional = rep.findById(id);
//        if(optional.isPresent()) {
//            Produto db = optional.get();
//            // Copiar as propriedades
//            db.setNome(produto.getNome());
//            db.setTipo(produto.getTipo());
//            System.out.println("Carro id " + db.getId());
//
//            // Atualiza o carro
//            rep.save(db);
//
//            return ProdutoDTO.create(db);
//        } else {
//            return null;
//            //throw new RuntimeException("Não foi possível atualizar o registro");
//        }
//    }

    public void delete(Long id) {
        rep.deleteById(id);
    }
}
