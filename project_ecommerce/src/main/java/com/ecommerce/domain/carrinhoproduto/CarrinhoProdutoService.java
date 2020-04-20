package com.ecommerce.domain.carrinhoproduto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.ecommerce.utils.exception.ObjectNotFoundException;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CarrinhoProdutoService {

    @Autowired
    private CarrinhoProdutoRepository rep;

    public List<CarrinhoProdutoDTO> getCarrinhoProdutos() {
        List<CarrinhoProdutoDTO> list = rep.findAll().stream().map(CarrinhoProdutoDTO::create).collect(Collectors.toList());
        return list;
    }

    public CarrinhoProdutoDTO getCarrinhoProdutoById(Long id) {
        Optional<CarrinhoProduto> carrinhoProduto = rep.findById(id);
        return carrinhoProduto.map(CarrinhoProdutoDTO::create).orElseThrow(() -> new ObjectNotFoundException("Carrinho não encontrada"));
    }
//
//    public List<ProdutoDTO> getCarrosByTipo(String tipo) {
//        return rep.findByTipo(tipo).stream().map(ProdutoDTO::create).collect(Collectors.toList());
//    }

    public CarrinhoProdutoDTO insert(CarrinhoProduto carrinhoProduto) {
        Assert.isNull(carrinhoProduto.getId(),"Não foi possível inserir o registro");

        return CarrinhoProdutoDTO.create(rep.save(carrinhoProduto));
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
