-- Execute no console local do H2 quando o Spring estiver ligado.
-- A URL e os campos de acesso estão no arquivo application.properties.

-- 1. Quais são os produtos cadastrados?
SELECT * FROM PRODUTO;

-- 2. Quais produtos custam menos que R$ 30,00?
SELECT NOME, PRECO FROM PRODUTO WHERE PRECO < 30;

-- 3. Quantos produtos diferentes existem?
SELECT COUNT(*) AS QUANTIDADE FROM PRODUTO;

-- Desafio futuro: testar UPDATE (somente depois de fazer backup do banco).
