CREATE SCHEMA aulasql;
USE aulasql;

CREATE TABLE cidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome  VARCHAR(60),
    uf VARCHAR(2)
);

DROP TABLE cidade;

INSERT INTO cidade (nome, uf) VALUES ('Balneario Camboriu', 'SC');

SELECT * FROM cidade;
