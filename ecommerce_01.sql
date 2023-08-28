-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 28/08/2023 às 21:26
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce_01`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `primeiro_nome` varchar(20) NOT NULL,
  `nome_meio` char(2) DEFAULT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `cpf` char(11) NOT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `id_contato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `primeiro_nome`, `nome_meio`, `sobrenome`, `cpf`, `cnpj`, `id_contato`) VALUES
(1, 'Maria Helena ', 'M.', 'Rego', '45569122290', NULL, 1),
(2, 'Glauco', 'C.', 'Carvel', '87684557203', NULL, 2),
(3, 'Eldimar ', 'V.', 'Mesquita', '78265765711', NULL, 3),
(4, 'Deyse', 'F.', 'Amancio', '96553281475', NULL, 4),
(5, 'Maria Eliza', 'D.', 'Linhares', '78975712389', NULL, 5);

--
-- Acionadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `check_cnpj_cpf_before_insert` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    IF NEW.cnpj IS NOT NULL AND NEW.cpf IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é permitido cadastrar CNPJ e CPF ao mesmo tempo.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_vendedor`
--

CREATE TABLE `cliente_vendedor` (
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor_terceiro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente_vendedor`
--

INSERT INTO `cliente_vendedor` (`id_cliente`, `id_vendedor_terceiro`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `id_contato` int(11) NOT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `celular` char(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contato`
--

INSERT INTO `contato` (`id_contato`, `id_endereco`, `celular`, `email`) VALUES
(1, 1, '95993757241', 'maria.rego@geradornv.com.br'),
(2, 2, '96972886861', 'glauco.carvel@geradornv.com.br'),
(3, 3, '27976259984', 'eldimar.mesquita@geradornv.com.br'),
(4, 4, '82968177142', 'deyse.amancio@geradornv.com.br'),
(5, 5, '86979182894', 'maria.linhares@geradornv.com.br'),
(6, 6, '4726316112', 'industria.duarte@geradornv.com.br'),
(7, 7, '61991386654', 'farmacia.simoes@geradornv.com.br'),
(8, 8, '69993435740', 'varejo.rabelo@geradornv.com.br'),
(9, 9, '21998876635', 'esportes.camelo@geradornv.com.br'),
(10, 10, '87993433421', 'comercio.texeira@geradornv.com.br'),
(11, 11, '83972130863', 'varejo.firmino@geradornv.com.br'),
(12, 12, '61975423287', 'ferragens.figueiras@geradornv.com.br'),
(13, 13, '51996044294', 'atacado.costa@geradornv.com.br'),
(14, 14, '67988510898', 'bar.quintela@geradornv.com.br'),
(15, 15, '49972072627', 'ferragens.boelho@geradornv.com.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `cep` char(8) DEFAULT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `uf`) VALUES
(1, '69308230', 'Rua Madre Silvestre', '50', '', 'Treze de Setembro', 'Boa Vista', 'RR'),
(2, '68903881', 'Alameda Meridional do Norte', '20', '', 'Araxá', 'Macapá', 'PA'),
(3, '29148550', 'Rua Maia', '50', '', 'Mucuri', 'Cariacica', 'ES'),
(4, '57305060', 'Rua Mané Garrincha', '200', '', 'Manuel Teles', 'Arapiraca', 'AL'),
(5, '64207400', 'Quadra M', '500', '', 'Planalto de Monteserra The', 'Parnaíba', 'PI'),
(6, '88139168', 'Rua Itauna', '10', 'Praia do Sonho ', '(Ens Brito)', 'Palhoça', 'SC'),
(7, '73310247', 'Área SHD Bloco O', 'S/N', 'Setor de Hotéis e Diversões', 'Planaltina', 'Brasília', 'DF'),
(8, '76873524', 'Rua das Orquídeas', '255', '', 'Setor 04', 'Ariquemes', 'RO'),
(9, '25211206', 'Rua Projetada B', '11', '', 'Vila Urussaí', 'Duque de Caxias', 'RJ'),
(10, '52090037', '2ª Travessa Antônio Carneiro', '37', '', 'Nova Descoberta', 'Recife', 'PE'),
(11, '58010827', 'Galeria Jardim', '320', '', 'Centro', 'João Pessoa', 'PB'),
(12, '71575655', 'Quadra Quadra 41', '1122', 'Conjunto L', 'Paranoá', 'Brasília', 'DF'),
(13, '93819876', 'Rua Jorge Brasiliano Silveira', '100', '', 'São Jacó', 'Sapiranga', 'RS'),
(14, '79108042', 'Rua Poconé Vila ', '20', '', 'Entroncamento', 'Campo Grande', 'MS'),
(15, '88357167', 'Rua PR - 012', '15', '', 'Ponta Russa', 'Brusque', 'SC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrega`
--

CREATE TABLE `entrega` (
  `id_rastreamento` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `status_pedido` enum('Recebido','Separado','Enviado','Entregue') DEFAULT 'Recebido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entrega`
--

INSERT INTO `entrega` (`id_rastreamento`, `id_pedido`, `status_pedido`) VALUES
(1, 1, 'Recebido'),
(2, 2, 'Separado'),
(3, 1, 'Enviado'),
(4, 1, 'Recebido'),
(5, 1, 'Entregue');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_local_armazenado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `id_produto`, `quantidade`, `id_local_armazenado`) VALUES
(1, 6, 100, 1),
(2, 7, 50, 2),
(3, 8, 50, 3),
(4, 9, 100, 4),
(5, 10, 1000, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `id_contato` int(11) DEFAULT NULL,
  `razao_social` varchar(50) NOT NULL,
  `nome_fantasia` varchar(50) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `cpf` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `id_contato`, `razao_social`, `nome_fantasia`, `cnpj`, `cpf`) VALUES
(1, 6, 'Duarte Queiroz Indústria EPP', 'Indústria Duarte', '78591696000165', '12199940578'),
(2, 7, 'Simoes Amaral Farmácia ME', 'Farmácia Simoes', '45616635000156', '84527822500'),
(3, 8, 'Rabelo Fundão Varejo EPP', 'Varejo Rabelo', '39114604000102', '73618646356'),
(4, 9, 'Camelo Costa Esportes ME', 'Esportes Camelo', '26064795000195', '67640146801'),
(5, 10, 'Texeira Anjos Comércio EPP', 'Comércio Texeira', '08455745000157', '86284478224');

-- --------------------------------------------------------

--
-- Estrutura para tabela `local_armazenado`
--

CREATE TABLE `local_armazenado` (
  `id_local_armazenado` int(11) NOT NULL,
  `rua` char(4) DEFAULT NULL,
  `rack` char(2) DEFAULT NULL,
  `pratileira` enum('Térreo','N1','N2','N3','N4','N5') DEFAULT 'Térreo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `local_armazenado`
--

INSERT INTO `local_armazenado` (`id_local_armazenado`, `rua`, `rack`, `pratileira`) VALUES
(1, '3', '5', 'N2'),
(2, '4', '6', 'Térreo'),
(3, '10', '12', 'N4'),
(4, '7', '9', 'N1'),
(5, '2', '4', 'N3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `metodo_pagamento` enum('Credito','Débito','Pix','Dinheiro') DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `metodo_pagamento`, `id_pedido`) VALUES
(1, 'Credito', 1),
(2, 'Débito', 2),
(3, 'Pix', 3),
(4, 'Credito', 4),
(5, 'Pix', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `status_pedido` enum('Processando','Cancelado','Recebido','Enviado','Entregue') DEFAULT NULL,
  `sub_total` double NOT NULL,
  `frete` double NOT NULL,
  `total_pedido` double NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor_terceiro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `data_pedido`, `status_pedido`, `sub_total`, `frete`, `total_pedido`, `id_cliente`, `id_vendedor_terceiro`) VALUES
(1, '2023-08-27', 'Processando', 631.61, 42, 673.61, 1, 1),
(2, '2023-08-27', 'Processando', 793.9, 45, 838.9, 2, 1),
(3, '2023-08-27', 'Processando', 45.99, 30, 75.99, 3, 1),
(4, '2023-08-27', 'Recebido', 356.61, 42, 398.61, 4, 5),
(5, '2023-08-27', 'Recebido', 101.99, 45, 146.99, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `categoria` enum('Veiculo','Construção','Hobby','Outros','Saúde') DEFAULT 'Veiculo',
  `valor_unitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `descricao`, `categoria`, `valor_unitario`) VALUES
(6, 'Capa para veiculos', 'Veiculo', 275),
(7, 'Tornozeleira Ortopedica', 'Saúde', 45.99),
(8, 'Barraca Luna 4 Pessoas', 'Hobby', 356.61),
(9, 'Titan Gdc 150 Serra Mármore', 'Construção', 499),
(10, 'Tê Soldável 25 Mm Tigre', 'Construção', 1.99);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_fornecedor`
--

CREATE TABLE `produto_fornecedor` (
  `id_produto` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto_fornecedor`
--

INSERT INTO `produto_fornecedor` (`id_produto`, `id_fornecedor`, `quantidade`) VALUES
(6, 1, 100),
(7, 2, 50),
(8, 3, 50),
(9, 4, 100),
(10, 5, 1000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_pedido`
--

CREATE TABLE `produto_pedido` (
  `id_produto` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto_pedido`
--

INSERT INTO `produto_pedido` (`id_produto`, `id_pedido`, `quantidade`) VALUES
(6, 1, 1),
(8, 1, 1),
(9, 2, 1),
(10, 2, 10),
(6, 2, 1),
(7, 3, 1),
(7, 3, 1),
(10, 5, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_vendedor_terceiro`
--

CREATE TABLE `produto_vendedor_terceiro` (
  `id_produto` int(11) DEFAULT NULL,
  `id_vendedor_terceiro` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto_vendedor_terceiro`
--

INSERT INTO `produto_vendedor_terceiro` (`id_produto`, `id_vendedor_terceiro`, `quantidade`) VALUES
(6, 1, 2),
(7, 1, 2),
(8, 1, 1),
(9, 1, 1),
(10, 1, 10),
(10, 5, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor_terceiro`
--

CREATE TABLE `vendedor_terceiro` (
  `id_vendedor_terceiro` int(11) NOT NULL,
  `id_contato` int(11) DEFAULT NULL,
  `razao_social` varchar(50) NOT NULL,
  `nome_fantasia` varchar(50) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `cpf` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendedor_terceiro`
--

INSERT INTO `vendedor_terceiro` (`id_vendedor_terceiro`, `id_contato`, `razao_social`, `nome_fantasia`, `cnpj`, `cpf`) VALUES
(1, 11, 'Firmino Auzier Varejo ME', 'Varejo Firmino', '34447404000140', '91213756820'),
(2, 12, 'Figueiras Borralho Ferragens EPP', 'Ferragens Figueiras', '26901807000199', '59286227400'),
(3, 13, 'Costa Baptista Atacado EPP', 'Atacado Costa', '17663751000190', '94891467223'),
(4, 14, 'Quintela Livramento Bar ME', 'Bar Quintela', '25021173000117', '59027721416'),
(5, 15, 'Boelho Zanetti Ferragens LTDA', 'Ferragens Boelho', '58458867000175', '15515856856');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `fk_contato_cliente` (`id_contato`);

--
-- Índices de tabela `cliente_vendedor`
--
ALTER TABLE `cliente_vendedor`
  ADD KEY `fk_id_cliente_vendedor` (`id_cliente`),
  ADD KEY `fk_id_vendedor_cliente` (`id_vendedor_terceiro`);

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id_contato`),
  ADD KEY `fk_endereco` (`id_endereco`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices de tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_rastreamento`),
  ADD KEY `fk_id_pedido_entrega` (`id_pedido`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`),
  ADD KEY `fk_id_local_armazenado` (`id_local_armazenado`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `fk_idContato` (`id_contato`);

--
-- Índices de tabela `local_armazenado`
--
ALTER TABLE `local_armazenado`
  ADD PRIMARY KEY (`id_local_armazenado`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `fk_id_pedido` (`id_pedido`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_id_cliente` (`id_cliente`),
  ADD KEY `fk_id_vendedor_terceiro` (`id_vendedor_terceiro`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `produto_fornecedor`
--
ALTER TABLE `produto_fornecedor`
  ADD KEY `fk_id_produto_produto` (`id_produto`),
  ADD KEY `fk_id_produto_fornecedor` (`id_fornecedor`);

--
-- Índices de tabela `produto_pedido`
--
ALTER TABLE `produto_pedido`
  ADD KEY `fk_id_produto_pedido` (`id_produto`),
  ADD KEY `fk_id_pedido_produto` (`id_pedido`);

--
-- Índices de tabela `produto_vendedor_terceiro`
--
ALTER TABLE `produto_vendedor_terceiro`
  ADD KEY `fk_id_produto_vendedor_produto` (`id_produto`),
  ADD KEY `fk_id_produto_vendedor_terceiro` (`id_vendedor_terceiro`);

--
-- Índices de tabela `vendedor_terceiro`
--
ALTER TABLE `vendedor_terceiro`
  ADD PRIMARY KEY (`id_vendedor_terceiro`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `fk_id_contato` (`id_contato`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id_rastreamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `local_armazenado`
--
ALTER TABLE `local_armazenado`
  MODIFY `id_local_armazenado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `vendedor_terceiro`
--
ALTER TABLE `vendedor_terceiro`
  MODIFY `id_vendedor_terceiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_contato_cliente` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id_contato`);

--
-- Restrições para tabelas `cliente_vendedor`
--
ALTER TABLE `cliente_vendedor`
  ADD CONSTRAINT `fk_id_cliente_vendedor` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_id_vendedor_cliente` FOREIGN KEY (`id_vendedor_terceiro`) REFERENCES `vendedor_terceiro` (`id_vendedor_terceiro`);

--
-- Restrições para tabelas `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `fk_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `fk_id_pedido_entrega` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `fk_id_local_armazenado` FOREIGN KEY (`id_local_armazenado`) REFERENCES `local_armazenado` (`id_local_armazenado`);

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fk_idContato` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id_contato`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_id_vendedor_terceiro` FOREIGN KEY (`id_vendedor_terceiro`) REFERENCES `vendedor_terceiro` (`id_vendedor_terceiro`);

--
-- Restrições para tabelas `produto_fornecedor`
--
ALTER TABLE `produto_fornecedor`
  ADD CONSTRAINT `fk_id_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  ADD CONSTRAINT `fk_id_produto_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `produto_pedido`
--
ALTER TABLE `produto_pedido`
  ADD CONSTRAINT `fk_id_pedido_produto` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `fk_id_produto_pedido` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `produto_vendedor_terceiro`
--
ALTER TABLE `produto_vendedor_terceiro`
  ADD CONSTRAINT `fk_id_produto_vendedor_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `fk_id_produto_vendedor_terceiro` FOREIGN KEY (`id_vendedor_terceiro`) REFERENCES `vendedor_terceiro` (`id_vendedor_terceiro`);

--
-- Restrições para tabelas `vendedor_terceiro`
--
ALTER TABLE `vendedor_terceiro`
  ADD CONSTRAINT `fk_id_contato` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id_contato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
