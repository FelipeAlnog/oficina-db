CREATE DATABASE oficina_db;

USE oficina_db;

-- Tabela Cliente
CREATE TABLE Cliente (
  cliente_id INT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(15),
  email VARCHAR(100)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
  veiculo_id INT PRIMARY KEY,
  cliente_id INT,
  modelo VARCHAR(50),
  ano INT,
  placa VARCHAR(10),
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela Serviço
CREATE TABLE Servico (
  servico_id INT PRIMARY KEY,
  descricao VARCHAR(200),
  valor DECIMAL(10, 2)
);

-- Tabela Funcionário
CREATE TABLE Funcionario (
  funcionario_id INT PRIMARY KEY,
  nome VARCHAR(100),
  cargo VARCHAR(50),
  salario DECIMAL(10, 2)
);

-- Tabela Agendamento
CREATE TABLE Agendamento (
  agendamento_id INT PRIMARY KEY,
  cliente_id INT,
  veiculo_id INT,
  servico_id INT,
  funcionario_id INT,
  data DATE,
  hora TIME,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
  FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
  FOREIGN KEY (servico_id) REFERENCES Servico(servico_id),
  FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id)
);

-- Tabela Peça
CREATE TABLE Peca (
  peca_id INT PRIMARY KEY,
  descricao VARCHAR(200),
  valor DECIMAL(10, 2),
  fornecedor_id INT,
  FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
  fornecedor_id INT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(15),
  endereco VARCHAR(200)
);

USE oficina_db;

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (cliente_id, nome, telefone, email)
VALUES
  (1, 'João Silva', '(11) 99999-1111', 'joao.silva@example.com'),
  (2, 'Maria Santos', '(21) 98888-2222', 'maria.santos@example.com'),
  (3, 'Pedro Oliveira', '(31) 97777-3333', 'pedro.oliveira@example.com');

-- Inserção de dados na tabela Veículo
INSERT INTO Veiculo (veiculo_id, cliente_id, modelo, ano, placa)
VALUES
  (1, 1, 'Fiat Uno', 2018, 'ABC-1234'),
  (2, 2, 'Volkswagen Gol', 2020, 'XYZ-5678'),
  (3, 3, 'Ford Fiesta', 2019, 'DEF-4321');

-- Inserção de dados na tabela Serviço
INSERT INTO Servico (servico_id, descricao, valor)
VALUES
  (1, 'Troca de óleo', 100.00),
  (2, 'Reparo na suspensão', 250.00),
  (3, 'Revisão completa', 350.00);

-- Inserção de dados na tabela Funcionário
INSERT INTO Funcionario (funcionario_id, nome, cargo, salario)
VALUES
  (1, 'Carlos Oliveira', 'Mecânico', 3000.00),
  (2, 'Ana Rodrigues', 'Atendente', 2000.00),
  (3, 'Lucas Santos', 'Gerente', 4000.00);

-- Inserção de dados na tabela Agendamento
INSERT INTO Agendamento (agendamento_id, cliente_id, veiculo_id, servico_id, funcionario_id, data, hora)
VALUES
  (1, 1, 1, 1, 1, '2023-07-21', '09:00:00'),
  (2, 2, 2, 2, 2, '2023-07-22', '14:30:00'),
  (3, 3, 3, 3, 3, '2023-07-23', '11:00:00');

-- Inserção de dados na tabela Peça
INSERT INTO Peca (peca_id, descricao, valor, fornecedor_id)
VALUES
  (1, 'Vela de ignição', 30.00, 1),
  (2, 'Pastilhas de freio', 120.00, 2),
  (3, 'Filtro de óleo', 25.00, 3);

-- Inserção de dados na tabela Fornecedor
INSERT INTO Fornecedor (fornecedor_id, nome, telefone, endereco)
VALUES
  (1, 'Fornecedor A', '(11) 11111-1111', 'Rua A, 123'),
  (2, 'Fornecedor B', '(22) 22222-2222', 'Avenida B, 456'),
  (3, 'Fornecedor C', '(33) 33333-3333', 'Estrada C, 789');
