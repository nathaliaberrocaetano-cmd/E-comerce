# VALIDAÇÃO E LIMITES DESTA REVISÃO

Data: 28/09/2026.

## Testes realizados nesta revisão
- `pom.xml` interpretado como XML válido. Foram mantidas só as três dependências de execução para reduzir downloads iniciais.
- Arquivos Java compilados com `javac` usando stubs locais para os tipos Spring/JPA (verifica sintaxe do código fonte, NÃO a integração com o framework real).
- Exercitados `CargaInicial` e `ProdutoController` com um repositório simulado: 3 produtos iniciais sem duplicação, listagem, cadastro e rejeição de seis entradas inválidas.
- `loja.js` validado com `node --check` e testado com navegador simulado: carregamento, estoque zero, carrinho, total, limpeza e cadastro POST/atualização.
- Script para Linux/Mac validado com `bash -n`.
- ZIP e PDF validados estruturalmente.
- Soma SHA-256 do arquivo Maven 3.9.12, usado pelo script Windows, conferida em material público de atualização do wrapper Maven.

## O que ainda precisa de teste no computador da escola
**Não foi possível executar o servidor Spring Boot e o H2 completos neste ambiente**, pois não há acesso externo para obter as dependências Maven. O professor deve iniciar o projeto em um computador com internet ANTES da aula e, com o servidor ligado, executar `java ferramentas/VerificarServidor.java`. Esse verificador confirma a página e a API GET sem alterar os dados; o cadastro POST e a persistência devem ser conferidos manualmente pelo formulário.

## Atenção ao ambiente escolar
- Internet e políticas de rede podem impedir o Maven no primeiro acesso.
- JDK 17 ou superior deve estar instalado; o iniciador não instala Java.
- Se o laboratório bloquear instalação, utilize o arquivo `PLANO_B_SEM_JAVA.html` como atividade de frontend. Ele é uma maquete SEM Java e SQL; não demonstra o projeto completo.
- O serviço foi restrito a 127.0.0.1. Não hospede publicamente: o cadastro não possui autenticação, controle de acesso ou processamento de pedidos reais.
