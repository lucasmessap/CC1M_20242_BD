CREATE DATABASE IF NOT EXISTS projeto_fortes;

USE projeto_fortes;


CREATE TABLE IF NOT EXISTS funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS donatarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    tipo VARCHAR(100) NOT NULL    
);


CREATE TABLE IF NOT EXISTS projetos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    status ENUM('rascunho', 'ativo', 'concluido', 'cancelado') NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);


CREATE TABLE IF NOT EXISTS reunioes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_hora DATETIME NOT NULL,
    projeto_id INT NOT NULL,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);


CREATE TABLE IF NOT EXISTS editais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_publicacao DATETIME NOT NULL,
    data_encerramento DATETIME NOT NULL,
    status ENUM('rascunho', 'publicado', 'encerrado') NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);


CREATE TABLE IF NOT EXISTS relatorios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    conteudo TEXT,
    data_criacao DATETIME NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    projeto_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

