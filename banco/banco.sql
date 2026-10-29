CREATE DATABASE ecommerce_maquiagem;

USE ecommerce_maquiagem;

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    tipo_pele VARCHAR(20) NOT NULL,
    etnia VARCHAR(20) NOT NULL,
    faixa_etaria VARCHAR(30) NOT NULL
);

INSERT INTO produto
(nome, descricao, preco, estoque, tipo, tipo_pele, etnia, faixa_etaria)
VALUES
('Base Líquida Matte',
'Base de cobertura média com acabamento matte, indicada para controlar o brilho da pele.',
49.90, 20, 'Rosto', 'Oleosa', 'Negra', 'Jovem-Adulta'),

('Base Hidratante',
'Base com acabamento natural, desenvolvida para deixar a pele com aparência hidratada.',
54.90, 20, 'Rosto', 'Seca', 'Clara', 'Adulta'),

('Corretivo Líquido',
'Corretivo para ajudar a uniformizar a aparência da pele e disfarçar pequenas imperfeições.',
29.90, 25, 'Rosto', 'Mista', 'Asiática', 'Adolescente'),

('Pó Compacto',
'Pó facial para ajudar na finalização da maquiagem e controlar o brilho.',
34.90, 20, 'Rosto', 'Oleosa', 'Clara', 'Jovem-Adulta'),

('Blush em Pó',
'Blush para adicionar cor e dar um aspecto saudável à maquiagem.',
27.90, 25, 'Rosto', 'Normal', 'Negra', 'Adulta'),

('Blush Cremoso',
'Blush de textura cremosa que proporciona um acabamento natural.',
32.90, 20, 'Rosto', 'Seca', 'Asiática', 'Jovem-Adulta'),

('Iluminador',
'Produto para destacar pontos do rosto e proporcionar luminosidade à maquiagem.',
39.90, 20, 'Rosto', 'Normal', 'Clara', 'Madura'),

('Contorno em Pó',
'Produto para criar definição e dimensão na maquiagem do rosto.',
36.90, 15, 'Rosto', 'Oleosa', 'Negra', 'Adulta'),

('Primer Facial',
'Produto aplicado antes da maquiagem para preparar a pele e melhorar a aplicação dos produtos.',
42.90, 20, 'Rosto', 'Mista', 'Asiática', 'Jovem-Adulta'),

('Fixador de Maquiagem',
'Spray utilizado no final da maquiagem para ajudar na sua durabilidade.',
44.90, 20, 'Rosto', 'Normal', 'Clara', 'Madura'),

('Paleta de Sombras Neutras',
'Paleta com tons neutros para criar maquiagens simples ou elaboradas.',
59.90, 15, 'Olhos', 'Normal', 'Clara', 'Jovem-Adulta'),

('Paleta de Sombras Coloridas',
'Paleta com diferentes cores para criar maquiagens mais criativas.',
64.90, 15, 'Olhos', 'Normal', 'Negra', 'Adolescente'),

('Máscara de Cílios',
'Produto para destacar e definir os cílios.',
29.90, 25, 'Olhos', 'Oleosa', 'Asiática', 'Jovem-Adulta'),

('Delineador Líquido',
'Delineador para criar diferentes estilos de traço nos olhos.',
24.90, 20, 'Olhos', 'Oleosa', 'Clara', 'Adulta'),

('Lápis de Olho',
'Lápis para destacar o contorno dos olhos.',
19.90, 25, 'Olhos', 'Mista', 'Negra', 'Adulta'),

('Sombra Líquida',
'Sombra de textura líquida para adicionar cor e brilho aos olhos.',
34.90, 15, 'Olhos', 'Seca', 'Asiática', 'Jovem-Adulta'),

('Glitter para Olhos',
'Produto com partículas de brilho para complementar a maquiagem dos olhos.',
22.90, 20, 'Olhos', 'Normal', 'Clara', 'Adolescente'),

('Primer para Olhos',
'Produto utilizado antes da sombra para preparar a região dos olhos.',
31.90, 20, 'Olhos', 'Mista', 'Negra', 'Jovem-Adulta'),

('Gel para Sobrancelhas',
'Produto para ajudar a alinhar e manter os fios das sobrancelhas no lugar.',
26.90, 20, 'Olhos', 'Normal', 'Asiática', 'Adulta'),

('Lápis para Sobrancelhas',
'Lápis utilizado para preencher e definir visualmente as sobrancelhas.',
21.90, 25, 'Olhos', 'Seca', 'Clara', 'Madura'),

('Batom Matte',
'Batom com acabamento matte e diferentes opções de cores.',
27.90, 25, 'Lábios', 'Normal', 'Negra', 'Jovem-Adulta'),

('Batom Cremoso',
'Batom de textura cremosa que proporciona acabamento confortável aos lábios.',
29.90, 20, 'Lábios', 'Seca', 'Clara', 'Adulta'),

('Gloss Labial',
'Produto que proporciona brilho aos lábios.',
22.90, 25, 'Lábios', 'Normal', 'Asiática', 'Adolescente'),

('Lip Tint',
'Produto que adiciona uma coloração suave aos lábios.',
24.90, 20, 'Lábios', 'Mista', 'Negra', 'Jovem-Adulta'),

('Lápis Labial',
'Lápis utilizado para contornar e definir os lábios.',
19.90, 20, 'Lábios', 'Normal', 'Clara', 'Madura'),

('Balm Labial com Cor',
'Balm que combina hidratação com uma leve coloração.',
23.90, 25, 'Lábios', 'Seca', 'Asiática', 'Adolescente'),

('Gloss com Brilho',
'Gloss com partículas de brilho para criar um acabamento luminoso.',
25.90, 20, 'Lábios', 'Mista', 'Negra', 'Adulta');

SELECT * FROM produto;

SELECT COUNT(*) AS total_produtos
FROM produto;
```
