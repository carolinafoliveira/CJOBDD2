USE CJ3037932
GO

-- Criar tabela DEPENDENTE
CREATE TABLE DEPENDENTES(
	CodDependentes INT PRIMARY KEY,
	Nome VARCHAR(35) NOT NULL,
	Sexo CHAR(1) NULL,
	DataNascimento DATE NOT NULL,
	ID INT FOREIGN KEY REFERENCES
FUNCIONARIOS (ID)
);
GO

-- EXIBE TABELA
SELECT * FROM DEPENDENTES;
GO

-- FORMATA A DATA
SET DATEFORMAT DMY;
GO

-- Importando arquivo .csv
BULK INSERT DEPENDENTES 
	FROM N'C:\Users\cclar\OneDrive\Documentos\ADS - IFSP 2025\3_PERIODO\BDD2\dados\dependentes.csv'
WITH (
	FIRSTROW = 2,
	DATAFILETYPE = 'widechar',
	FIELDTERMINATOR = ';',
	CODEPAGE = '65001'
);
GO

SELECT * FROM DEPENDENTES;
GO

-- Limpa tabela
-- TRUNCATE TABLE DEPENDENTES;
-- GO

SELECT * FROM FUNCIONARIOS;
GO

-- CROSS JOIN
-- Realiza a junção cruzada entre os dados das tabelas FUNCIONARIOS e DEPENDENTES 
SELECT * FROM FUNCIONARIOS, DEPENDENTES;
GO

SELECT * FROM FUNCIONARIOS CROSS JOIN DEPENDENTES;
GO

-- Realiza a junção cruzada entre os dados das tabelas FUNCIONARIOS e DEPENDENTES. Utiliza 
-- um alias para nomear cada tabela

SELECT F.ID   AS 'Código do Funcionário',
	   F.Nome AS 'Nome do Funcionário',
	   D.Nome AS 'Nome do Dependente',
	   D.DataNascimento AS 'Data de Nascimento'
FROM FUNCIONARIOS F CROSS JOIN DEPENDENTES D;
GO

-- Exibe o ID, nome e salario dos funcionarios, junto com o nome do dependente e o codigo do responsavel por ele.
-- Exibe somente o registro do funcionario que possui algum dependente.
SELECT F.ID      AS 'Código do Funcionário',
       F.Nome    AS 'Nome do Funcionário',
	   F.Salario AS 'Salário',
	   D.Nome    AS 'Nome do Dependente',
	   D.ID      AS 'Código do Responsável'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
	ON F.ID = D.ID;
GO	

-- Exibe os dados dos funcionarios, renomeia as colunas e ordena dados por Nome

SELECT F.ID				AS 'Código do Funcionário',
       F.Nome			AS 'Nome do Funcionário',
	   F.Salario		AS 'Salário',
	   D.Nome			AS 'Nome do Dependente',
	   D.DataNascimento	AS 'Data de Nascimento',
	   D.ID				AS 'Código do Responsável'
FROM FUNCIONARIOS F INNER JOIN DEPENDENTES D
	ON F.ID = D.ID
WHERE YEAR(D.DataNascimento) >= 2000
ORDER BY F.Nome, D.Nome;
GO

-- Inserir novos dados na tabela FUNCIONARIOS
INSERT INTO FUNCIONARIOS VALUES
	(11, 'Ana Cláudia', 'F', '12/09/2011', 4900.00, '3663-9090'),
	(12, 'Mario Aurelio', 'M', '15/11/2009', 2050.00, '3664-8989'),
	(13, 'Anderson Moraes', 'M', '02/10/2009', 3800.00, NULL),
	(14, 'Mariane Gomes', 'F', '10/11/2010', 1750.50, NULL),
	(15, 'Amanda Luz', 'F', '10/07/2016', 1750.50,'3662-1212');
GO

-- Exibe as informações de todos os funcionarios, inclusive daqueles que nao possuem
-- nenhum dependente

SELECT F.ID				AS 'ID',
       F.Nome			AS 'Funcionário',
	   F.Admissao		AS 'Admissão',
	   F.Salario		AS 'Salário',
	   D.Nome			AS 'Dependente',
	   D.DataNascimento	AS 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT OUTER JOIN DEPENDENTES D
	ON F.ID = D.ID;
GO

-- Exibe as informações de todos os funcionarios que nao possuem nenhum dependente
SELECT F.ID				AS 'ID',
       F.Nome			AS 'Funcionário',
	   F.Admissao		AS 'Admissão',
	   F.Salario		AS 'Salário',
	   D.Nome			AS 'Dependente',
	   D.DataNascimento	AS 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT OUTER JOIN DEPENDENTES D
	ON F.ID = D.ID
WHERE D.Nome IS NULL;
GO