package br.com.maquiagestore.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record PedidoDTO(Long id, LocalDateTime data, String status, BigDecimal valorTotal) {
}