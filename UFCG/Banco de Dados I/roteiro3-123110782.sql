CREATE TABLE farmacias (
    nome VARCHAR(30) NOT NULL,
    sede_ou_filial CHAR(1) NOT NULL CHECK(sede_ou_filial IN ('S','F')),
    farmacia_id SERIAL PRIMARY KEY,
    contato VARCHAR (11),
    bairro VARCHAR(30) NOT NULL,
    cidade TEXT NOT NULL,
    estado CHAR(2),
    gerente_cpf VARCHAR(11) UNIQUE,
    cargo_do_gerente VARCHAR(1) CHECK(cargo_do_gerente IN ('A', 'F')),
    UNIQUE(cidade, bairro),

    EXCLUDE USING gist (sede_ou_filial WITH =) WHERE (sede_ou_filial = 'S')
);

CREATE TABLE funcionarios (
    funcionario_cpf VARCHAR(11) UNIQUE,
    nome VARCHAR(75) NOT NULL,
    cargo CHAR(1) NOT NULL CHECK (cargo IN ('F','V','E','C','A')),
    farmacia_id INTEGER,
    PRIMARY KEY (funcionario_cpf, cargo)
);

CREATE TABLE medicamentos (
    nome VARCHAR(50),
    medicamento_id SERIAL,
    venda_exclusiva BOOLEAN,
    PRIMARY KEY (medicamento_id, venda_exclusiva),
    valor NUMERIC
);

CREATE TABLE vendas (
    medicamento INTEGER NOT NULL,
    valor NUMERIC NOT NULL,
    nota_fiscal SERIAL PRIMARY KEY,
    horario_da_venda TIMESTAMP NOT NULL,
    farmacia_id INTEGER NOT NULL,
    vendedor VARCHAR(11) NOT NULL,
    vendedor_cargo VARCHAR(1) NOT NULL,
    cliente_cpf VARCHAR(11) NOT NULL,
    venda_controlada BOOLEAN
);

CREATE TABLE entregas (
    nota_fiscal INTEGER,
    cliente_cpf VARCHAR(11),
    tipo_do_endereco CHAR(1),
    farmacia_id INTEGER

);

CREATE TABLE clientes (
    nome VARCHAR(75),
    contato VARCHAR(11),
    cliente_cpf VARCHAR(11) PRIMARY KEY,
    data_nascimento DATE NOT NULL,
    farmacia_id INTEGER NOT NULL
);

CREATE TABLE clientes_endereco (
    cliente_cpf VARCHAR(11),
    endereco TEXT,
    cep VARCHAR(8),
    tipo_do_endereco CHAR(1) CHECK(tipo_do_endereco IN ('C','T','O')),
    PRIMARY KEY (cliente_cpf, tipo_do_endereco)
);

ALTER TABLE farmacias ADD CONSTRAINT fk_cargo FOREIGN KEY (gerente_cpf, cargo_do_gerente) REFERENCES funcionarios(funcionario_cpf, cargo);
ALTER TABLE funcionarios ADD CONSTRAINT fk_farmacia FOREIGN KEY (farmacia_id) REFERENCES farmacias(farmacia_id);
ALTER TABLE vendas ADD CONSTRAINT fk_medicamento FOREIGN KEY (medicamento) REFERENCES medicamentos (medicamento_id) ON DELETE RESTRICT;
ALTER TABLE vendas ADD CONSTRAINT fk_farmacia FOREIGN KEY (farmacia_id) REFERENCES farmacias(farmacia_id) ON DELETE RESTRICT;
ALTER TABLE vendas ADD CONSTRAINT fk_venda_controlada FOREIGN KEY (venda_controlada) REFERENCES medicamentos(venda_exclusiva);
ALTER TABLE vendas ADD CONSTRAINT check_venda_remedio_controlado CHECK (venda_controlada = TRUE AND cliente_cpf IS NOT NULL OR venda_controlada = FALSE);
ALTER TABLE vendas ADD CONSTRAINT fk_vendedor FOREIGN KEY (vendedor, vendedor_cargo) REFERENCES funcionarios (funcionario_cpf,cargo) ON DELETE RESTRICT;
ALTER TABLE entregas ADD CONSTRAINT fk_nota_fiscal FOREIGN KEY (nota_fiscal) REFERENCES vendas (nota_fiscal);
ALTER TABLE entregas ADD CONSTRAINT fk_entrega FOREIGN KEY (cliente_cpf, tipo_do_endereco) REFERENCES vendas (cliente_cpf, tipo_do_endereco);
ALTER TABLE entregas ADD CONSTRAINT fk_farmacia_id FOREIGN KEY (farmacia_id) REFERENCES farmacias (farmacia_id);
ALTER TABLE clientes ADD CONSTRAINT fk_farmacia FOREIGN KEY (farmacia_id) REFERENCES farmacias(farmacia_id);
ALTER TABLE clientes ADD CONSTRAINT chk_maioridade CHECK (DATE_PART('year', AGE(data_nascimento)) >= 18);
ALTER TABLE clientes_endereco ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_cpf) REFERENCES clientes (cliente_cpf);
CREATE TYPE estado AS ENUM ('AL', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE');
ALTER TABLE vendas ADD CONSTRAINT check_venda_funcionario_farmacia CHECK (vendedor_cargo = 'V');