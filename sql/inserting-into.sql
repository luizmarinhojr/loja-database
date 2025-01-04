-- TABELA DE PESSOAS

INSERT INTO Pessoas (nome, logradouro, cidade, estado, telefone, email)
VALUES ('João', 'Rua 12, casa 3, Quitanda', 'Riacho do Norte', 'PA', '1111-1111', 'joao@riacho.com');

INSERT INTO PessoasFisicas (pessoaID, cpf)
VALUES (7, '11111111111');

--SELECT * FROM Pessoas p
--JOIN PessoasFisicas pf ON pf.pessoaID = p.pessoaID; 

INSERT INTO Pessoas (nome, logradouro, cidade, estado, telefone, email)
VALUES ('JJC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com');

INSERT INTO PessoasJuridicas (pessoaID, cnpj)
VALUES (15, '22222222222222');

--SELECT * FROM Pessoas p
--JOIN PessoasJuridicas pj ON pj.pessoaID = p.pessoaID;


-- TABELA DE USUARIOS

INSERT INTO Usuarios (login, senha)
VALUES ('op1', 'op1');

INSERT INTO Usuarios (login, senha)
VALUES ('op2', 'op2');


-- TABELA DE PRODUTOS

INSERT INTO Produtos (nome, quantidade, precoVenda)
VALUES ('Banana', 100, 5.00);

INSERT INTO Produtos (nome, quantidade, precoVenda)
VALUES ('Laranja', 400, 2.00);

DELETE FROM Produtos WHERE nome = 'Laranja';

INSERT INTO Produtos (nome, quantidade, precoVenda)
VALUES ('Laranja', 500, 2.00);

INSERT INTO Produtos (nome, quantidade, precoVenda)
VALUES ('Manga', 800, 4.00);

SELECT produtoID, nome, quantidade, FORMAT(precoVenda, 'N2') AS precoVenda 
FROM Produtos;


-- Tabela de movimento

INSERT INTO Movimentos (usuarioID, pessoaID, produtoID, quantidade, tipo, valorUnitario)
VALUES (1, 7, 1, 20, 'S', 4.00);

INSERT INTO Movimentos (usuarioID, pessoaID, produtoID, quantidade, tipo, valorUnitario)
VALUES (1, 7, 3, 15, 'S', 2.00);

INSERT INTO Movimentos (usuarioID, pessoaID, produtoID, quantidade, tipo, valorUnitario)
VALUES (2, 7, 3, 10, 'S', 3.00);

INSERT INTO Movimentos (usuarioID, pessoaID, produtoID, quantidade, tipo, valorUnitario)
VALUES (1, 15, 3, 15, 'E', 5.00);

INSERT INTO Movimentos (usuarioID, pessoaID, produtoID, quantidade, tipo, valorUnitario)
VALUES (1, 15, 4, 20, 'E', 4.00);

--SELECT 
--	usuarioID, 
--	pessoaID, 
--	produtoID, 
--	quantidade, 
--	tipo, 
--	FORMAT(valorUnitario, 'N2')
--FROM Movimentos;


