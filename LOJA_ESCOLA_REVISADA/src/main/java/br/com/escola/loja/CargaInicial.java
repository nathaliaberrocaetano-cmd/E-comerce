package br.com.escola.loja;

import java.math.BigDecimal;
import java.util.List;
import br.com.escola.loja.produto.Produto;
import br.com.escola.loja.produto.ProdutoRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

// Só para facilitar a primeira aula: cria exemplos se o banco estiver vazio.
// Os dados NÃO serão duplicados toda vez que o servidor for reiniciado.
@Component
public class CargaInicial implements CommandLineRunner {

    private final ProdutoRepository repositorio;

    public CargaInicial(ProdutoRepository repositorio) {
        this.repositorio = repositorio;
    }

    @Override
    public void run(String... args) {
        if (repositorio.count() == 0) {
            repositorio.saveAll(List.of(
                new Produto("Camiseta da escola", new BigDecimal("39.90"), 12),
                new Produto("Caneca personalizada", new BigDecimal("24.50"), 20),
                new Produto("Caderno criativo", new BigDecimal("18.00"), 15)
            ));
        }
    }
}
