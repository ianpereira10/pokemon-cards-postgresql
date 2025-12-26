# Cartas Pokémon – PostgreSQL

Projeto de banco de dados relacional desenvolvido em PostgreSQL para catalogação de cartas Pokémon.

## 🎯 Objetivo
Modelar e implementar um banco de dados normalizado, separando cartas, tipos, estágios e coleções, garantindo integridade referencial e facilitando consultas.

## 🗂 Estrutura do Banco
- tbl_cards  
- tbl_types  
- tbl_stages  
- tbl_collections  
- vw_cards_detalhado (view para consultas consolidadas)

## 🛠 Tecnologias
- PostgreSQL
- SQL
- pgAdmin 4

## ⭐ Destaques
- Uso de chaves primárias e estrangeiras  
- Normalização de dados  
- View com JOINs para visualização consolidada  
- Dados de exemplo para testes

## ▶️ Como executar
1. Criar um banco de dados no PostgreSQL
2. Executar o arquivo `pokemon_cards.sql` no pgAdmin ou via psql
3. Consultar os dados utilizando a view `vw_cards_detalhado`

