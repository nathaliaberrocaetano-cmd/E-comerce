# EVOLUÇÃO DO PROJETO - ROTEIRO DE POSSIBILIDADES

O molde utiliza Java/Spring + HTML/JS + H2 (SQL) para começar com poucas instalações.
Ele é uma **sugestão**, não um padrão obrigatório para todos os grupos.

1. Comece escolhendo tema, nome da loja e visual: mude APENAS HTML/CSS.
2. Use o formulário existente para cadastrar um produto e verificar o JSON.
3. Tente uma melhoria por vez: busca por nome OU campo de categoria.
   Se adicionar categoria, planeje mudanças em Java, no banco e no HTML.
4. Só depois planeje `Cliente`, `Pedido` e `ItemPedido` em um diagrama.
5. Se avançar para pedidos, faça checkout de demonstração SEM dados reais.
6. Prepare uma apresentação breve mostrando frontend, API e persistência.

## Sugestão de registro semanal
- O que queríamos fazer?
- Qual arquivo alteramos?
- Qual teste mostrou que funcionou (print ou URL local)?
- Qual foi a dificuldade?
- Qual será o próximo passo?

## Observações técnicas
- Mudar `CargaInicial` não altera dados existentes em H2. Faça backup antes
  de recriar o banco de demonstração.
- MySQL/PostgreSQL ou outro banco SQL podem substituir H2 em outra etapa;
  precisam de instalação, driver e configuração.
- HTML offline do Plano B não tem Java nem SQL: é só uma maquete.
- Publicação na internet exigiria autenticação, autorização, proteção de
  dados e outras medidas ausentes neste exemplo. NÃO publicar esta versão.
