-- De acordo com o esquema apresentado abaixo, efetue as seguintes atividades:
-- 1. Execute o código para a criação das tabelas e do esquema. Linhas 4 a 72.
-- 2. Execute o código para popular as tabelas. Linhas 74 a 178.
-- 3. Efetua a criação de código SQL para cada um dos exercícios propostos a partir da linha

-- Criação do esquema
CREATE SCHEMA mae_bebe;
USE mae_bebe;
-- CRIAÇÃO DAS TABELAS
CREATE TABLE estado (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    uf VARCHAR(2) UNIQUE
);

CREATE TABLE cidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_estado INT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado (id)
);

CREATE TABLE endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_cidade INT,
    logradouro VARCHAR(100),
    numero INT NOT NULL,
    bairro VARCHAR(50),
    cep VARCHAR(9) NOT NULL,
    complemento VARCHAR(100),
    ponto_referencia VARCHAR(100),
    CONSTRAINT fk_endereco_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id)
);

CREATE TABLE mae (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_endereco INT,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATETIME NOT NULL,
    CONSTRAINT fk_mae_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id)
);

CREATE TABLE telefone (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_mae INT,
    numero VARCHAR(15) NOT NULL,
    tipo TINYINT,
    CONSTRAINT fk_telefone_mae FOREIGN KEY (id_mae) REFERENCES mae (id)
);

CREATE TABLE especialidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE medico (
	crm INT PRIMARY KEY NOT NULL,
    id_especialidade INT,
    nome VARCHAR(150) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    CONSTRAINT fk_medico_especialidade FOREIGN KEY (id_especialidade) REFERENCES especialidade (id)
);

CREATE TABLE bebe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    crm_medico INT NOT NULL,
    id_mae INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATETIME NOT NULL,
    peso DECIMAL(5,3) NOT NULL,
    altura TINYINT,
    CONSTRAINT fk_bebe_medico FOREIGN KEY (crm_medico) REFERENCES medico (crm),
    CONSTRAINT fk_bebe_mae FOREIGN KEY (id_mae) REFERENCES mae (id)
);

-- INSERÇÃO DE DADOS
-- Popular a tabela estado
INSERT INTO estado (nome, uf) VALUES
    ('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Minas Gerais', 'MG'),
    ('Espírito Santo', 'ES'),
    ('Paraná', 'PR'),
    ('Santa Catarina', 'SC'),
    ('Rio Grande do Sul', 'RS'),
    ('Bahia', 'BA'),
    ('Pernambuco', 'PE'),
    ('Ceará', 'CE');

-- Popular a tabela cidade
INSERT INTO cidade (id_estado, nome) VALUES
    (1, 'São Paulo'),
    (1, 'Campinas'),
    (2, 'Rio de Janeiro'),
    (2, 'Niterói'),
    (3, 'Belo Horizonte'),
    (3, 'Uberlândia'),
    (4, 'Vitória'),
    (4, 'Vila Velha'),
    (5, 'Curitiba'),
    (5, 'Londrina');

-- Popular a tabela endereco
INSERT INTO endereco (id_cidade, logradouro, numero, bairro, cep, complemento, ponto_referencia) VALUES
    (1, 'Avenida Paulista', 1000, 'Bela Vista', '01310-000', 'apto 101', 'Próximo ao MASP'),
    (2, 'Rua José Paulino', 200, 'Centro', '13010-010', 'Casa', 'Em frente à padaria'),
    (3, 'Avenida Atlântica', 500, 'Copacabana', '22021-000', 'Bloco A', 'Vista para o mar'),
    (4, 'Rua da Conceição', 300, 'Centro', '24020-090', 'Loja 1', 'Perto da praça'),
    (5, 'Avenida Afonso Pena', 400, 'Centro', '30130-000', 'Sala 2', 'Esquina com Rua da Bahia'),
    (6, 'Rua Duque de Caxias', 500, 'Jardim Patrícia', '38400-100', 'Casa 2', 'Próximo ao supermercado'),
    (7, 'Avenida Beira Mar', 600, 'Praia do Canto', '29055-200', 'Apto 302', 'Vista para a baía'),
    (8, 'Rua Sete de Setembro', 700, 'Praia da Costa', '29101-900', 'Casa', 'Perto do shopping'),
    (9, 'Rua XV de Novembro', 800, 'Centro', '80020-000', 'Prédio histórico', 'Em frente à Catedral'),
    (10, 'Rua Paranaguá', 900, 'Centro', '86010-140', 'Casa', 'Próximo ao colégio');

-- Popular a tabela mae
INSERT INTO mae (id_endereco, nome, data_nascimento) VALUES
    (1, 'Maria da Silva', '1990-01-01'),
    (2, 'Ana Paula Oliveira', '1985-05-10'),
    (3, 'Juliana Santos', '1992-08-20'),
    (4, 'Carolina Ferreira', '1988-12-05'),
    (5, 'Fernanda Lima', '1995-03-15'),
    (6, 'Patricia Rodrigues', '1987-07-25'),
    (7, 'Amanda Souza', '1991-11-30'),
    (8, 'Luciana Costa', '1989-02-18'),
    (9, 'Vanessa Pereira', '1993-06-08'),
    (10, 'Camila Almeida', '1986-09-22');

