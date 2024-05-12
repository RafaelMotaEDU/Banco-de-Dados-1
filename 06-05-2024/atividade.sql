DROP SCHEMA IF EXISTS aulasql;
CREATE SCHEMA aulasql;
USE aulasql;

CREATE TABLE Estado (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome  VARCHAR(50),
    uf VARCHAR(2)
);

INSERT INTO Estado (nome, uf) VALUES ('São Paulo', 'SP');
INSERT INTO Estado (nome, uf) VALUES ('Rio de Janeiro', 'RJ');
INSERT INTO Estado (nome, uf) VALUES ('Minas Gerais', 'MG');

CREATE TABLE Cidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_estado INT,
    nome VARCHAR(50),
    FOREIGN KEY (id_estado) REFERENCES Estado(id)
);

INSERT INTO Cidade (id_estado, nome) VALUES (1, 'São Paulo');
INSERT INTO Cidade (id_estado, nome) VALUES (1, 'Campinas');
INSERT INTO Cidade (id_estado, nome) VALUES (3, 'Rio de Janeiro');

CREATE TABLE Endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_cidade INT,
    logradouro VARCHAR(100),
    numero INT,
    bairro VARCHAR(50),
    cep VARCHAR(9),
    complemento VARCHAR(100),
    ponto_referencia VARCHAR(100),
    FOREIGN KEY (id_cidade) REFERENCES Cidade(id)
);

INSERT INTO Endereco (id_cidade, logradouro, numero, bairro, cep, complemento, ponto_referencia) VALUES (1, 'Av. Paulista', 1000, 'Bela Vista', '01310-100', 'Apto 501', 'Próximo ao MASP');
INSERT INTO Endereco (id_cidade, logradouro, numero, bairro, cep, complemento, ponto_referencia) VALUES (2, 'Rua das Flores', 500, 'Centro', '13010-200', 'Casa 2', 'Perto do parque');
INSERT INTO Endereco (id_cidade, logradouro, numero, bairro, cep, complemento, ponto_referencia) VALUES (3, 'Av. Atlântica', 700, 'Copacabana', '22010-010', 'Apto 1001', 'Em frente à praia');

CREATE TABLE Mae (
	id INT PRIMARY KEY AUTO_INCREMENT,
    endereco_id INT,
    nome VARCHAR(150),
    data_nascimento DATETIME,
    FOREIGN KEY (endereco_id) REFERENCES Endereco(id)
);

INSERT INTO Mae (endereco_id, nome, data_nascimento) VALUES (1, 'Maria da Silva', '1980-05-25 10:30:00');
INSERT INTO Mae (endereco_id, nome, data_nascimento) VALUES (3, 'Ana Souza', '1992-08-12 14:15:00');

CREATE TABLE Telefone_Mae (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_mae INT,
    numero VARCHAR(15),
    tipo TINYINT(1),
    FOREIGN KEY (id_mae) REFERENCES Mae(id)
);

INSERT INTO Telefone_Mae (id_mae, numero, tipo) VALUES (1, '11987654321', 1);
INSERT INTO Telefone_Mae (id_mae, numero, tipo) VALUES (2, '21987654321', 1);

CREATE TABLE Especialidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

INSERT INTO Especialidade (nome) VALUES ('Pediatria');
INSERT INTO Especialidade (nome) VALUES ('Ginecologia');

CREATE TABLE Medico (
	crm INT PRIMARY KEY AUTO_INCREMENT,
    id_especialidade INT,
    nome VARCHAR(150),
    celular VARCHAR(15),
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id)
);

INSERT INTO Medico (id_especialidade, nome, celular) VALUES (1, 'Dr. João Santos', '11987654321');
INSERT INTO Medico (id_especialidade, nome, celular) VALUES (2, 'Dra. Maria Oliveira', '21987654321');

CREATE TABLE Bebe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    crm_medico INT,
    id_mae INT,
    nome VARCHAR(150),
    data_nascimento DATETIME,
    peso DECIMAL(5,3),
    altura TINYINT,
    FOREIGN KEY (crm_medico) REFERENCES Medico(crm),
    FOREIGN KEY (id_mae) REFERENCES Mae(id)
);

INSERT INTO Bebe (crm_medico, id_mae, nome, data_nascimento, peso, altura) VALUES (1, 1, 'Joãozinho da Silva', '2024-01-15 08:45:00', 3.250, 50);
INSERT INTO Bebe (crm_medico, id_mae, nome, data_nascimento, peso, altura) VALUES (2, 2, 'Marianinha Souza', '2024-03-20 11:20:00', 3.100, 48);
