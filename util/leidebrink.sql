-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Ago-2018 às 07:14
-- Versão do servidor: 5.5.11
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leidebrink`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_receber`
--

CREATE TABLE `contas_receber` (
  `id` int(11) NOT NULL,
  `documento` varchar(256) NOT NULL,
  `emissao` date DEFAULT NULL,
  `vencimento` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idFormaPagamento` int(11) NOT NULL,
  `numeroParcela` varchar(20) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `valor` varchar(25) NOT NULL,
  `observacao` varchar(256) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `origem` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contas_receber`
--

INSERT INTO `contas_receber` (`id`, `documento`, `emissao`, `vencimento`, `idCliente`, `idFormaPagamento`, `numeroParcela`, `idUsuario`, `valor`, `observacao`, `status`, `origem`) VALUES
(1, '1234', '1999-02-11', '2019-08-21', 3, 1, '34', 1, '1004.50', 'teste', 'Cancelado', ''),
(3, '225', '2018-07-26', '2018-08-27', 15, 1, '132', 1, '1000000', 't', 'Aberto', 'CAR'),
(4, '111', '2018-07-18', '2018-07-25', 17, 1, '3', 3, '-1', NULL, 'Cancelado', 'CAR'),
(5, '555', '2018-08-06', '2018-08-07', 15, 1, '1', 4, '1', 'teste', 'Aberto', 'CAR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `emailRemetente` varchar(256) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `porta` varchar(100) DEFAULT NULL,
  `login` varchar(256) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `copiaPara` varchar(256) DEFAULT NULL,
  `tipoAutenticacao` varchar(100) DEFAULT NULL,
  `protocoloSeguranca` varchar(100) DEFAULT NULL,
  `versaoSSL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`id`, `emailRemetente`, `host`, `porta`, `login`, `senha`, `copiaPara`, `tipoAutenticacao`, `protocoloSeguranca`, `versaoSSL`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `razaoSocial` varchar(256) DEFAULT NULL,
  `nomeFantasia` varchar(256) DEFAULT NULL,
  `representante` varchar(256) DEFAULT NULL,
  `inscricaoEstadual` varchar(15) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `logradouro` varchar(256) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `telefone1` varchar(15) DEFAULT NULL,
  `telefone2` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id`, `cnpj`, `razaoSocial`, `nomeFantasia`, `representante`, `inscricaoEstadual`, `email`, `cep`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `telefone1`, `telefone2`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(55) NOT NULL,
  `QuantidadeParcelas` int(11) DEFAULT NULL,
  `PrimeiraParcela` int(11) DEFAULT NULL,
  `IntervaloParcelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`Id`, `Descricao`, `QuantidadeParcelas`, `PrimeiraParcela`, `IntervaloParcelas`) VALUES
(1, 'Á Vista', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

CREATE TABLE `grupo_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `descricao` varchar(256) DEFAULT NULL,
  `pessoa_criar` tinyint(1) DEFAULT NULL,
  `pessoa_editar` tinyint(1) DEFAULT NULL,
  `pessoa_excluir` tinyint(1) DEFAULT NULL,
  `pessoa_visualizar` tinyint(1) DEFAULT NULL,
  `forma_pagamento_criar` tinyint(1) DEFAULT NULL,
  `forma_pagamento_editar` tinyint(1) DEFAULT NULL,
  `forma_pagamento_excluir` tinyint(1) DEFAULT NULL,
  `forma_pagamento_visualizar` tinyint(1) DEFAULT NULL,
  `servico_criar` tinyint(1) DEFAULT NULL,
  `servico_editar` tinyint(1) DEFAULT NULL,
  `servico_excluir` tinyint(1) DEFAULT NULL,
  `servico_visualizar` tinyint(1) DEFAULT NULL,
  `ordem_servico_criar` tinyint(1) DEFAULT NULL,
  `ordem_servico_editar` tinyint(4) DEFAULT NULL,
  `ordem_servico_excluir` tinyint(4) DEFAULT NULL,
  `ordem_servico_visualizar` tinyint(4) DEFAULT NULL,
  `contas_receber_criar` tinyint(4) DEFAULT NULL,
  `contas_receber_editar` tinyint(4) DEFAULT NULL,
  `contas_receber_cancelar` tinyint(4) DEFAULT NULL,
  `contas_receber_baixar` tinyint(4) DEFAULT NULL,
  `contas_receber_estornar` tinyint(4) DEFAULT NULL,
  `contas_receber_visualizar` tinyint(4) DEFAULT NULL,
  `movimento_caixa_criar` tinyint(4) DEFAULT NULL,
  `movimento_caixa_editar` tinyint(1) DEFAULT NULL,
  `movimento_caixa_excluir` tinyint(1) DEFAULT NULL,
  `movimento_caixa_visualizar` tinyint(4) DEFAULT NULL,
  `relatorio_visualizar` tinyint(4) DEFAULT NULL,
  `empresa_editar` tinyint(4) DEFAULT NULL,
  `empresa_visualizar` tinyint(4) DEFAULT NULL,
  `email_editar` tinyint(4) DEFAULT NULL,
  `email_visualizar` tinyint(4) DEFAULT NULL,
  `usuario_criar` tinyint(4) DEFAULT NULL,
  `usuario_editar` tinyint(4) DEFAULT NULL,
  `usuario_excluir` tinyint(4) DEFAULT NULL,
  `usuario_visualizar` tinyint(4) DEFAULT NULL,
  `grupo_usuario_criar` tinyint(4) DEFAULT NULL,
  `grupo_usuario_editar` tinyint(4) DEFAULT NULL,
  `grupo_usuario_excluir` tinyint(4) DEFAULT NULL,
  `grupo_usuario_visualizar` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_usuario`
--

INSERT INTO `grupo_usuario` (`id`, `nome`, `descricao`, `pessoa_criar`, `pessoa_editar`, `pessoa_excluir`, `pessoa_visualizar`, `forma_pagamento_criar`, `forma_pagamento_editar`, `forma_pagamento_excluir`, `forma_pagamento_visualizar`, `servico_criar`, `servico_editar`, `servico_excluir`, `servico_visualizar`, `ordem_servico_criar`, `ordem_servico_editar`, `ordem_servico_excluir`, `ordem_servico_visualizar`, `contas_receber_criar`, `contas_receber_editar`, `contas_receber_cancelar`, `contas_receber_baixar`, `contas_receber_estornar`, `contas_receber_visualizar`, `movimento_caixa_criar`, `movimento_caixa_editar`, `movimento_caixa_excluir`, `movimento_caixa_visualizar`, `relatorio_visualizar`, `empresa_editar`, `empresa_visualizar`, `email_editar`, `email_visualizar`, `usuario_criar`, `usuario_editar`, `usuario_excluir`, `usuario_visualizar`, `grupo_usuario_criar`, `grupo_usuario_editar`, `grupo_usuario_excluir`, `grupo_usuario_visualizar`) VALUES
(1, 'Administrador', 'Administrador', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimento_caixa`
--

CREATE TABLE `movimento_caixa` (
  `id` int(11) NOT NULL,
  `idContasReceber` int(11) DEFAULT NULL,
  `idFormaPagamento` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `documento` varchar(256) NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `tipoMovimento` varchar(256) NOT NULL,
  `origem` varchar(256) NOT NULL,
  `valor` varchar(256) NOT NULL,
  `observacao` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `movimento_caixa`
--

INSERT INTO `movimento_caixa` (`id`, `idContasReceber`, `idFormaPagamento`, `idUsuario`, `data`, `documento`, `descricao`, `tipoMovimento`, `origem`, `valor`, `observacao`) VALUES
(1, NULL, 1, 3, '2018-07-27', '335', 'Conta de luz', 'Entrada', 'Caixa', '251', 'cc'),
(2, NULL, 1, 3, '2018-07-27', '22', 'teste', 'Saida', 'Caixa', '1', NULL),
(3, NULL, 1, 3, '2018-07-18', '111', '17 - teste contato 2', 'Entrada', 'CAR', '1', NULL),
(4, NULL, 1, 3, '2018-07-27', '111', '17 - teste contato 2', 'Entrada', 'CAR', '1', NULL),
(5, NULL, 1, 3, '2018-07-27', '111', '17 - teste contato 2', 'Saida', 'CAR', '1', NULL),
(6, NULL, 1, 3, '2018-07-28', '111', '17 - teste contato 2', 'Entrada', 'CAR', '1', NULL),
(7, NULL, 1, 1, '2018-07-28', '1234', '3 - Teste', 'Saida', 'CAR', '1004.50', 'teste'),
(8, NULL, 1, 1, '2018-07-28', '225', '15 - Paulo Teste Pessoa', 'Saida', 'CAR', '10', 't'),
(9, NULL, 1, 3, '2018-07-28', '111', '17 - teste contato 2', 'Saida', 'CAR', '1', NULL),
(10, NULL, 1, 1, '2018-07-28', '1234', '3 - Teste', 'Entrada', 'CAR', '1004.50', 'teste'),
(11, 3, 1, 1, '2018-07-28', '225', '15 - Paulo Teste Pessoa', 'Entrada', 'CAR', '10', 't'),
(12, 3, 1, 1, '2018-07-28', '225', '15 - Paulo Teste Pessoa', 'Saida', 'CAR', '10', 't'),
(13, 3, 1, 1, '2018-07-28', '225', '15 - Paulo Teste Pessoa', 'Entrada', 'CAR', '10', 't'),
(14, 1, 1, 1, '2018-07-28', '1234', '3 - Teste', 'Saida', 'CAR', '1004.50', 'teste'),
(15, 3, 1, 1, '2018-07-28', '225', '15 - Paulo Teste Pessoa', 'Saida', 'CAR', '10', 't'),
(16, 1, 1, 1, '2018-07-28', '1234', '3 - Teste', 'Entrada', 'CAR', '1004.50', 'teste'),
(17, 1, 1, 1, '2018-08-04', '1234', '3 - Teste', 'Saida', 'CAR', '1004.50', 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servico`
--

CREATE TABLE `ordem_servico` (
  `id` int(11) NOT NULL,
  `tipo` varchar(256) NOT NULL,
  `data` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `dataFim` datetime DEFAULT NULL,
  `idEndereco` int(11) DEFAULT NULL,
  `idFormaPagamento` int(11) NOT NULL,
  `tipoDesconto` varchar(2) DEFAULT NULL,
  `desconto` varchar(10) DEFAULT NULL,
  `observacao` text,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(55) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `TipoPessoa` char(2) DEFAULT NULL,
  `CNPJ` varchar(18) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `RG` varchar(13) DEFAULT NULL,
  `Phone1` varchar(15) DEFAULT NULL,
  `Phone2` varchar(15) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `Obs` varchar(256) DEFAULT NULL,
  `isCliente` int(1) DEFAULT NULL,
  `isColaborador` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`Id`, `Nome`, `dataNascimento`, `TipoPessoa`, `CNPJ`, `CPF`, `RG`, `Phone1`, `Phone2`, `Email`, `Obs`, `isCliente`, `isColaborador`) VALUES
(1, 'Paulo Eduardo', NULL, 'pf', NULL, '99999999999', '9999999', NULL, NULL, 'paulo@gmail.com', 'Cadastro para testes', NULL, 1),
(3, 'Teste', NULL, 'pj', '10101010101010', NULL, NULL, NULL, NULL, 'paulo@gmail.com', NULL, 1, NULL),
(4, 'Teste', '0000-00-00', 'pj', '10101010101010', NULL, NULL, NULL, NULL, 'paulo@gmail.com', NULL, 0, 0),
(6, 'Teste', '0000-00-00', 'pj', '10101010101010', NULL, NULL, NULL, NULL, 'paulo@gmail.com', NULL, 0, 0),
(7, 'Teste', '0000-00-00', 'pj', '10101010101010', NULL, NULL, NULL, NULL, 'paulo@gmail.com', NULL, 0, 0),
(8, 'Teste', '0000-00-00', 'pj', '10101010101010', NULL, NULL, NULL, NULL, 'paulo@gmail.com', NULL, 0, 0),
(9, 'Teste 2', '0000-00-00', 'pj', '20202020202020', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(10, 'Teste 3', '0000-00-00', 'nd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(11, 'Teste 4', '0000-00-00', 'nd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(12, 'Teste 5', '0000-00-00', 'nd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(13, 'Teste 6', '0000-00-00', 'nd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(14, 'Teste 6', '4222-05-15', 'nd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Paulo Teste Pessoa', '1998-08-21', 'pf', NULL, '158525165', NULL, '(88) 8888-88888', '(88) 8888-88888', 'paulo@gmail.com', NULL, 1, 1),
(16, 'Paulo Eduardo teste', '1998-08-21', 'nd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 'teste contato 2', NULL, 'pj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_contatos`
--

CREATE TABLE `pessoa_contatos` (
  `id` int(11) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa_contatos`
--

INSERT INTO `pessoa_contatos` (`id`, `idPessoa`, `telefone`) VALUES
(1, 17, '33333333333'),
(3, 14, '888888888444444'),
(4, 14, '999999999999999'),
(5, 14, '222222222222222'),
(6, 14, '666666666666666');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_enderecos`
--

CREATE TABLE `pessoa_enderecos` (
  `id` int(11) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `logradouro` varchar(256) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `pontoReferencia` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa_enderecos`
--

INSERT INTO `pessoa_enderecos` (`id`, `idPessoa`, `cep`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `pontoReferencia`) VALUES
(1, 6, '0', 'logradouro', '101', NULL, 'cidade', NULL, NULL),
(2, 7, '0', 'logradouro', '101', NULL, 'cidade', NULL, NULL),
(3, 8, '0', 'logradouro', '101', NULL, 'cidade', NULL, NULL),
(4, 9, '0', 'logradouro 2', NULL, NULL, NULL, 'PE', NULL),
(5, 10, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 10, '2000000', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 11, '11111-515', NULL, '111', NULL, NULL, 'PE', NULL),
(8, 11, '11111-222', 'logradouro', NULL, NULL, NULL, 'AC', NULL),
(9, 12, '33333', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 14, '44444-444', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, '33333-555', NULL, '222', NULL, 'timba', 'PE', NULL),
(12, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `preco` varchar(25) DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `descricao`, `preco`, `hora`) VALUES
(13, 'Camará Elastica 3m', '5203.02', '15:59:00'),
(14, 'Camará Elastica', '55.30', '02:45:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos_composicao`
--

CREATE TABLE `servicos_composicao` (
  `id` int(11) NOT NULL,
  `idServico` int(11) NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servicos_composicao`
--

INSERT INTO `servicos_composicao` (`id`, `idServico`, `descricao`, `quantidade`) VALUES
(3, 13, '\".$composicaoDesc[$i].\"', 54),
(5, 14, 'Camará Elastica teste 1', 1),
(7, 14, 'Camará Elastica teste 3', 3),
(8, 13, 'Teste de atualização adicionando nova composição na edição', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Login` varchar(256) NOT NULL,
  `Nome` varchar(256) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Senha` varchar(32) NOT NULL,
  `idGrupoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`Id`, `Login`, `Nome`, `Email`, `Senha`, `idGrupoUsuario`) VALUES
(1, 'admin', 'Administrador', 'paulo@gmail.com', 'admin!admin', 2),
(3, 'admin2', 'Administrador', 'admin@admi', 'admin!admin', 1),
(4, 'teste', 'Teste', 'paulo@gmail.com', '123', 1),
(5, 'Teste333', 'Teste333', 'Teste333@teste.com', 'e034fb6b66aacc1d48f445ddfb08da98', 12),
(6, 'Teste333', 'Teste333', 'Teste333@teste.com', 'e034fb6b66aacc1d48f445ddfb08da98', 12),
(7, 'Teste333', 'Teste333', 'Teste333@teste.com', 'e034fb6b66aacc1d48f445ddfb08da98', 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contas_receber`
--
ALTER TABLE `contas_receber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `grupo_usuario`
--
ALTER TABLE `grupo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movimento_caixa`
--
ALTER TABLE `movimento_caixa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pessoa_contatos`
--
ALTER TABLE `pessoa_contatos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoa_enderecos`
--
ALTER TABLE `pessoa_enderecos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicos_composicao`
--
ALTER TABLE `servicos_composicao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contas_receber`
--
ALTER TABLE `contas_receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grupo_usuario`
--
ALTER TABLE `grupo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movimento_caixa`
--
ALTER TABLE `movimento_caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ordem_servico`
--
ALTER TABLE `ordem_servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pessoa_contatos`
--
ALTER TABLE `pessoa_contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pessoa_enderecos`
--
ALTER TABLE `pessoa_enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `servicos_composicao`
--
ALTER TABLE `servicos_composicao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
