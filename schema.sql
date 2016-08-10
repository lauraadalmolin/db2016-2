-- palavras reservadas do banco sempre maiúsculo
-- palavras do usuário em snake_case minúsculo
-- tabelas sempre no plural
-- classe sempre no singular
CREATE TABLE contatos (
	id        SERIAL      NOT NULL PRIMARY KEY,
	nome      VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(30)     NULL
);

-- 53323388997 ou 
-- (53) 3233-88997 

CREATE TABLE telefones (
	id_contato INTEGER NOT NULL
			   REFERENCES contatos(id)
			   ON DELETE CASCADE,
	ddd    VARCHAR(2)     NULL,
	numero VARCHAR(9) NOT NULL	
);
-- 
INSERT INTO contatos VALUES (
	DEFAULT,
	'Ogro',
	'Betito'
); -- 1

INSERT INTO contatos (nome, sobrenome) VALUES (
	'Igor',
	'Bira'
); --2

-- select all
SELECT * FROM contatos;

-- select "econômico": só a coluna que precisa
-- e só uma página de registros
SELECT sobrenome
FROM contatos LIMIT 1 OFFSET 1;
-- OFFSET: pula o número de linhas estipuladas (no caso 1).

-- ver os primeiros 5 contatos
SELECT sobrenome
FROM contatos LIMIT 5;

-- proximos 5;
SELECT sobrenome
FROM contatos LIMIT 5 OFFSET 5;

-- 
UPDATE contatos
SET nome = 'Rafael'
WHERE id = 1;

--
INSERT INTO contatos (nome)
VALUES ('temp');

--
DELETE FROM contatos
WHERE nome  = 'temp';

--
INSERT INTO telefones VALUES (
	(SELECT id FROM contatos WHERE sobrenome = 'Betito'),
	'53',
	'8899776655'
);

INSERT INTO telefones VALUES (
	(SELECT id FROM contatos WHERE sobrenome = 'Betito'),
	'53',
	'32334455'
);

INSERT INTO telefones (id_contato, numero) VALUES (
	(SELECT id FROM contatos WHERE nome = 'Igor'),
	'12345678'
);

INSERT INTO telefones (id_contato, numero) VALUES (
	(SELECT id FROM contatos WHERE nome = 'Igor'),
	'34567890'
);

SELECT c.nome, t.numero 
FROM contatos c JOIN telefones t 
ON c.id = t.id_contato;

SELECT c.nome, t.numero 
FROM contatos c NATURAL JOIN telefones t;






























