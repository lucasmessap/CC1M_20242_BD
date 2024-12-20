-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS CompanhiaAereaDB;
USE CompanhiaAereaDB;

-- Tabela PASSAGEIROS
CREATE TABLE PASSAGEIROS (
    PASS_CPF VARCHAR(11) PRIMARY KEY,
    PASS_NOME VARCHAR(50) NOT NULL,
    PASS_TELEFONE VARCHAR(15),
    PASS_ENDERECO VARCHAR(100),
    PASS_EMAIL VARCHAR(50)
);

-- Tabela AEROPORTOS
CREATE TABLE AEROPORTOS (
    AEROP_CODIGO INT PRIMARY KEY,
    AEROP_NOME VARCHAR(50) NOT NULL,
    AEROP_LONGITUDE DECIMAL(10,6),
    AEROP_LATITUDE DECIMAL(10,6),
    AEROP_PAIS VARCHAR(30),
    AEROP_CIDADE VARCHAR(50)
);

-- Tabela AERONAVES
CREATE TABLE AERONAVES (
    AERON_PREFIXO VARCHAR(10) PRIMARY KEY,
    AERON_FABRICANTE VARCHAR(50),
    AERON_CAPACIDADE INT,
    AERON_AUTONOMIA DECIMAL(5,2),
    AERON_ANOFABR INT,
    AERON_MODELO VARCHAR(50)
);

-- Tabela FUNCIONARIOS
CREATE TABLE FUNCIONARIOS (
    FUNC_ID INT PRIMARY KEY,
    FUNC_NOME VARCHAR(50) NOT NULL,
    FUNC_DATANASC DATE,
    FUNC_ENDERECO VARCHAR(100),
    FUNC_CPF VARCHAR(11),
    FUNC_FUNCAO VARCHAR(30)
);

-- Tabela VOOS
CREATE TABLE VOOS (
    VOO_ID INT PRIMARY KEY,
    VOO_DATA DATE,
    VOO_HORA TIME,
    VOO_AEROP_ORIGEM INT,
    VOO_AEROP_DESTINO INT,
    VOO_AERONAVE VARCHAR(10),
    FOREIGN KEY (VOO_AEROP_ORIGEM) REFERENCES AEROPORTOS(AEROP_CODIGO),
    FOREIGN KEY (VOO_AEROP_DESTINO) REFERENCES AEROPORTOS(AEROP_CODIGO),
    FOREIGN KEY (VOO_AERONAVE) REFERENCES AERONAVES(AERON_PREFIXO)
);

-- Tabela RESERVAS
CREATE TABLE RESERVAS (
    RESERVA_COD INT PRIMARY KEY,
    VOO_ID INT,
    PASS_CPF VARCHAR(11),
    FOREIGN KEY (VOO_ID) REFERENCES VOOS(VOO_ID),
    FOREIGN KEY (PASS_CPF) REFERENCES PASSAGEIROS(PASS_CPF)
);

-- Tabela OPERACAO_VOO (Relacionamento entre FUNCIONARIOS e VOOS)
CREATE TABLE OPERACAO_VOO (
    VOO_ID INT,
    FUNC_ID INT,
    PRIMARY KEY (VOO_ID, FUNC_ID),
    FOREIGN KEY (VOO_ID) REFERENCES VOOS(VOO_ID),
    FOREIGN KEY (FUNC_ID) REFERENCES FUNCIONARIOS(FUNC_ID)
);

-- Inserts na tabela PASSAGEIROS
INSERT INTO PASSAGEIROS VALUES ('12345678901', 'João Silva', '11999999999', 'Rua A, 123', 'joao@email.com');
INSERT INTO PASSAGEIROS VALUES ('98765432100', 'Maria Santos', '11988888888', 'Rua B, 456', 'maria@email.com');
INSERT INTO PASSAGEIROS VALUES ('45678912345', 'Carlos Oliveira', '11977777777', 'Rua C, 789', 'carlos@email.com');
INSERT INTO PASSAGEIROS VALUES ('78945612300', 'Ana Lima', '11966666666', 'Rua D, 321', 'ana@email.com');
INSERT INTO PASSAGEIROS VALUES ('32165498700', 'Paula Souza', '11955555555', 'Rua E, 654', 'paula@email.com');

-- Updates na tabela PASSAGEIROS
UPDATE PASSAGEIROS SET PASS_TELEFONE = '11911112222' WHERE PASS_CPF = '12345678901';
UPDATE PASSAGEIROS SET PASS_ENDERECO = 'Rua Nova, 987' WHERE PASS_CPF = '98765432100';

-- Delete na tabela PASSAGEIROS
DELETE FROM PASSAGEIROS WHERE PASS_CPF = '32165498700';

-- Inserts na tabela AEROPORTOS
INSERT INTO AEROPORTOS VALUES (1, 'Aeroporto Internacional', 'São Paulo', 'Brasil', -23.6261, -46.6565);
INSERT INTO AEROPORTOS VALUES (2, 'Aeroporto Santos Dumont', 'Rio de Janeiro', 'Brasil', -22.9111, -43.1633);
INSERT INTO AEROPORTOS VALUES (3, 'Aeroporto de Brasília', 'Brasília', 'Brasil', -15.8697, -47.9208);
INSERT INTO AEROPORTOS VALUES (4, 'Aeroporto de Salvador', 'Salvador', 'Brasil', -12.9089, -38.3225);
INSERT INTO AEROPORTOS VALUES (5, 'Aeroporto de Recife', 'Recife', 'Brasil', -8.1266, -34.9238);

