-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 26/08/2025 às 17:02
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sigeac`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sobrenome` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `curso_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `aluno_curso_id_3c262fbd` (`curso_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`id`, `criado_em`, `atualizado_em`, `nome`, `sobrenome`, `email`, `data_nascimento`, `status`, `user_id`, `curso_id`) VALUES
(7, '2025-08-25 18:09:22.175235', '2025-08-25 19:49:53.552460', 'Luis', 'Pérez', 'luis@email.com', '1998-10-10', 1, 11, 1),
(11, '2025-08-25 19:04:55.943706', '2025-08-25 19:49:45.735968', 'Lucas', 'Lopez', 'lucas@email.com', '1998-10-10', 1, 16, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administradores'),
(2, 'Alunos'),
(3, 'Professores');

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 2, 32),
(2, 2, 52),
(3, 2, 56),
(4, 3, 32),
(5, 3, 36),
(6, 3, 49),
(7, 3, 50),
(8, 3, 51),
(9, 3, 52),
(10, 3, 53),
(11, 3, 54),
(12, 3, 55),
(13, 3, 56),
(14, 3, 44),
(15, 1, 29),
(16, 1, 30),
(17, 1, 31),
(18, 1, 32),
(19, 1, 25),
(20, 1, 26),
(21, 1, 27),
(22, 1, 28),
(23, 1, 33),
(24, 1, 34),
(25, 1, 35),
(26, 1, 36),
(27, 1, 49),
(28, 1, 50),
(29, 1, 51),
(30, 1, 52),
(31, 1, 45),
(32, 1, 46),
(33, 1, 47),
(34, 1, 48),
(35, 1, 53),
(36, 1, 54),
(37, 1, 55),
(38, 1, 56),
(39, 1, 37),
(40, 1, 38),
(41, 1, 39),
(42, 1, 40),
(43, 1, 41),
(44, 1, 42),
(45, 1, 43),
(46, 1, 44);

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add curso', 7, 'add_curso'),
(26, 'Can change curso', 7, 'change_curso'),
(27, 'Can delete curso', 7, 'delete_curso'),
(28, 'Can view curso', 7, 'view_curso'),
(29, 'Can add aluno', 8, 'add_aluno'),
(30, 'Can change aluno', 8, 'change_aluno'),
(31, 'Can delete aluno', 8, 'delete_aluno'),
(32, 'Can view aluno', 8, 'view_aluno'),
(33, 'Can add disciplina', 9, 'add_disciplina'),
(34, 'Can change disciplina', 9, 'change_disciplina'),
(35, 'Can delete disciplina', 9, 'delete_disciplina'),
(36, 'Can view disciplina', 9, 'view_disciplina'),
(37, 'Can add professor', 10, 'add_professor'),
(38, 'Can change professor', 10, 'change_professor'),
(39, 'Can delete professor', 10, 'delete_professor'),
(40, 'Can view professor', 10, 'view_professor'),
(41, 'Can add turma', 11, 'add_turma'),
(42, 'Can change turma', 11, 'change_turma'),
(43, 'Can delete turma', 11, 'delete_turma'),
(44, 'Can view turma', 11, 'view_turma'),
(45, 'Can add matricula', 12, 'add_matricula'),
(46, 'Can change matricula', 12, 'change_matricula'),
(47, 'Can delete matricula', 12, 'delete_matricula'),
(48, 'Can view matricula', 12, 'view_matricula'),
(49, 'Can add falta', 13, 'add_falta'),
(50, 'Can change falta', 13, 'change_falta'),
(51, 'Can delete falta', 13, 'delete_falta'),
(52, 'Can view falta', 13, 'view_falta'),
(53, 'Can add nota', 14, 'add_nota'),
(54, 'Can change nota', 14, 'change_nota'),
(55, 'Can delete nota', 14, 'delete_nota'),
(56, 'Can view nota', 14, 'view_nota');

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$9CCnYv2VatN4KCRh3k8ZX7$UJfd1sLjVzG+FtDPlGE3naT2CcfF672QxYyAWz3ziko=', '2025-08-26 14:23:00.442052', 1, 'karli', 'Karli', 'Munoz', 'karli@email.com', 1, 1, '2025-08-25 15:37:14.000000'),
(16, 'pbkdf2_sha256$1000000$akB7G0epkS30oWU9icnWfH$5XEUl6rh57POyEKROp76e0m2J5mSUWdYWg267eu2L1c=', NULL, 0, 'lucas', 'Lucas', 'Lopez', 'lucas@email.com', 1, 1, '2025-08-25 19:04:54.432269'),
(12, 'pbkdf2_sha256$1000000$JbtvHQ53CEAaKMvHCw3GFD$meT7rgc6m2p8P/TCdWNm6m33fgoqYp357GN5Cu72UmQ=', '2025-08-26 14:23:30.208284', 0, 'ramon', 'Ramon', 'Lemos', 'ramon@email.com', 1, 1, '2025-08-25 18:16:25.000000'),
(11, 'pbkdf2_sha256$1000000$uGiaomwrNXKdKJTkHrVjVy$SAk9x6KxiYE3FdslvZiZRreTP71BbNz/WRmaJK70CKk=', '2025-08-26 14:24:05.874950', 0, 'luis', 'Luis', 'Pérez', 'luis@email.com', 1, 1, '2025-08-25 18:09:20.498508');

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(10, 12, 3),
(13, 16, 2),
(9, 11, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `descricao` longtext NOT NULL,
  `carga_horaria_total` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ;

--
-- Despejando dados para a tabela `curso`
--

INSERT INTO `curso` (`id`, `criado_em`, `atualizado_em`, `nome`, `descricao`, `carga_horaria_total`) VALUES
(1, '2025-08-25 19:11:53.399648', '2025-08-25 19:11:53.399673', 'Análise e Desenvolvimento de Sistemas', 'Curso de graduação', 3000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `ementa` longtext NOT NULL,
  `carga_horaria` int UNSIGNED NOT NULL,
  `curso_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sisgeac_disciplina_curso_id_nome_85fcdb19_uniq` (`curso_id`,`nome`),
  KEY `Sisgeac_disciplina_curso_id_da757cd9` (`curso_id`)
) ;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`id`, `criado_em`, `atualizado_em`, `nome`, `ementa`, `carga_horaria`, `curso_id`) VALUES
(1, '2025-08-25 19:14:32.351581', '2025-08-25 19:51:09.170584', 'Matemática', 'apWOÍDGJFOPIASJNDOFGIJAOSPGHIJDOPADISUHGPIOUHASPDGOIUHPASIODGHPOIASUHDGPIOUHASDIPUGHIASUDHGOIUAHSDOGIUHADSoipguhsipudhgo9ísaHJDGOIAHJSDO´GIHAOSdgihbopaisUHFGOPIUahsdpgiouhsidopguhaiosudghuasDGOÍASDGOÍHASoídghosiHDGOPIHGIOPUHSEIPOUGHDO´HSGOPAISHDGOPIASHDOPGIHOSAPDIHGOAPSIDHGPOAISDHGOPADSIHGOPIASDHGOPIAHSDGPOASIDGOPAISHDGOIPASUHGOSAIHGOPIASDHGOPAHSDGIOPASHIDGODPSAHGOPASDHIGOPASDHGOPIASDHGOIAHSDOPGIHASDIOGHASDOPGIHASOPDGIHAOPSDGHAIOPSDHGIOPASDHIGOIHSAODPGHOPASDHGIOPASDIHGOPIASDGOPHHIOPSDGIHASODPGIHOIPASDHGIOHPASDHIGOPIADSHIGHIOPSADGHSAOPDIGHIASDHPIOGHIDSAOPGHOPASDIHGOPIASDHIGPOASDIHGOIPASDHGOPASDIHGOPASDHIGOIPDASHGOPIAHSDPGOIHASDOIGHPAOSDHGOPASDGHIAOPSDIGHIOPASDHIGOPIHADSOPGIAHIOPSDGHOPAHISDHIGOADIPSGHIOADSHIOPGHIOPASDPOIGHIOASDHGISADHIOPGHASDPHIOUGHIOGADFSHIOPDGSAHIOPADGSHIOADGSHIOADGSHIOJADGSHIJOBCIJOPDS´JOPÁBFJOPÁDSjopádgsJOPDGSAJOPADFGSJOPAGDFJOPS´JOPADGS´JOP´DFGSJOP´DGSAJOP´DGSJOPÁDGSJOPADGJOPS´JOP´DGSJPOÁDSGJOPÁDGSJOP´JÁDGOPS´JOPDGSA´JOPS', 60, 1),
(2, '2025-08-25 19:16:25.545149', '2025-08-25 19:48:32.361448', 'Algoritmos', 'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp.', 120, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Despejando dados para a tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-08-25 15:41:15.485193', '2', 'luis', 1, '[{\"added\": {}}]', 4, 1),
(2, '2025-08-25 15:41:59.769888', '2', 'luis', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Groups\"]}}]', 4, 1),
(3, '2025-08-25 15:43:52.704594', '3', 'pedro', 1, '[{\"added\": {}}]', 4, 1),
(4, '2025-08-25 15:44:23.757871', '3', 'pedro', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Groups\", \"Last login\"]}}]', 4, 1),
(5, '2025-08-25 15:45:11.595096', '2', 'luis', 2, '[{\"added\": {\"name\": \"aluno\", \"object\": \"Luis\"}}]', 4, 1),
(6, '2025-08-25 15:45:59.460206', '3', 'pedro', 2, '[{\"added\": {\"name\": \"professor\", \"object\": \"Pedro\"}}]', 4, 1),
(7, '2025-08-25 15:48:10.951912', '2', 'Juan', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-08-25 15:48:38.690225', '2', 'Juan', 3, '', 8, 1),
(9, '2025-08-25 15:54:45.783903', '4', 'tomas', 1, '[{\"added\": {}}]', 4, 1),
(10, '2025-08-25 15:56:45.722315', '4', 'tomas', 3, '', 4, 1),
(11, '2025-08-25 17:21:57.249556', '1', 'karli', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(12, '2025-08-25 17:24:20.782602', '5', 'juan', 1, '[{\"added\": {}}]', 4, 1),
(13, '2025-08-25 17:27:02.375684', '5', 'juan', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Groups\", \"Last login\"]}}, {\"added\": {\"name\": \"professor\", \"object\": \"Juan\"}}]', 4, 1),
(14, '2025-08-25 17:41:02.583965', '6', 'ramon', 1, '[{\"added\": {}}]', 4, 1),
(15, '2025-08-25 17:41:10.509686', '6', 'ramon', 3, '', 4, 1),
(16, '2025-08-25 17:41:51.105473', '7', 'ramon', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Ramon\"}}]', 4, 1),
(17, '2025-08-25 17:47:31.860987', '7', 'ramon', 3, '', 4, 1),
(18, '2025-08-25 17:48:25.306779', '3', 'Ramon', 3, '', 8, 1),
(19, '2025-08-25 17:48:57.625840', '8', 'ramon', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Ramon\"}}]', 4, 1),
(20, '2025-08-25 17:54:16.815458', '8', 'ramon', 2, '[{\"changed\": {\"name\": \"Aluno\", \"object\": \"Ramon\", \"fields\": [\"Sobrenome\"]}}]', 4, 1),
(21, '2025-08-25 17:54:51.534171', '3', 'pedro', 2, '[{\"changed\": {\"name\": \"Professor\", \"object\": \"Pedro\", \"fields\": [\"Sobrenome\"]}}]', 4, 1),
(22, '2025-08-25 17:55:10.170063', '3', 'pedro', 2, '[]', 4, 1),
(23, '2025-08-25 17:56:19.262756', '8', 'ramon', 3, '', 4, 1),
(24, '2025-08-25 17:56:23.623594', '3', 'pedro', 3, '', 4, 1),
(25, '2025-08-25 17:56:33.068475', '2', 'luis', 3, '', 4, 1),
(26, '2025-08-25 17:56:37.874889', '5', 'juan', 3, '', 4, 1),
(27, '2025-08-25 17:57:19.221825', '1', 'Luis', 3, '', 8, 1),
(28, '2025-08-25 17:57:23.199795', '4', 'Ramon', 3, '', 8, 1),
(29, '2025-08-25 17:57:55.795081', '9', 'luis', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Luis\"}}]', 4, 1),
(30, '2025-08-25 18:02:53.929562', '5', 'Luis', 3, '', 8, 1),
(31, '2025-08-25 18:03:00.418219', '9', 'luis', 3, '', 4, 1),
(32, '2025-08-25 18:03:35.087562', '10', 'lucas', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Lucas\"}}]', 4, 1),
(33, '2025-08-25 18:08:38.905414', '6', 'Lucas', 3, '', 8, 1),
(34, '2025-08-25 18:08:45.505807', '10', 'lucas', 3, '', 4, 1),
(35, '2025-08-25 18:09:22.178719', '11', 'luis', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Luis\"}}]', 4, 1),
(36, '2025-08-25 18:16:26.745028', '12', 'ramon', 1, '[{\"added\": {}}]', 4, 1),
(37, '2025-08-25 18:17:02.802466', '12', 'ramon', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\", \"Last login\"]}}, {\"added\": {\"name\": \"Professor\", \"object\": \"Ramon\"}}]', 4, 1),
(38, '2025-08-25 18:19:23.400319', '2', 'Juan', 3, '', 10, 1),
(39, '2025-08-25 18:19:27.063781', '1', 'Pedro', 3, '', 10, 1),
(40, '2025-08-25 18:56:22.388064', '13', 'lucas', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Lucas\"}}]', 4, 1),
(41, '2025-08-25 18:56:54.943223', '13', 'lucas', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Last login\"]}}]', 4, 1),
(42, '2025-08-25 18:57:27.623289', '13', 'lucas', 3, '', 4, 1),
(43, '2025-08-25 18:58:36.206320', '14', 'lucas', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Lucas\"}}]', 4, 1),
(44, '2025-08-25 18:58:51.991002', '8', 'Lucas', 3, '', 8, 1),
(45, '2025-08-25 18:58:55.782714', '9', 'Lucas', 3, '', 8, 1),
(46, '2025-08-25 18:59:02.154785', '14', 'lucas', 3, '', 4, 1),
(47, '2025-08-25 18:59:33.788393', '15', 'lucas', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Lucas\"}}]', 4, 1),
(48, '2025-08-25 19:03:34.350727', '15', 'lucas', 3, '', 4, 1),
(49, '2025-08-25 19:04:22.068654', '10', 'Lucas', 3, '', 8, 1),
(50, '2025-08-25 19:04:55.949367', '16', 'lucas', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Aluno\", \"object\": \"Lucas\"}}]', 4, 1),
(51, '2025-08-25 19:11:53.400527', '1', 'Análise e Desenvolvimento de Sistemas', 1, '[{\"added\": {}}]', 7, 1),
(52, '2025-08-25 19:14:32.353576', '1', 'Matemática (Análise e Desenvolvimento de Sistemas)', 1, '[{\"added\": {}}]', 9, 1),
(53, '2025-08-25 19:16:25.546038', '2', 'Algoritmos (Análise e Desenvolvimento de Sistemas)', 1, '[{\"added\": {}}]', 9, 1),
(54, '2025-08-25 19:48:32.362873', '2', 'Algoritmos (Análise e Desenvolvimento de Sistemas)', 2, '[{\"added\": {\"name\": \"Relacionamento professor-disciplina\", \"object\": \"Professor_disciplinas object (1)\"}}]', 9, 1),
(55, '2025-08-25 19:49:45.739197', '11', 'Lucas Lopez', 2, '[{\"changed\": {\"fields\": [\"Curso\"]}}]', 8, 1),
(56, '2025-08-25 19:49:53.555452', '7', 'Luis Pérez', 2, '[{\"changed\": {\"fields\": [\"Curso\"]}}]', 8, 1),
(57, '2025-08-25 19:51:09.171511', '1', 'Matemática (Análise e Desenvolvimento de Sistemas)', 2, '[{\"added\": {\"name\": \"Relacionamento professor-disciplina\", \"object\": \"Professor_disciplinas object (2)\"}}]', 9, 1),
(58, '2025-08-25 20:07:21.826375', '1', '2024-01 - Análise e Desenvolvimento de Sistemas', 1, '[{\"added\": {}}]', 11, 1),
(59, '2025-08-25 20:09:58.061226', '1', 'Lucas Lopez em 2024-01 - Análise e Desenvolvimento de Sistemas', 1, '[{\"added\": {}}]', 12, 1),
(60, '2025-08-25 20:10:59.230385', '1', 'Lucas Lopez - Algoritmos: Fluxos Condicionais = 10', 1, '[{\"added\": {}}]', 14, 1),
(61, '2025-08-25 20:11:27.531777', '1', 'Lucas Lopez - Matemática em 2024-12-04: Presente', 1, '[{\"added\": {}}]', 13, 1),
(62, '2025-08-25 20:32:02.975423', '2', 'Luis Pérez em 2024-01 - Análise e Desenvolvimento de Sistemas', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'Sisgeac', 'curso'),
(8, 'Sisgeac', 'aluno'),
(9, 'Sisgeac', 'disciplina'),
(10, 'Sisgeac', 'professor'),
(11, 'Sisgeac', 'turma'),
(12, 'Sisgeac', 'matricula'),
(13, 'Sisgeac', 'falta'),
(14, 'Sisgeac', 'nota');

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-08-25 15:36:51.626372'),
(2, 'auth', '0001_initial', '2025-08-25 15:36:51.781130'),
(3, 'Sisgeac', '0001_initial', '2025-08-25 15:36:52.068444'),
(4, 'Sisgeac', '0002_alter_aluno_table_alter_curso_table_and_more', '2025-08-25 15:36:52.104682'),
(5, 'Sisgeac', '0003_alter_nota_table', '2025-08-25 15:36:52.114202'),
(6, 'admin', '0001_initial', '2025-08-25 15:36:52.163481'),
(7, 'admin', '0002_logentry_remove_auto_add', '2025-08-25 15:36:52.167649'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-25 15:36:52.171717'),
(9, 'contenttypes', '0002_remove_content_type_name', '2025-08-25 15:36:52.199256'),
(10, 'auth', '0002_alter_permission_name_max_length', '2025-08-25 15:36:52.215213'),
(11, 'auth', '0003_alter_user_email_max_length', '2025-08-25 15:36:52.228933'),
(12, 'auth', '0004_alter_user_username_opts', '2025-08-25 15:36:52.233155'),
(13, 'auth', '0005_alter_user_last_login_null', '2025-08-25 15:36:52.245700'),
(14, 'auth', '0006_require_contenttypes_0002', '2025-08-25 15:36:52.246342'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2025-08-25 15:36:52.250891'),
(16, 'auth', '0008_alter_user_username_max_length', '2025-08-25 15:36:52.265715'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2025-08-25 15:36:52.278447'),
(18, 'auth', '0010_alter_group_name_max_length', '2025-08-25 15:36:52.295157'),
(19, 'auth', '0011_update_proxy_permissions', '2025-08-25 15:36:52.302717'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2025-08-25 15:36:52.316279'),
(21, 'sessions', '0001_initial', '2025-08-25 15:36:52.327117'),
(22, 'Sisgeac', '0004_alter_professor_options', '2025-08-25 17:38:21.394027'),
(23, 'Sisgeac', '0005_alter_professor_options', '2025-08-25 17:39:03.607789'),
(24, 'Sisgeac', '0006_alter_professor_options', '2025-08-25 17:39:31.006736'),
(25, 'Sisgeac', '0007_alter_aluno_options', '2025-08-25 17:40:21.031935'),
(26, 'Sisgeac', '0008_aluno_last_name', '2025-08-25 17:52:14.806537'),
(27, 'Sisgeac', '0009_professor_last_name', '2025-08-25 17:53:50.155520'),
(28, 'Sisgeac', '0010_rename_last_name_aluno_sobrenome', '2025-08-25 18:06:31.674849'),
(29, 'Sisgeac', '0011_rename_last_name_professor_sobrenome', '2025-08-25 18:07:57.934757'),
(30, 'Sisgeac', '0012_rename_ativo_aluno_status', '2025-08-25 18:23:16.378031'),
(31, 'Sisgeac', '0013_rename_ativo_professor_status', '2025-08-25 18:25:36.934866'),
(32, 'Sisgeac', '0014_aluno_curso_professor_disciplinas', '2025-08-25 19:39:25.111920');

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7kjvzolnhc7hjb4p6x603s4z2p3kwlw1', '.eJxVjDsOwjAQBe_iGln-fyjpcwZrd21wANlSnFSIu0OkFNC-mXkvlmBba9pGWdKc2ZlJdvrdEOhR2g7yHdqtc-ptXWbku8IPOvjUc3leDvfvoMKo39ooIT057Zwy0UFBiYGCQ4NBuSxtJEFX6zEGqbEEoWPJ2nqiQBZIS_b-AMMbN3c:1uqesJ:3hvpZociDoI_hg1Qv_IcelJiZ0rxXA15DbEnSs8ZJLk', '2025-09-08 21:37:11.879914');

-- --------------------------------------------------------

--
-- Estrutura para tabela `falta`
--

DROP TABLE IF EXISTS `falta`;
CREATE TABLE IF NOT EXISTS `falta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `data` date NOT NULL,
  `presente` tinyint(1) NOT NULL,
  `disciplina_id` bigint NOT NULL,
  `matricula_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sisgeac_falta_matricula_id_disciplina_id_data_4ec576f0_uniq` (`matricula_id`,`disciplina_id`,`data`),
  KEY `Sisgeac_falta_disciplina_id_6d98033c` (`disciplina_id`),
  KEY `Sisgeac_falta_matricula_id_27fb8e18` (`matricula_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `falta`
--

INSERT INTO `falta` (`id`, `criado_em`, `atualizado_em`, `data`, `presente`, `disciplina_id`, `matricula_id`) VALUES
(1, '2025-08-25 20:11:27.530390', '2025-08-25 20:11:27.530404', '2024-12-04', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `data` date NOT NULL,
  `aluno_id` bigint NOT NULL,
  `turma_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sisgeac_matricula_aluno_id_turma_id_725ec7b5_uniq` (`aluno_id`,`turma_id`),
  KEY `Sisgeac_matricula_aluno_id_7d44abd3` (`aluno_id`),
  KEY `Sisgeac_matricula_turma_id_bb9f5d53` (`turma_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `matricula`
--

INSERT INTO `matricula` (`id`, `criado_em`, `atualizado_em`, `data`, `aluno_id`, `turma_id`) VALUES
(1, '2025-08-25 20:09:58.059651', '2025-08-25 20:09:58.059672', '2025-08-25', 11, 1),
(2, '2025-08-25 20:32:02.974262', '2025-08-25 20:32:02.974278', '2025-08-25', 7, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota`
--

DROP TABLE IF EXISTS `nota`;
CREATE TABLE IF NOT EXISTS `nota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `avaliacao` varchar(60) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `data` date NOT NULL,
  `disciplina_id` bigint NOT NULL,
  `matricula_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sisgeac_nota_matricula_id_disciplina_id_avaliacao_04f5a76c_uniq` (`matricula_id`,`disciplina_id`,`avaliacao`),
  KEY `Sisgeac_nota_disciplina_id_1f03b448` (`disciplina_id`),
  KEY `Sisgeac_nota_matricula_id_3c273574` (`matricula_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `nota`
--

INSERT INTO `nota` (`id`, `criado_em`, `atualizado_em`, `avaliacao`, `valor`, `data`, `disciplina_id`, `matricula_id`) VALUES
(1, '2025-08-25 20:10:59.227776', '2025-08-25 20:10:59.227801', 'Fluxos Condicionais', 10.00, '2024-12-04', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sobrenome` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`id`, `criado_em`, `atualizado_em`, `nome`, `sobrenome`, `email`, `status`, `user_id`) VALUES
(3, '2025-08-25 18:17:02.799149', '2025-08-25 18:17:02.799211', 'Ramon', 'Lemos', 'ramon@email.com', 1, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_disciplinas`
--

DROP TABLE IF EXISTS `professor_disciplinas`;
CREATE TABLE IF NOT EXISTS `professor_disciplinas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `professor_id` bigint NOT NULL,
  `disciplina_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `professor_disciplinas_professor_id_disciplina_id_cfaec2d2_uniq` (`professor_id`,`disciplina_id`),
  KEY `professor_disciplinas_professor_id_eeb8ea8f` (`professor_id`),
  KEY `professor_disciplinas_disciplina_id_dd220bd5` (`disciplina_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `professor_disciplinas`
--

INSERT INTO `professor_disciplinas` (`id`, `professor_id`, `disciplina_id`) VALUES
(1, 3, 2),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `identificador` varchar(30) NOT NULL,
  `ano` int UNSIGNED NOT NULL,
  `semestre` smallint UNSIGNED NOT NULL,
  `curso_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sisgeac_turma_curso_id_identificador_a9874f4c_uniq` (`curso_id`,`identificador`),
  KEY `Sisgeac_turma_curso_id_d810504d` (`curso_id`)
) ;

--
-- Despejando dados para a tabela `turma`
--

INSERT INTO `turma` (`id`, `criado_em`, `atualizado_em`, `identificador`, `ano`, `semestre`, `curso_id`) VALUES
(1, '2025-08-25 20:07:21.822708', '2025-08-25 20:07:21.822735', '2024-01', 2024, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma_professores`
--

DROP TABLE IF EXISTS `turma_professores`;
CREATE TABLE IF NOT EXISTS `turma_professores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `turma_id` bigint NOT NULL,
  `professor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sisgeac_turma_professores_turma_id_professor_id_c4f4c7f4_uniq` (`turma_id`,`professor_id`),
  KEY `Sisgeac_turma_professores_turma_id_b08d141b` (`turma_id`),
  KEY `Sisgeac_turma_professores_professor_id_cbb4e8f7` (`professor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `turma_professores`
--

INSERT INTO `turma_professores` (`id`, `turma_id`, `professor_id`) VALUES
(1, 1, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
