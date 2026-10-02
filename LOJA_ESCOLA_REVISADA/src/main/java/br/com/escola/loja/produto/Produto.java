package br.com.escola.loja.produto;

import java.math.BigDecimal;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

// POO: esta CLASSE é o molde de cada produto da loja.
// JPA: @Entity liga os objetos Produto a uma tabela do banco SQL.
@Entity
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // O banco cria automaticamente este identificador.

    @Column(nullable = false, length = 80)
    private String nome;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal preco; // Dinheiro: evita erros típicos de double.

    @Column(nullable = false)
    private Integer estoque;

    // Obrigatório para o JPA carregar produtos que já estão no banco.
    protected Produto() { }

    // Construtor usado pelo cadastro e pela carga de exemplos.
    public Produto(String nome, BigDecimal preco, Integer estoque) {
        this.nome = nome;
        this.preco = preco;
        this.estoque = estoque;
    }

    // Encapsulamento: os atributos são private; os getters permitem leitura.
    public Long getId() { return id; }
    public String getNome() { return nome; }
    public BigDecimal getPreco() { return preco; }
    public Integer getEstoque() { return estoque; }

    // Os setters facilitam a leitura do JSON recebido no cadastro.
    // As regras de validação estão no ProdutoController.
    public void setNome(String nome) { this.nome = nome; }
    public void setPreco(BigDecimal preco) { this.preco = preco; }
    public void setEstoque(Integer estoque) { this.estoque = estoque; }
}

