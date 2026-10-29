package br.com.maquiagestore.repository;

import br.com.maquiagestore.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {
}