CREATE SCHEMA aulasql;
USE aulasql;

CREATE TABLE Estado (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome  VARCHAR(50),
    uf VARCHAR(2)
);

CREATE TABLE Cidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_estado INT,
    nome VARCHAR(50),
    
    FOREIGN KEY(id_estado) REFERENCES Estado
);


CREATE TABLE Endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_cidade INT NOT NULL,
    logradouro VARCHAR(100),
    numero INT,
    bairro VARCHAR(50),
    cep VARCHAR(9),
    complemento VARCHAR(100),
    ponto_referencia VARCHAR(100),
    
    FOREIGN KEY (id_cidade) REFERENCES Cidade
);

CREATE TABLE Mae (
	id INT PRIMARY KEY AUTO_INCREMENT,
    endereco_id INT,
    nome VARCHAR(150),
    data_nascimento DATETIME,
    
    FOREIGN KEY (endereco_id) REFERENCES Endereco
);

CREATE TABLE Telefone_Mae (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_mae INT,
    numero VARCHAR(15),
    tipo TINYINT(1),
    
    FOREIGN KEY (id_mae) REFERENCES Cidade
);

CREATE TABLE Especialidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE Medico (
	crm INT PRIMARY KEY AUTO_INCREMENT,
    id_especialidade INT,
    nome VARCHAR(150),
    celular VARCHAR(15),
    
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade
);

CREATE TABLE Bebe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    crm_medico INT,
    id_mae INT,
    nome VARCHAR(150),
    data_nascimento DATETIME,
    peso DECIMAL(5,3),
    altura TINYINT,
    
    FOREIGN KEY (crm_medico) REFERENCES Medico,
    FOREIGN KEY (id_mae) REFERENCES Mae,
)
