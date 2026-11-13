-- Habililta banco de dados
USE INTERCAMBIO;
GO

-- Cria a tabela AERONAVES
CREATE TABLE AERONAVES (
	CodAeronave INT IDENTITY PRIMARY KEY,
	Modelo VARCHAR(50) NOT NULL
);
GO

-- Insere algumas aeronaves
INSERT INTO AERONAVES VALUES
	('Boeing 707'),
	('Boeing 737'),
	('Boeing 747'),
	('Embraer ERJ-145'),
	('Vickers VC-10');
GO

-- Exibe os dados das aeronaves
SELECT * FROM AERONAVES;
GO

-- Permite inserir valor explicitos na coluna de identidade de uma tabela
SET IDENTITY_INSERT AERONAVES ON;
GO

-- Tenta inserir uma nova aeronave fornecendo o valor de um campo IDENTITY
INSERT INTO AERONAVES (CodAeronave, Modelo) VALUES
	(6, 'Airbus A300');
GO

-- Exibe os dados das aeronaves
SELECT * FROM AERONAVES;
GO

-- Desabilita inserir valor explicitos na coluna de identidade de uma tabela
SET IDENTITY_INSERT AERONAVES OFF;
GO

-- Cria a tabela VEICULOS 
-- Utiliza um IDENTITY começando em 1 e com incremento 10
CREATE TABLE VEICULOS (
	Codigo INT IDENTITY(1, 10) PRIMARY KEY,
	Modelo VARCHAR(50) NOT NULL
);
GO

-- Insere alguns veiculos
INSERT INTO VEICULOS (Modelo) VALUES 
    ('Ferrari'),
    ('Camaro'),
    ('Fusca');
GO

-- Exibe os dados das veiculos
SELECT * FROM VEICULOS;
GO

-- Exibe o valor do incremento utilizado
SELECT IDENT_INCR('AERONAVES') AS 'Inc. AERONAVES',
	   IDENT_INCR('VEICULOS')  AS 'Inc. VEICULOS';
GO

-- Exibe o ultimo valor de IDENTITY que foi utilizado
SELECT @@IDENTITY AS 'Último IDENTITY',
	IDENT_CURRENT('VEICULOS') AS 'IDENTITY (VEICULOS)',
	IDENT_CURRENT('AERONAVES') AS 'IDENTITY (AERONAVES)';
GO

-- Cria uma sequencia que começa em 1, com incremento 1
CREATE SEQUENCE Incrementa1 AS INT
	START WITH 1
	INCREMENT BY 1;
GO

-- Cria uma sequencia que começa em 10, com incremento 100
CREATE SEQUENCE Incrementa100 AS INT
	START WITH 10
	INCREMENT BY 100;
GO

-- Cria uma sequencia que começa em 1000, com incremento -100
CREATE SEQUENCE Incrementa1000 AS INT
	START WITH 1000
	INCREMENT BY -100;
GO

-- Exibe informações sobre as sequencias
SELECT name AS 'Nome',
	create_date AS 'Data de Criação',
	start_value AS 'Valor Inicial',
	increment AS 'Incremento',
	minimum_value AS 'Valor Minimo',
	maximum_value AS 'Valor Maximo',
	current_value AS 'Valor Atual'
FROM sys.sequences;
GO

-- Criando uma sequencia com mais parametros
CREATE SEQUENCE IncrementaDecimal AS DECIMAL (3, 0)
	START WITH 125
	INCREMENT BY 25
	MINVALUE 100
	MAXVALUE 200
	CYCLE
	CACHE 3;
GO

-- Exibe o primeiro valor das sequencias 
SELECT NEXT VALUE FOR Incrementa1 AS 'Incrementa1',
	NEXT VALUE FOR Incrementa100 AS 'Incrementa100',
	NEXT VALUE FOR Incrementa1000 AS 'Incrementa1000',
	NEXT VALUE FOR IncrementaDecimal AS 'IncrementaDecimal';
GO

-- Cria uma tabela temporaria para ilustrar a utilizacao das sequencias
CREATE TABLE #TestaSequencia (
	ID INT,
	Nome CHAR(20)
);
GO

-- Reinicia o valor da sequencia Incrementa100
ALTER SEQUENCE Incrementa100
	RESTART WITH 10;
GO

-- Utiliza a sequencia INCREMENTA100 para inserir valores na tabela #TestaSequencia
INSERT INTO #TestaSequencia (ID, Nome) VALUES
	(NEXT VALUE FOR Incrementa100, 'Ana'),
	(NEXT VALUE FOR Incrementa100, 'Maria'),
	(NEXT VALUE FOR Incrementa100, 'João');
GO

-- Exibe os valores da tabela #TestaSequencia
SELECT * FROM #TestaSequencia;
GO

-- Recuperando o valor atual de uma sequencia 
SELECT current_value AS 'Valor Atual'
FROM sys.sequences
WHERE name = 'Incrementa100';
GO

-- Remove a sequencia Incrementa100
DROP SEQUENCE Incrementa100;
GO

-- Tenta inserir um registro utilizando a sequencia INCREMENTA100
INSERT INTO #TestaSequencia (ID, Nome) VALUES
	(NEXT VALUE FOR Incrementa100, 'José');
GO