-- Popular a tabela telefone
INSERT INTO telefone (id_mae, numero, tipo) VALUES
    (1, '(11) 98765-4321', 1),
    (2, '(19) 91234-5678', 2),
    (3, '(21) 99876-5432', 1),
    (4, '(21) 91234-5678', 2),
    (5, '(31) 98765-4321', 1),
    (6, '(34) 91234-5678', 2),
    (7, '(27) 99876-5432', 1),
    (8, '(27) 91234-5678', 2),
    (9, '(41) 98765-4321', 1),
    (10, '(43) 91234-5678', 2);

-- Popular a tabela especialidade
INSERT INTO especialidade (nome) VALUES
    ('Pediatria'),
    ('Cardiologia'),
    ('Oncologia'),
    ('Neurologia'),
    ('Pneumologia'),
    ('Ortopedia'),
    ('Endocrinologia'),
    ('Gastroenterologia'),
    ('Dermatologia'),
    ('Oftalmologia');

-- Popular a tabela medico
INSERT INTO medico (crm, id_especialidade, nome, celular) VALUES
    (12345, 1, 'Dr. João Silva', '(11) 98765-4321'),
    (54321, 2, 'Dra. Maria Oliveira', '(19) 91234-5678'),
    (67890, 3, 'Dr. Pedro Santos', '(21) 99876-5432'),
    (98765, 4, 'Dra. Ana Ferreira', '(21) 91234-5678'),
    (43210, 5, 'Dr. Luiz Lima', '(31) 98765-4321'),
    (87654, 6, 'Dra. Carla Rodrigues', '(34) 91234-5678'),
    (32109, 7, 'Dr. Marcos Souza', '(27) 99876-5432'),
    (76543, 8, 'Dra. Fernanda Costa', '(27) 91234-5678'),
    (21098, 9, 'Dr. Ricardo Pereira', '(41) 98765-4321'),
    (65432, 10, 'Dra. Paula Almeida', '(43) 91234-5678');

-- Popular a tabela bebe
INSERT INTO bebe (crm_medico, id_mae, nome, data_nascimento, peso, altura) VALUES
    (12345, 1, 'Joãozinho', '2022-01-01', 3.5, 50),
    (54321, 2, 'Mariazinha', '2021-05-10', 4.2, 55),
    (67890, 3, 'Pedrinho', '2023-08-20', 3.8, 48),
    (98765, 4, 'Aninha', '2020-12-05', 4.5, 60),
    (43210, 5, 'Luizinho', '2022-03-15', 3.9, 52),
    (87654, 6, 'Carlinha', '2021-07-25', 4.1, 58),
    (32109, 7, 'Marquinhos', '2023-11-30', 3.7, 49),
    (76543, 8, 'Fernandinha', '2020-02-18', 4.3, 56),
    (21098, 9, 'Ricardinho', '2022-06-08', 4.0, 53),
    (65432, 10, 'Paulinha', '2021-09-22', 2.6, 51);
    
SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM endereco;
SELECT * FROM mae;
SELECT * FROM telefone;
SELECT * FROM especialidade;
SELECT * FROM medico;


-- EXERCÍCIOS PROPOSTOS SELECT

-- 1. Listar o nome e a data de nascimento de todas as mães:
SELECT nome, data_nascimento FROM mae;

-- 2. Listar o CRM e o nome de todos os médicos:
SELECT crm, nome FROM medico;

-- 3. Listar o nome e a data de nascimento de todos os bebês:
SELECT nome, data_nascimento FROM bebe;

-- 4. Listar os bebês com peso maior que 3kg:
SELECT * FROM bebe WHERE peso > 3;

-- 5. Listar os estados em ordem alfabética:
SELECT * FROM estado ORDER BY nome;

-- 6. Listar as cidades em ordem alfabética decrescente:
SELECT * FROM cidade ORDER BY nome DESC;

-- 7. Listar os bebês em ordem decrescente de peso:
SELECT * FROM bebe ORDER BY peso DESC;

-- 8. Listar o nome de todas as cidades do estado de São Paulo (SP):
SELECT nome FROM cidade WHERE id_estado = (SELECT id FROM estado WHERE uf = 'SP');

-- 9. Listar o nome de todas as mães e seus respectivos números de telefone:
SELECT mae.nome, telefone.numero FROM mae JOIN telefone ON mae.id = telefone.id_mae;

-- 10. Contar quantas mães existem em cada cidade:
SELECT cidade.nome, COUNT(mae.id) FROM mae JOIN endereco ON mae.id_endereco = endereco.id JOIN cidade ON endereco.id_cidade = cidade.id GROUP BY cidade.nome;

