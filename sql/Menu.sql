-- core_menu
DROP TABLE IF EXISTS `core_menu`;
CREATE TABLE `core_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pai` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `icone` varchar(60) DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- core_menu_perfil
DROP TABLE IF EXISTS `core_menu_perfil`;
CREATE TABLE `core_menu_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_core_menu_perfil_1menu_idx` (`id_menu`),
  KEY `fk_core_menu_perfil_perfil_idx` (`id_perfil`),
  CONSTRAINT `fk_core_menu_perfil_1menu` FOREIGN KEY (`id_menu`) REFERENCES `core_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_core_menu_perfil_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `core_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;