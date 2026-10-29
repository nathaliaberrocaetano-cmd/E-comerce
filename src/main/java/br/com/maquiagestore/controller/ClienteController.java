package br.com.maquiagestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cliente")
public class ClienteController {

    @GetMapping("/cadastro")
    public String cadastro() {
        return "cliente/cadastro";
    }

    @GetMapping("/perfil")
    public String perfil() {
        return "cliente/perfil";
    }
}