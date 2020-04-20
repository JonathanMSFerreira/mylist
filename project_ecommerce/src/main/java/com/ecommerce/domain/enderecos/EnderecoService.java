package com.ecommerce.domain.enderecos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.ecommerce.utils.exception.ObjectNotFoundException;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class EnderecoService {

    @Autowired
    private EnderecoRepository rep;

    public List<EnderecoDTO> getEnderecos() {
        List<EnderecoDTO> list = rep.findAll().stream().map(EnderecoDTO::create).collect(Collectors.toList());
        return list;
    }

    public EnderecoDTO getEnderecoById(Long id) {
        Optional<Endereco> endereco = rep.findById(id);
        return endereco.map(EnderecoDTO::create).orElseThrow(() -> new ObjectNotFoundException("Endereço não encontrada"));
    }
//
//    public List<ProdutoDTO> getCarrosByTipo(String tipo) {
//        return rep.findByTipo(tipo).stream().map(ProdutoDTO::create).collect(Collectors.toList());
//    }

    public EnderecoDTO insert(Endereco endereco) {
        Assert.isNull(endereco.getId(),"Não foi possível inserir o registro");

        return EnderecoDTO.create(rep.save(endereco));
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
