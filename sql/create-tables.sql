CREATE DATABASE Loja;

USE Loja;

CREATE SEQUENCE Seq_PessoaID
START WITH 7
INCREMENT BY 8;

CREATE TABLE Usuarios (
    usuarioID BIGINT IDENTITY(1,1) PRIMARY KEY,
    login VARCHAR(60) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE Pessoas (
    pessoaID BIGINT PRIMARY KEY DEFAULT NEXT VALUE FOR Seq_PessoaID,
    nome VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado CHAR(2) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE PessoasFisicas (
    pessoaID BIGINT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    FOREIGN KEY (pessoaID) REFERENCES Pessoas (pessoaID)
);

CREATE TABLE PessoasJuridicas (
    pessoaID BIGINT PRIMARY KEY,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (pessoaID) REFERENCES Pessoas (pessoaID)
);

CREATE TABLE Produtos (
    produtoID BIGINT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    precoVenda DECIMAL(18, 2) NOT NULL
);

CREATE TABLE Movimentos (
    movimentoID BIGINT PRIMARY KEY IDENTITY(1,1),
    usuarioID BIGINT NOT NULL,
    pessoaID BIGINT NOT NULL,
    produtoID BIGINT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    tipo CHAR(1) NOT NULL CHECK (tipo IN ('E', 'S')), -- 'E' para entrada, 'S' para saída
    valorUnitario DECIMAL(18,2) NOT NULL CHECK (valorUnitario >= 0),
    FOREIGN KEY (usuarioID) REFERENCES Usuarios(usuarioID),
    FOREIGN KEY (pessoaID) REFERENCES Pessoas(pessoaID),
    FOREIGN KEY (produtoID) REFERENCES Produtos(produtoID)
);
