-- a. Dados completos de pessoas fisicas:
SELECT * FROM Pessoas p 
JOIN PessoasFisicas pf ON p.pessoaID = pf.pessoaID;


-- b. Dados completos de pessoas juridicas:
SELECT * FROM Pessoas p 
JOIN PessoasJuridicas pj ON p.pessoaID = pj.pessoaID;


-- c. Movimentacoes de entrada, com produto, fornecedor, quantidade, preco unitario e valor total:
SELECT
	m.movimentoID,
	pr.nome AS produto, 
	p.nome AS fornecedor, 
	m.quantidade, 
	FORMAT(m.valorUnitario, 'N2') AS precoUnitario, 
	FORMAT((m.quantidade * m.valorUnitario), 'N2') AS valorTotal
FROM 
	Movimentos m 
JOIN 
	Produtos pr ON pr.produtoID = m.produtoID 
JOIN 
	Pessoas p ON p.pessoaID = m.pessoaID
WHERE 
	m.tipo = 'E';


-- d. Movimentacoes de saida, com produto, comprador, quantidade, preco unitario e valor total:
SELECT
	m.movimentoID,
	pr.nome AS produto, 
	p.nome AS comprador, 
	m.quantidade, 
	FORMAT(m.valorUnitario, 'N2') AS precoUnitario, 
	FORMAT((m.quantidade * m.valorUnitario), 'N2') AS valorTotal
FROM 
	Movimentos m 
JOIN 
	Produtos pr ON pr.produtoID = m.produtoID 
JOIN 
	Pessoas p ON p.pessoaID = m.pessoaID
WHERE 
	m.tipo = 'S';


-- e. Valor total das entradas agrupadas por produto:
SELECT 
	pr.nome AS produto,
	FORMAT(SUM(m.quantidade * m.valorUnitario), 'N2') AS valorTotalEntrada
FROM 
	Movimentos m
JOIN 
	Produtos pr ON pr.produtoID = m.produtoID
WHERE 
	m.tipo = 'E'
GROUP BY 
	pr.nome;


-- f. Valor total das saidas agrupadas por produto:
SELECT 
	pr.nome AS produto,
	FORMAT(SUM(m.quantidade * m.valorUnitario), 'N2') AS valorTotalSaida
FROM 
	Movimentos m
JOIN 
	Produtos pr ON pr.produtoID = m.produtoID
WHERE 
	m.tipo = 'S'
GROUP BY 
	pr.nome;


-- g. Operadores que nao efetuaram movimentacoes de entrada (compra):
SELECT
	u.usuarioID, 
	u.login AS operador
FROM 
	Usuarios u
LEFT JOIN 
	Movimentos m ON m.usuarioID = u.usuarioID AND m.tipo = 'E'
WHERE 
	m.movimentoID IS NULL;


-- h. Valor total de entrada, agrupado por operador: 
SELECT 
	u.login AS operador,
	FORMAT(SUM(m.quantidade * m.valorUnitario), 'N2') AS valorTotalEntrada
FROM 
	Usuarios u
JOIN 
	Movimentos m ON m.usuarioID = u.usuarioID 
WHERE 
	m.tipo = 'E'
GROUP BY 
	u.login;


-- i. Valor total de saida, agrupado por operador:
SELECT 
	u.login AS operador,
	FORMAT(SUM(m.quantidade * m.valorUnitario), 'N2') AS valorTotalSaida
FROM 
	Usuarios u
JOIN 
	Movimentos m ON m.usuarioID = u.usuarioID 
WHERE 
	m.tipo = 'S'
GROUP BY 
	u.login;


-- j. Valor médio de venda por produto, utilizando media ponderada:
SELECT 
    pr.nome AS produto, 
    SUM(m.quantidade * m.valorUnitario) / SUM(m.quantidade) AS valorMedioVenda
FROM 
    Movimentos AS m
JOIN 
    Produtos AS pr ON m.produtoID = pr.produtoID
WHERE 
    m.tipo = 'S' -- 'S' para saídas
GROUP BY 
    pr.nome;


