-- Questão 1
CREATE TABLE tarefas (
    id INTEGER,
    descricao TEXT,
    cpf VARCHAR(11),
    numero_qualquer INTEGER,
    letra_qualquer CHAR(1),
    CHECK (LENGTH(letra_qualquer) = 1),
    CHECK (LENGTH(cpf) = 11)
);

INSERT INTO tarefas VALUES (2147483646, 'limpar chão do corredor central', '98765432111', 0, 'F');
INSERT INTO tarefas VALUES (2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'F');
INSERT INTO tarefas VALUES (null, null, null, null, null);
INSERT INTO tarefas VALUES (2147483644, 'limpar chão do corredor superior', '987654323211', 0, 'F');
INSERT INTO tarefas VALUES (2147483643, 'limpar chão do corredor superior', '98765432321', 0, 'FF');


-- Questão 2
ALTER TABLE tarefas ALTER COLUMN id SET DATA TYPE BIGINT;

-- Questão 3
ALTER TABLE tarefas ALTER COLUMN numero_qualquer SET DATA TYPE SMALLINT;

-- Questão 4
ALTER TABLE tarefas RENAME COLUMN cpf TO func_resp_cpf;
ALTER TABLE tarefas RENAME COLUMN numero_qualquer TO prioridade;
ALTER TABLE tarefas RENAME COLUMN letra_qualquer TO status;

ALTER TABLE tarefas ALTER COLUMN id SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN func_resp_cpf SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN prioridade SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN status SET NOT NULL;

DELETE FROM tarefas WHERE status IS NULL;

-- Questão 5
ALTER TABLE tarefas ADD CONSTRAINT tarefa_unica UNIQUE (id);

-- Questão 6
UPDATE tarefas SET status = 'P' WHERE status ='A';
UPDATE tarefas SET status = 'E' WHERE status ='R';
UPDATE tarefas SET status = 'C' WHERE status ='F';
ALTER TABLE tarefas ADD CONSTRAINT check_status CHECK (status IN ('P', 'E', 'C'));

-- Questão 7
ALTER TABLE tarefas ADD CONSTRAINT check_prioridade CHECK (prioridade IN (0, 1, 2, 3, 4, 5));

-- Questão 8
CREATE TABLE funcionario (
    superior_cpf VARCHAR(11) ,
    cpf VARCHAR(11) PRIMARY KEY,
    funcao VARCHAR(20) NOT NULL,
    nivel CHAR(1) NOT NULL,
    nome VARCHAR(300) NOT NULL,
    data_nasc DATE NOT NULL,

    CONSTRAINT fk_superior FOREIGN KEY (superior_cpf) REFERENCES funcionario (cpf),
    CONSTRAINT check_func CHECK (funcao IN ('LIMPEZA', 'SUP_LIMPEZA')),
    CONSTRAINT check_nivel CHECK (nivel IN ('J', 'P', 'S')),
    CONSTRAINT check_superior CHECK (
        (funcao = 'LIMPEZA' AND superior_cpf IS NOT NULL)
        OR
        (funcao = 'SUP_LIMPEZA' AND superior_cpf IS NULL)
    )
);

-- Questão 9:
INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000001', 'Carlos Silva', '1995-02-15', 'SUP_LIMPEZA', 'J', NULL);

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000002', 'Ana Costa', '1990-07-23', 'LIMPEZA', 'P', '10000000001');

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000003', 'José Souza', '1985-05-30', 'SUP_LIMPEZA', 'S', NULL);

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000004', 'Maria Oliveira', '1988-09-17', 'SUP_LIMPEZA', 'P', NULL);

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000005', 'Pedro Lima', '1997-12-03', 'LIMPEZA', 'J', '10000000004');

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000006', 'Luiza Martins', '1990-04-12', 'LIMPEZA', 'S', '10000000003');

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000007', 'Ricardo Almeida', '1992-11-05', 'LIMPEZA', 'P', '10000000001');

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000008', 'Fernanda Ribeiro', '1996-01-14', 'SUP_LIMPEZA', 'J', NULL);

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000009', 'Rogério Silva', '1987-08-25', 'LIMPEZA', 'S', '10000000003');

INSERT INTO funcionario (cpf, nome, data_nasc, funcao, nivel, superior_cpf) 
VALUES ('10000000010', 'Carla Pereira', '1994-06-22', 'LIMPEZA', 'P', '10000000002');


-- Questão 10:
ALTER TABLE tarefas
ADD COLUMN funcionario_cpf VARCHAR(11);

ALTER TABLE tarefas
ADD CONSTRAINT fk_funcionario
FOREIGN KEY (funcionario_cpf) REFERENCES funcionario (cpf);

-- Questão 11:
ALTER TABLE tarefas ADD CONSTRAINT check_func_responsavel CHECK (
    (status != 'P' AND  func_resp_cpf IS NOT NULL)
    OR
    (status = 'P' AND func_resp_cpf IS NULL)
    OR
    (status = 'P' AND func_resp_cpf IS NOT NULL)
);

ALTER TABLE tarefas DROP CONSTRAINT fk_funcionario;
ALTER TABLE tarefas ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_cpf) REFERENCES funcionario (cpf) ON DELETE SET NULL;
