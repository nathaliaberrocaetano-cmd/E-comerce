package br.com.escola.loja.produto;

import org.springframework.data.jpa.repository.JpaRepository;

// POO: é uma INTERFACE.
// O Spring fornece os métodos findAll(), save(), count() etc.
// É a ponte entre o nosso código Java e a tabela PRODUTO do SQL.
public interface ProdutoRepository extends JpaRepository<Produto, Long> { }
