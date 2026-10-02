package br.com.escola.loja.produto;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

// O navegador conversa com estes MÉTODOS usando endereços HTTP.
@RestController
@RequestMapping("/api/produtos")
public class ProdutoController {

    private final ProdutoRepository repositorio;

    // Spring entrega um repositório pronto para acessar a tabela de produtos.
    public ProdutoController(ProdutoRepository repositorio) {
        this.repositorio = repositorio;
    }

    // GET /api/produtos: CONSULTAR o banco e devolver uma lista como JSON.
    @GetMapping
    public List<Produto> listar() {
        return repositorio.findAll();
    }

    // POST /api/produtos: RECEBER os dados de um novo produto e salvar.
    // Exemplo de JSON: {"nome":"Estojo", "preco":19.90, "estoque":5}
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED) // HTTP 201: produto criado com sucesso.
    public Produto cadastrar(@RequestBody Produto dados) {
        // IMPORTANTE: validação também no Java. Não confie só no HTML.
        String nome = dados.getNome() == null ? "" : dados.getNome().trim();
        BigDecimal preco = dados.getPreco();
        Integer estoque = dados.getEstoque();

        if (nome.isEmpty() || nome.length() > 80 ||
            preco == null || preco.compareTo(BigDecimal.ZERO) <= 0 ||
            preco.compareTo(new BigDecimal("999999.99")) > 0 ||
            preco.stripTrailingZeros().scale() > 2 ||
            estoque == null || estoque < 0 || estoque > 10000) {

            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                "Use nome de até 80 caracteres, preço positivo com até 2 casas " +
                "decimais e estoque entre 0 e 10000.");
        }

        // Novo OBJETO de Produto; o ID será definido pelo banco.
        Produto novo = new Produto(nome, preco, estoque);
        return repositorio.save(novo);
    }
}
