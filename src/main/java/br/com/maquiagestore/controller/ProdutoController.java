package br.com.maquiagestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {

    @GetMapping
    public String lista() {
        return "produtos/lista";
    }

    @GetMapping("/novo")
    public String formulario() {
        return "produtos/formulario";
    }

    @GetMapping("/{id}")
    public String detalhes(@PathVariable Long id) {
        return "produtos/detalhes";
    }
}