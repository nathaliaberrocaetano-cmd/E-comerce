# GUIA DO PROFESSOR - MATERIAL REVISADO

## Revisões técnicas feitas
- Mantidas só duas rotas REST (GET/POST), sem login ou pedidos reais.
- A classe `Produto` tem campos privados, comentários POO e limites de coluna.
- O Controller valida nome/preço/estoque e o POST retorna HTTP 201.
- O formulário reflete as mesmas regras, evita clique duplicado e exibe erros.
- O Maven está configurado com addResources para refletir alterações de HTML/CSS/JS
  ao atualizar o navegador quando usar o atalho ou `mvn spring-boot:run`.
- O JavaScript usa textContent: nome do produto NÃO é interpretado como HTML.
- O banco é H2 persistente local: 3 exemplos só são criados se estiver vazio.
- O console SQL e o servidor ficam acessíveis somente no próprio computador.
- Incluído um verificador HTTP opcional (`java ferramentas/VerificarServidor.java`) que usa apenas o JDK, sem novas dependências.
- Corrigidos os nomes do ZIP e do guia; Plano B separado se a rede bloquear Java.

## Antes de ir à sala (essencial)
1. Teste `java -version` + `javac -version` num PC da escola (JDK 17+).
2. Extraia e tente `INICIAR_NO_WINDOWS.bat`; a primeira execução precisa
   baixar Maven (se ausente) E dependências Spring/JPA/H2.
3. Verifique o bloqueio de PowerShell, firewall e proxy. Se bloqueado,
   prefira Maven pré-instalado ou execute num PC previamente preparado.
4. Confirme `http://localhost:8080` e `/api/produtos`. Pare com Ctrl+C.
5. Tenha `PLANO_B_SEM_JAVA.html` pronto para garantir a aula.

## AULA 1 (50 min) - APENAS RODAR E IDENTIFICAR (10/30/10)
0-10 min: chamada, celulares, objetivo/fluxo na lousa:
HTML/JS -> GET /api/produtos -> Controller -> Repository -> H2.
Pergunta: de onde vêm os produtos da página?
10-40 min: extrair, conferir JDK, abrir editor, iniciar servidor
e visitar loja + JSON. Quem conseguir: trocar nome e cor.
**Não exigir cadastro nem SQL na primeira aula.**
40-50 min: explicar onde ficam os arquivos e registrar 2 evidências
(página e JSON). Se instalação falhar: abrir Plano B e deixar Java
para a próxima oportunidade; anotar exatamente o erro técnico.

## AULA 2 (50 min) - HTML -> JAVA -> SQL
0-10 min: retomar página/JSON, mostrar Produto.java como CLASSE com
atributos privados e ProdutoRepository.java como INTERFACE.
10-40 min: cadastro demonstrativo pelo formulário, atualizar JSON,
reiniciar e verificar persistência. Só grupos mais adiantados usam console H2.
40-50 min: quatro respostas curtas: frontend, backend, banco, diferença
entre o catálogo persistente e o carrinho temporário.

## Evolução sugerida ao longo do mês
Semana 1: rodar e personalizar nome/cores.
Semana 2: entender GET/POST e cadastrar um produto.
Semana 3: busca local por nome OU categoria, conforme nível do grupo.
Semana 4: desenhar Pedido e ItemPedido no papel antes de codificar.
Cada grupo pode propor outras tecnologias/funcionalidades, desde que
explique a separação entre as partes e demonstre um protótipo.

## Diagnóstico rápido
- Erro de Java: JDK e PATH.
- Erro de download: rede, proxy, antivírus/restrições escolares.
- Porta 8080 ocupada: encerrar processo ou mudar `server.port`.
- Página carrega, mas vazia: testar `/api/produtos` e console do navegador.
- Carga não muda: só semeia banco vazio; cadastrar via formulário.
- SQL inválido: URL de conexão deve ser EXATAMENTE a de `application.properties`.

## Limites importantes
Protótipo didático LOCAL; sem autenticação, controle de acesso, transações
de pedidos, reserva de estoque ou pagamentos. Não publicar na internet,
não coletar dados pessoais ou cartões. O carrinho não é uma compra.
