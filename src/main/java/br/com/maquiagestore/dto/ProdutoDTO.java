package br.com.maquiagestore.dto;

import java.math.BigDecimal;

public record ProdutoDTO(Long id, String nome, String marca, BigDecimal preco, String imagem) {
}