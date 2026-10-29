package br.com.maquiagestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pedidos")
public class PedidoController {

    @GetMapping
    public String lista() {
        return "pedidos/lista";
    }

    @GetMapping("/{id}")
    public String detalhes(@PathVariable Long id) {
        return "pedidos/detalhes";
    }
}