-- Updates na tabela AEROPORTOS
UPDATE AEROPORTOS SET AEROP_NOME = 'Aeroporto Guarulhos' WHERE AEROP_CODIGO = 1;
UPDATE AEROPORTOS SET AEROP_CIDADE = 'Fortaleza' WHERE AEROP_CODIGO = 5;

-- Delete na tabela AEROPORTOS
DELETE FROM AEROPORTOS WHERE AEROP_CODIGO = 4;

-- Inserts na tabela AERONAVES
INSERT INTO AERONAVES VALUES ('PR-XYZ', 'Boeing', '737', 200, 5600.00, 2015);
INSERT INTO AERONAVES VALUES ('PR-ABC', 'Airbus', 'A320', 180, 6300.00, 2018);
INSERT INTO AERONAVES VALUES ('PR-DEF', 'Embraer', 'E190', 100, 4200.00, 2012);
INSERT INTO AERONAVES VALUES ('PR-GHI', 'Boeing', '787', 300, 14000.00, 2020);
INSERT INTO AERONAVES VALUES ('PR-JKL', 'Airbus', 'A350', 350, 15500.00, 2019);

-- Updates na tabela AERONAVES
UPDATE AERONAVES SET AERON_CAPACIDADE = 220 WHERE AERON_PREFIXO = 'PR-XYZ';
UPDATE AERONAVES SET AERON_ANOFABR = 2016 WHERE AERON_PREFIXO = 'PR-DEF';

-- Delete na tabela AERONAVES
DELETE FROM AERONAVES WHERE AERON_PREFIXO = 'PR-JKL';

-- Inserts na tabela FUNCIONARIOS
INSERT INTO FUNCIONARIOS (FUNC_NOME, FUNC_CPF, FUNC_ENDERECO, FUNC_DATANASC, FUNC_FUNCAO) 
VALUES ('Pedro Almeida', '11111111111', 'Rua F, 123', '1980-05-15', 'Piloto');
INSERT INTO FUNCIONARIOS (FUNC_NOME, FUNC_CPF, FUNC_ENDERECO, FUNC_DATANASC, FUNC_FUNCAO) 
VALUES ('Mariana Costa', '22222222222', 'Rua G, 456', '1990-11-20', 'Co-piloto');
INSERT INTO FUNCIONARIOS (FUNC_NOME, FUNC_CPF, FUNC_ENDERECO, FUNC_DATANASC, FUNC_FUNCAO) 
VALUES ('Rafael Souza', '33333333333', 'Rua H, 789', '1985-07-10', 'Comissário');
INSERT INTO FUNCIONARIOS (FUNC_NOME, FUNC_CPF, FUNC_ENDERECO, FUNC_DATANASC, FUNC_FUNCAO) 
VALUES ('Fernanda Lima', '44444444444', 'Rua I, 321', '1992-03-08', 'Comissária');
INSERT INTO FUNCIONARIOS (FUNC_NOME, FUNC_CPF, FUNC_ENDERECO, FUNC_DATANASC, FUNC_FUNCAO) 
VALUES ('Lucas Pereira', '55555555555', 'Rua J, 654', '1988-09-14', 'Piloto');

-- Updates na tabela FUNCIONARIOS
UPDATE FUNCIONARIOS SET FUNC_ENDERECO = 'Rua Alterada, 456' WHERE FUNC_CPF = '11111111111';
UPDATE FUNCIONARIOS SET FUNC_FUNCAO = 'Instrutor de Voo' WHERE FUNC_CPF = '55555555555';

-- Delete na tabela FUNCIONARIOS
DELETE FROM FUNCIONARIOS WHERE FUNC_CPF = '44444444444';

-- Inserts na tabela VOOS
INSERT INTO VOOS (VOO_DATA, VOO_HORA, VOO_AEROP_ORIGEM, VOO_AEROP_DESTINO, VOO_AERONAVE) 
VALUES ('2024-01-01', '10:00:00', 1, 2, 'PR-XYZ');
INSERT INTO VOOS (VOO_DATA, VOO_HORA, VOO_AEROP_ORIGEM, VOO_AEROP_DESTINO, VOO_AERONAVE) 
VALUES ('2024-01-01', '12:00:00', 3, 4, 'PR-ABC');
INSERT INTO VOOS (VOO_DATA, VOO_HORA, VOO_AEROP_ORIGEM, VOO_AEROP_DESTINO, VOO_AERONAVE) 
VALUES ('2024-01-01', '14:00:00', 2, 5, 'PR-DEF');
INSERT INTO VOOS (VOO_DATA, VOO_HORA, VOO_AEROP_ORIGEM, VOO_AEROP_DESTINO, VOO_AERONAVE) 
VALUES ('2024-01-01', '16:00:00', 5, 1, 'PR-GHI');
INSERT INTO VOOS (VOO_DATA, VOO_HORA, VOO_AEROP_ORIGEM, VOO_AEROP_DESTINO, VOO_AERONAVE) 
VALUES ('2024-01-01', '18:00:00', 4, 3, 'PR-JKL');

-- Updates na tabela VOOS
UPDATE VOOS SET VOO_HORA = '11:00:00' WHERE VOO_ID = 1;
UPDATE VOOS SET VOO_AEROP_DESTINO = 3 WHERE VOO_ID = 2;

-- Delete na tabela VOOS
DELETE FROM VOOS WHERE VOO_ID = 5;
