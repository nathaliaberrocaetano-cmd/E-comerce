# LOJA ESCOLA - PROJETO-MODELO REVISADO

Um ponto de partida **opcional** para grupos do 2º ano criarem seu próprio e-commerce.
Aqui usamos Java + Spring Boot, HTML/CSS/JS e banco SQL H2 para reduzir a quantidade
de instalações. Outros grupos podem propor alternativas conforme a orientação do professor.

## O que já funciona
- Catálogo de 3 produtos em `http://localhost:8080`.
- API Java de consulta `GET /api/produtos` (JSON).
- Cadastro demonstrativo via `POST /api/produtos` e formulário da página.
- Banco H2 em `dados/loja.mv.db` que mantém os produtos após reiniciar.
- Carrinho **temporário**, apenas no navegador: NÃO cria pedidos, não diminui
  estoque, não possui login nem realiza pagamentos.

## PASSO A PASSO - PRIMEIRO DIA (WINDOWS)
1. Extraia completamente o arquivo ZIP. Não execute de dentro do ZIP.
2. Abra a pasta `LOJA_ESCOLA_REVISADA` no VS Code ou outro editor.
3. No terminal, confira `java -version` e `javac -version` (JDK 17+).
   O projeto não instala o JDK automaticamente.
4. Abra `INICIAR_NO_WINDOWS.bat` ou, se já tiver Maven, execute
   `mvn spring-boot:run` dentro desta pasta.
5. Aguarde a mensagem `Started LojaApplication`. Na primeira vez, os downloads
   podem demorar alguns minutos e precisam de acesso à internet.
6. **MANTENHA o terminal aberto**. Acesse `http://localhost:8080`.
7. Se aparecerem três produtos, a aplicação está rodando.
8. Abra outra aba: `http://localhost:8080/api/produtos` (dados em JSON).

OBS.: o iniciador do Windows usa Maven já instalado OU baixa localmente Maven
3.9.12 e confere o SHA-256; NÃO instala Java, não altera o Windows e NÃO
consegue contornar bloqueios de rede da escola. O navegador **não** deve
abrir `index.html` diretamente; sempre entre por `localhost:8080`.

## PRIMEIRO DIA (LINUX/MAC)
Com JDK 17+ e Maven instalados, use `bash INICIAR_LINUX_MAC.sh`.

## PERSONALIZAÇÃO INICIAL
- Troque o texto `<h1>Loja Escola</h1>` em `src/main/resources/static/index.html`.
- Mude a cor `--cor-principal` em `src/main/resources/static/estilo.css`.
- Se iniciou com `mvn spring-boot:run` ou o atalho Windows, salve e recarregue
  (Ctrl+F5 se precisar): configuramos `<addResources>true</addResources>`.
  Se executou direto pelo VS Code e não atualizou, reinicie o Java.
- **Não mexa no código Java na primeira aula**.

## SEGUNDO ENCONTRO - INTEGRAÇÃO
- Cadastre um produto pelo formulário na loja.
- Atualize `/api/produtos` e encontre o produto no JSON.
- Pare com Ctrl+C, reinicie o servidor e confira a persistência.
- SQL opcional: `http://localhost:8080/h2-console` com
  URL `jdbc:h2:file:./dados/loja`, usuário `sa`, senha vazia.
  Consulta: `SELECT * FROM PRODUTO;`

## MAPA DE ARQUIVOS
- `index.html`: conteúdo da página.
- `estilo.css`: aparência.
- `loja.js`: ponte entre página e API Java.
- `Produto.java`: classe POO (atributos privados e construtor).
- `ProdutoRepository.java`: interface pronta para o banco SQL.
- `ProdutoController.java`: os endpoints GET/POST.
- `application.properties`: configurações locais e H2.
- `CargaInicial.java`: 3 produtos de exemplo, SOMENTE quando o banco está vazio.
- `ferramentas/VerificarServidor.java`: verificação HTTP opcional para o professor (`java ferramentas/VerificarServidor.java`), após iniciar a loja.

## CUIDADOS E ERROS COMUNS
- Não use dados pessoais verdadeiros. Este protótipo é APENAS LOCAL.
- A API de cadastro é aberta e NÃO pode ser publicada como loja de verdade.
- Não mude `CargaInicial.java` esperando trocar produtos já guardados: cadastre
  pelo formulário. Para reiniciar a demonstração, leia `dados/LEIA-ME.txt`.
- Se `localhost:8080` não abrir, verifique o terminal, a versão do JDK
  e se a porta está ocupada. Para trocar: `server.port=8081` e novo endereço.
- Se faltar internet ou a política do laboratório bloquear Maven, use
  `PLANO_B_SEM_JAVA.html` para uma aula SÓ de frontend; ela NÃO usa SQL/Java.
  Volte ao projeto completo assim que o ambiente estiver disponível.
- Se `java` funciona e `javac` não, o JDK pode estar incompleto/no PATH.
- Se Java foi alterado, reinicie o backend. Se HTML/CSS não atualizou,
  force atualização do navegador (Ctrl+F5).
- Faça cópia da pasta antes de mudanças maiores; não compartilhe o banco
  `dados/loja.mv.db` com dados dos grupos.
