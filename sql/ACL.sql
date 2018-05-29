-- core_usuario
DROP TABLE IF EXISTS `core_usuario`;
CREATE TABLE `core_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(40) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- core_perfil
DROP TABLE IF EXISTS `core_perfil`;
CREATE TABLE `core_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- core_usuario_perfil
DROP TABLE IF EXISTS `core_usuario_perfil`;
CREATE TABLE `core_usuario_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_core_usuario_perfil_idx` (`id_usuario`),
  KEY `fk_core_usuario_perfil_perfil_idx` (`id_perfil`),
  CONSTRAINT `fk_core_usuario_perfil_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `core_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_core_usuario_perfil_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `core_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- core_controller
DROP TABLE IF EXISTS `core_controller`;
CREATE TABLE `core_controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- core_metodo
DROP TABLE IF EXISTS `core_metodo`;
CREATE TABLE `core_metodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_controller` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_core_metodo_1_idx` (`id_controller`),
  CONSTRAINT `fk_core_metodo_1` FOREIGN KEY (`id_controller`) REFERENCES `core_controller` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- core_permissao
DROP TABLE IF EXISTS `core_permissao`;
CREATE TABLE `core_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_metodo` int(11) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_core_permissao_2_idx` (`id_metodo`),
  KEY `fk_core_permissao_1_idx` (`id_perfil`),
  CONSTRAINT `fk_core_permissao_metodo` FOREIGN KEY (`id_metodo`) REFERENCES `core_metodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_core_permissao_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `core_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;