-- 11. Listar os nomes dos médicos e suas especialidades:
SELECT medico.nome, especialidade.nome FROM medico JOIN especialidade ON medico.id_especialidade = especialidade.id;

-- 12. Listar os bebês nascidos no ano de 2023, ordenados por data de nascimento (do mais recente para o mais antigo):
SELECT * FROM bebe WHERE YEAR(data_nascimento) = 2023 ORDER BY data_nascimento DESC;

-- 13. Calcular a média de altura dos bebês:
SELECT AVG(altura) FROM bebe;

-- 14. Listar o nome de todos os bebês, juntamente com o nome da mãe e o nome do médico responsável pelo parto:
SELECT bebe.nome, mae.nome, medico.nome FROM bebe JOIN mae ON bebe.id_mae = mae.id JOIN medico ON bebe.crm_medico = medico.crm;

-- 15. Unir os nomes de todas as mães e médicos em uma única lista, removendo duplicatas:
SELECT DISTINCT nome FROM (SELECT nome FROM mae UNION SELECT nome FROM medico);

-- 16. Listar os 5 bebês mais pesados, juntamente com o nome da mãe e a especialidade do médico:
SELECT bebe.nome, mae.nome, especialidade.nome FROM bebe JOIN mae ON bebe.id_mae = mae.id JOIN medico ON bebe.crm_medico = medico.crm JOIN especialidade ON medico.id_especialidade = especialidade.id ORDER BY bebe.peso DESC LIMIT 5;

-- 17. Listar os estados e a quantidade de cidades em cada estado, ordenando em ordem decrescente pela quantidade de cidades:
SELECT estado.nome, COUNT(cidade.id) FROM estado JOIN cidade ON estado.id = cidade.id_estado GROUP BY estado.nome ORDER BY COUNT(cidade.id) DESC;

-- 18. Selecione todos os nomes das cidades e seus respectivos estados.
SELECT cidade.nome, estado.nome FROM cidade JOIN estado ON cidade.id_estado = estado.id;

-- 19. Liste todos os médicos e suas especialidades ordenados alfabeticamente pelo nome do médico.
SELECT medico.nome, especialidade.nome FROM medico JOIN especialidade ON medico.id_especialidade = especialidade.id ORDER BY medico.nome;

-- 20. Selecione o nome do médico, nome da mãe e nome do bebê para bebês que nasceram em uma cidade com "São" no nome.
SELECT medico.nome, mae.nome, bebe.nome FROM bebe JOIN mae ON bebe.id_mae = mae.id JOIN medico ON bebe.crm_medico = medico.crm JOIN endereco ON mae.id_endereco = endereco.id JOIN cidade ON endereco.id_cidade = cidade.id WHERE cidade.nome LIKE '%São%';

-- 21. Liste todas as especialidades médicas e a quantidade de médicos associados a cada especialidade.
SELECT especialidade.nome, COUNT(medico.crm) FROM especialidade JOIN medico ON especialidade.id = medico.id_especialidade GROUP BY especialidade.nome;

-- 22.Liste o nome do médico e o número total de bebês nascidos em cada ano, para cada médico.
SELECT medico.nome, YEAR(bebe.data_nascimento), COUNT(*) FROM bebe JOIN medico ON bebe.crm_medico = medico.crm GROUP BY medico.nome, YEAR(bebe.data_nascimento);
	
-- EXERCÍCIO PROPOSTOS PARA ALTER TABLE
-- Utilize o código abaixo para verificar as alterações:
-- DESCRIBE nome_da_tabela;

-- 1. Adicione uma coluna email do tipo VARCHAR(100) à tabela mae.
ALTER TABLE mae ADD email VARCHAR(100);

-- 2. Adicione uma coluna data_cadastro do tipo DATE à tabela medico.
ALTER TABLE medico ADD data_cadastro DATE;

-- 3. Adicione uma coluna observacao do tipo TEXT à tabela bebe.
ALTER TABLE bebe ADD observacao TEXT;

-- 4. Altere o tamanho da coluna nome da tabela estado para VARCHAR(100).
ALTER TABLE estado MODIFY nome VARCHAR(100);

-- 5. Defina a coluna celular na tabela medico como NOT NULL.
ALTER TABLE medico MODIFY celular VARCHAR(15) NOT NULL;

-- 6. Renomeie a coluna ponto_referencia na tabela endereco para referencia.
ALTER TABLE endereco CHANGE ponto_referencia referencia VARCHAR(255);

-- 7. Renomeie a coluna altura na tabela bebe para comprimento (em centímetros).
ALTER TABLE bebe CHANGE altura comprimento DECIMAL(5,2);

-- 8. Remova a coluna complemento da tabela endereco.
ALTER TABLE endereco DROP COLUMN complemento;

-- 9. Adicione uma restrição UNIQUE à coluna email da tabela mae.
ALTER TABLE mae ADD UNIQUE (email);
