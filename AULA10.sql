USE INTERCAMBIO;
GO


DECLARE @d DATETIME = GETDATE();

SELECT  FORMAT(@d, 'D', 'en-US') AS 'Inglês Americano',
        FORMAT(@d, 'D', 'en-gb') AS 'Inglês Britânico',
        FORMAT(@d, 'D', 'de-de') AS 'Alemão',
        FORMAT(@d, 'D', 'zh-cn') AS 'Chinês Simplificado',
        FORMAT(@d, 'D', 'pt-br') AS 'Português Brasil';
GO


---

SELECT  NomeAluno AS 'Nome do Aluno',
        DataNasc AS 'Data de Nascimento',
        FORMAT(DataNasc, 'D', 'pt-br') AS 'Data de Nascimento'
FROM ALUNOS;
GO

---
SELECT NomeAluno AS 'Nome do Aluno',
	   DataNasc AS 'Data de Nascimento'
FROM ALUNOS;
GO

SELECT CONCAT('Paulo', 'Giovani') AS 'CONCAT',
	   CONCAT('Rua', 'João XXIII, ', '15', ' - São Paulo') AS 'Endereço',
	   STUFF('Paulo Giovani', 2, 1, 'TEXTO') AS 'STUFF',
	   REVERSE('Paulo Giovani') AS 'REVERSE',
	   REPLICATE(' * ', 10) AS 'REPLICATE 1', 'Paulo' + REPLICATE('.', 5) + ': ' + '6666-6666' AS 'REPLICATE 2';
GO

-- Altera o idioma para portugues do brasil
SET LANGUAGE Brazilian;
GO

-- Exibe a data de nascimento dos alunos
SELECT NomeAluno AS 'Nome do Aluno',
       DATEPART(DAY, DataNasc) AS 'Dia',
	   DATENAME(DW, DataNasc) AS 'Dia da Semana',
	   DATENAME(M, DataNasc) AS 'Nome do Mês',
	   DATEPART (YEAR, DataNasc) AS 'Ano',
	   CONCAT(DATENAME(DW, DataNasc), ', ', 
			  DATEPART (DAY, DataNasc), ' de ',
			  DATENAME(M, DataNasc), ' de ',
			  DATEPART(YEAR, DataNasc), ' . ') AS 'Data de Nascimento'
FROM ALUNOS;
GO

SELECT * FROM ALUNOS;
GO

-- Demonstra o uso de SUBSTRING, LEFT, UPPER, LTRIM e RTRIM

SELECT NomeAluno		AS 'Nome do Aluno',
	   SUBSTRING(NomeAluno, 1, 1) AS 'Inicial',
	   LOWER(NomeAluno)	AS 'Nome em minúsculas',
	   UPPER(NomeAluno) AS 'Nome em maiúsculas', 
	   LEN(NomeAluno)	AS 'Qtd caracteres',
	   LEFT(NomeAluno, 3)	AS 'LEFT',
	   RIGHT(NomeAluno, 3)	AS 'RIGHT',
	   RIGHT(RTRIM(NomeAluno), 3)	AS 'RITRIM', '  ' + 
		NomeAluno					AS 'LTRIM 1',
		LTRIM('    ' + NomeALuno)	AS 'LTRIM 2'
FROM ALUNOS;
GO

-- Exemplo basico de utilização de CAST e CONVERT 
DECLARE @valor AS DECIMAL(5, 2) = 156.90;

SELECT CAST(@valor AS CHAR(20))			AS 'CAST',
	   CONVERT(DECIMAL(10,5), @valor)	AS 'CONVERT';
GO