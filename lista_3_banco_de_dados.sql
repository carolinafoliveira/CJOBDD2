-- Lista de Exercicios 3
-- Aluna: Carolina F. Cl. Oliveira
-- Utiliza a lista 2 LojaIFSP

-- Habilita o contexto do banco Loja IFSP

IF DB_ID (N'LojaIFSP') IS NULL
	PRINT 'O banco de dados LojaIFSP não existe!';
ELSE
	USE LojaIFSP;
GO

-- Exibe a data de criaçãp e o nome das tabelas
-- que existem no banco de dados em uso

SELECT create_date AS 'Data de Criação',
	   name		   AS 'Nome da Tabela'
FROM sys.tables;
GO

-- Exibe informações sobre a estrutura da tabela

SELECT TABLE_CATALOG		AS 'Banco de Dados',
	   TABLE_NAME			AS 'Tabela',
	   ORDINAL_POSITION		AS 'Posição',
	   COLUMN_NAME			AS 'Coluna',
	   DATA_TYPE			AS 'Tipo de Dados',
	   COLLATION_NAME		AS 'Idioma da Coluna',
	   IS_NULLABLE			AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CLIENTES';
GO

-- Exibe todos os registros da tabela CLIENTES

SELECT * FROM CLIENTES;
GO

-- QUESTÃO 1
-- Escreva uma consulta SQL para alterar a estrutura da tabela CLIENTES,
-- adicionando os campos DDD e Telefone. Utilize o tipo de dados CHAR(2) para DDD
-- e CHAR(10) para Telefone

ALTER TABLE CLIENTES
	ADD DDD CHAR(2);
GO

ALTER TABLE CLIENTES
	ADD Telefone CHAR(10);
GO

SELECT * FROM CLIENTES;
GO

-- Troca a ordem das colunas da tabela
SELECT ID, Nome, Sexo, Idade, CPF, Email, DDD, Telefone
FROM CLIENTES;
GO

SELECT * FROM CLIENTES;
GO

-- QUESTÃO 2
-- Escreva uma consulta SQL para atualizar os registros dos clientes cadastrados
-- conforme a saída representada na Figura 3

INSERT INTO dbo.CLIENTES
VALUES (4, 'Maria Clara', 'F', 22, '44444444444', 'maria@gmail.com', NULL, NULL);
GO

INSERT INTO CLIENTES
VALUES (9, 'Daphne Lima', 'F', 25, '99999999999', 'daphne@gmail.com', '97070-6070', '12');
GO

UPDATE CLIENTES SET DDD ='12', Telefone ='3664-5060' WHERE ID =1;

UPDATE CLIENTES SET DDD ='12', Telefone ='3664-8090' WHERE ID =2;
UPDATE CLIENTES SET DDD ='12', Telefone ='3663-1070' WHERE ID =3;
UPDATE CLIENTES SET DDD =NULL, Telefone =NULL WHERE ID =4;

SELECT * FROM CLIENTES;
GO

UPDATE CLIENTES SET DDD ='12', Telefone ='3664-6070' WHERE ID =5;
UPDATE CLIENTES SET DDD =NULL, Telefone =NULL WHERE ID =6;
UPDATE CLIENTES SET DDD ='12', Telefone ='98790-6070' WHERE ID =7;
UPDATE CLIENTES SET DDD =NULL, Telefone =NULL WHERE ID =8;
UPDATE CLIENTES SET DDD ='12', Telefone ='97070-6070' WHERE ID =9;
UPDATE CLIENTES SET DDD =NULL, Telefone =NULL WHERE ID =10;
UPDATE CLIENTES SET DDD =NULL, Telefone =NULL WHERE ID =11;
UPDATE CLIENTES SET DDD ='11', Telefone ='99555-0001' WHERE ID =12;
UPDATE CLIENTES SET DDD ='11', Telefone ='97890-1010' WHERE ID =13;
UPDATE CLIENTES SET DDD =NULL, Telefone =NULL WHERE ID =14;
UPDATE CLIENTES SET DDD =NULL, Telefone ='98888-0102' WHERE ID =15;

SELECT * FROM CLIENTES;
GO

-- Troca a ordem das colunas da tabela
SELECT ID, Nome, Sexo, Idade, CPF, Email, DDD, Telefone
FROM CLIENTES;
GO