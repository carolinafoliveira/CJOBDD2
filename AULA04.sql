
-- Criando o banco de dados e nomeando
CREATE DATABASE [CJ3037932]
GO

-- Usando o banco de dados 
USE CJ3037932;
GO

-- Criando tabela FUNCIONARIOS
CREATE TABLE FUNCIONARIOS (
	ID INT PRIMARY KEY,
	Nome VARCHAR(25) NOT NULL,
	Sexo CHAR(1) NULL,
	Admissao DATE NOT NULL,
	Salario DECIMAL(10,2) NOT NULL
);
GO

-- Exibe o nome das tabelas do banco dedados em uso

SELECT name
FROM sys.tables;
GO

-- Inserção dos dados
INSERT INTO FUNCIONARIOS (
	ID,
	Nome,
	Sexo,
	Admissao,
	Salario)

VALUES (1, 'Maria da Silva', 'F', '10/01/2018', 2500.00);
GO

INSERT INTO FUNCIONARIOS VALUES (2 , 'Fernando dos Santos', 'M', '03/04/2024', 990.00)
INSERT INTO FUNCIONARIOS VALUES (3, 'Joel Pereira', 'M', '03/03/2024', 990.00)
INSERT INTO FUNCIONARIOS VALUES (4, 'Mariana Lucio', 'F', '05/02/2025', 1590.00);
INSERT INTO FUNCIONARIOS VALUES (5, 'Carolina Oliveira', 'F', '05/02/2022', 25000.00);
INSERT INTO FUNCIONARIOS VALUES (6, 'Felipe Lima', 'M', '05/02/2025', 1590.00);
INSERT INTO FUNCIONARIOS VALUES (7, 'Priscila Mendes', 'F', '01/02/2026', 4590.00);

-- Altera o formato de data do SQL Server
SET DATEFORMAT DMY; 
GO

-- Exibe o conteudo da tabela FUNCIONARIOS
SELECT * FROM FUNCIONARIOS;
GO

SELECT ID AS 'Código do Funcionário',
	Nome,
	Sexo,
	Salario AS 'Salário'
FROM FUNCIONARIOS;
GO

SELECT TOP 3 * FROM FUNCIONARIOS
GO

SELECT * FROM FUNCIONARIOS
WHERE Sexo = 'M' AND
	Salario > 1000;
GO

-- Ordenando o resultado da consulta pelo nome
SELECT * FROM FUNCIONARIOS
ORDER BY Nome;
GO

-- Ordenando o resultado da consulta pelo nome
SELECT * FROM FUNCIONARIOS
ORDER BY Nome ASC;
GO

-- Ordenando o resultado da consulta pelo nome
SELECT * FROM FUNCIONARIOS
ORDER BY Nome DESC;
GO

INSERT INTO FUNCIONARIOS VALUES
	(8, 'Joice Raiane', 'F', '21/06/2012', 1700.00),
	(9, 'Lucas Antunes', 'M', '15/06/2020', 2700.00);
GO

SELECT * FROM FUNCIONARIOS
WHERE Salario < 3000
ORDER BY Nome,
		 Salario DESC;
GO

-- Alterando a estrutura da tabela
-- Criando uma tabela para testes
CREATE TABLE TESTE (
	ID INT,
	Nome CHAR(10)
);
GO

-- Exibe informacoes sobre a estrutura da tabela
EXEC sp_columns TESTE;
GO

-- Outra forma de exibir informações 
-- Sobre a estrutura da tabela
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE'
GO



-- Altera o tipo de dados da coluna Nome
ALTER TABLE TESTE
	ALTER COLUMN Nome CHAR(50);
GO

ALTER TABLE TESTE
	ADD Sexo CHAR(1) NULL;
GO	

ALTER TABLE TESTE
	ADD DataNascimento DATE,
		Peso DECIMAL(5,2);
GO

-- Exibe informacoes especificas sobre a estrutura da tabela
SELECT TABLE_CATALOG    AS 'Banco de Dados',
	   TABLE_NAME	    AS 'Tabela',
	   ORDINAL_POSITION AS 'Posição',
	   COLUMN_NAME		AS 'Coluna',
	   DATA_TYPE		AS 'Tipo de Dados',
	   COLLATION_NAME	AS 'Idioma da Coluna',
	   IS_NULLABLE		AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE'
GO

-- Remove a coluna DataNascimento
ALTER TABLE TESTE
	DROP COLUMN DataNascimento;
GO

-- Adiciona uma restricao nao nomeada
-- do tipo unica, na coluna Sexo
ALTER TABLE TESTE
	ADD UNIQUE (Sexo);
GO

-- ALtera a coluna ID, indicando que ela nao pode ser nula
ALTER TABLE TESTE
	ALTER COLUMN ID INT NOT NULL;
GO

-- Adiciona uma restricao nomeada, do tipo chave primaria, na coluna ID
ALTER TABLE TESTE
	ADD CONSTRAINT pk_id PRIMARY KEY (ID);
GO

-- Exibe informacoes sobre as restricoes que existem na tabela
EXEC sp_helpconstraint TEST;
GO

-- Outra forma de exibir informacoes sobre restricoes
SELECT CONSTRAINT_CATALOG	AS 'Banco de Dados',
	   TABLE_NAME			AS 'Tabela',
	   CONSTRAINT_TYPE		AS 'Tipo de Restrição',
	   CONSTRAINT_NAME		AS 'Nome da Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'TESTE';
GO

-- Removendo uma restrição nomeada
ALTER TABLE TESTE
	DROP CONSTRAINT UQ__TESTE__A22D230F6D81EF1A;
GO

-- Exclui tabela TESTE
DROP TABLE TESTE;
GO

-- Tenta selecionar os dados da tabela
SELECT * FROM TESTE;
GO