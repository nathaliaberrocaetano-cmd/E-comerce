# Maquiagem Store

Base inicial de uma loja virtual de maquiagem, organizada para crescer por etapas.

## Tecnologias

- Java 17 e Spring Boot 3.3
- Maven
- Spring MVC, Spring Data JPA e Thymeleaf
- H2 Database
- HTML5 e CSS3

## Executar

Na raiz do projeto, execute:

```bash
mvn spring-boot:run
```

A aplicação ficará disponível em <http://localhost:8080>. Para validar e empacotar:

```bash
mvn test
```

O console do H2 fica em <http://localhost:8080/h2-console>. Use JDBC URL `jdbc:h2:file:./data/maquiagem-store`, usuário `sa` e senha vazia. O banco local é criado na primeira inicialização.

## Estrutura

```text
src/main/java/br/com/maquiagestore/
	config/       Configurações e carga inicial
	controller/   Rotas HTTP e seleção de páginas
	dto/          Dados de transporte entre camadas
	model/        Entidades e relacionamentos JPA
	repository/   Interfaces de acesso ao banco
	service/      Espaço para regras de negócio
src/main/resources/
	db/           Estrutura SQL inicial
	static/       CSS e imagens estáticas
	templates/    Páginas Thymeleaf e fragmentos reutilizáveis
```

## Páginas iniciais

A página inicial apresenta áreas para banner, categorias, destaques e promoções. As páginas de produtos, cliente, carrinho, pedidos e administração são somente estruturas visuais e rotas iniciais; cadastro, autenticação, CRUD, estoque, carrinho e pedidos ainda não foram implementados.

## Banco de dados

As tabelas `categoria`, `produto`, `cliente`, `pedido` e `item_pedido` estão descritas em `src/main/resources/db/schema.sql`. O Hibernate valida o mapeamento JPA na inicialização; o script SQL é executado pelo Spring Boot para criar a estrutura no H2.