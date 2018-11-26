/*
 Navicat Premium Data Transfer

 Source Server         : vmware
 Source Server Type    : MariaDB
 Source Server Version : 50560
 Source Host           : mastermold:3306
 Source Schema         : sicmol

 Target Server Type    : MariaDB
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 26/11/2018 05:22:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` tinyint(4) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of areas
-- ----------------------------
INSERT INTO `areas` VALUES (1, 'Sistemas', 1);
INSERT INTO `areas` VALUES (7, 'Telemarketing', 0);
INSERT INTO `areas` VALUES (8, 'Ventas', 1);
INSERT INTO `areas` VALUES (9, 'Recursos Humanos', 1);
INSERT INTO `areas` VALUES (10, 'Odontología', 1);

-- ----------------------------
-- Table structure for emp_estados
-- ----------------------------
DROP TABLE IF EXISTS `emp_estados`;
CREATE TABLE `emp_estados`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` datetime(0) NOT NULL,
  `fin` datetime(0) NOT NULL,
  `motivo` tinyint(2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tiempo` int(11) NOT NULL DEFAULT 0,
  `obs` varchar(140) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `motivo`(`motivo`) USING BTREE,
  INDEX `usuario`(`usuario`) USING BTREE,
  CONSTRAINT `motivo` FOREIGN KEY (`motivo`) REFERENCES `emp_tipo_estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `empleados` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for emp_tipo_estado
-- ----------------------------
DROP TABLE IF EXISTS `emp_tipo_estado`;
CREATE TABLE `emp_tipo_estado`  (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of emp_tipo_estado
-- ----------------------------
INSERT INTO `emp_tipo_estado` VALUES (1, 'Inicio de gestión');
INSERT INTO `emp_tipo_estado` VALUES (2, 'Fin de gestión');
INSERT INTO `emp_tipo_estado` VALUES (3, 'Refrigerio');
INSERT INTO `emp_tipo_estado` VALUES (4, 'Baño');
INSERT INTO `emp_tipo_estado` VALUES (5, 'Reunión');
INSERT INTO `emp_tipo_estado` VALUES (6, 'Evento social');
INSERT INTO `emp_tipo_estado` VALUES (7, 'Permiso');
INSERT INTO `emp_tipo_estado` VALUES (8, 'Feedback');

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_1` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre_2` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido_paterno` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido_materno` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipo_doc` tinyint(4) NOT NULL,
  `num_doc` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_nac` date NULL DEFAULT NULL,
  `usuario` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clave` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telf1` int(11) NULL DEFAULT NULL,
  `telf2` int(11) NULL DEFAULT NULL,
  `foto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` tinyint(4) NOT NULL,
  `extension` int(11) NOT NULL,
  `sede` tinyint(4) NOT NULL,
  `perfil` tinyint(4) NOT NULL,
  `nivel` tinyint(4) NULL DEFAULT NULL,
  `pausa` tinyint(4) NOT NULL DEFAULT 0,
  `app` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_ingreso` date NULL DEFAULT NULL,
  `fecha_cese` date NULL DEFAULT NULL,
  `ult_accion` datetime(0) NULL DEFAULT NULL,
  `ult_pausa` datetime(0) NULL DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sedeID`(`sede`) USING BTREE,
  INDEX `areaID`(`area`) USING BTREE,
  INDEX `perfilID`(`perfil`) USING BTREE,
  INDEX `emp_tdoc`(`tipo_doc`) USING BTREE,
  CONSTRAINT `emp_area` FOREIGN KEY (`area`) REFERENCES `areas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_perfil` FOREIGN KEY (`perfil`) REFERENCES `perfiles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_sede` FOREIGN KEY (`sede`) REFERENCES `sedes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_tdoc` FOREIGN KEY (`tipo_doc`) REFERENCES `tipo_documento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (2, 'Carlos', 'Alberto', 'Sifuentes', 'Ludeña', 1, '41210610', '1982-02-24', 'admin', 'C0l0mbi@', NULL, NULL, NULL, NULL, NULL, 1, 500, 1, 1, 1, 0, 'ASS', '2018-11-25', NULL, NULL, '2018-11-26 04:22:24', 1);

-- ----------------------------
-- Table structure for especialidades
-- ----------------------------
DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE `especialidades`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` tinyint(3) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of especialidades
-- ----------------------------
INSERT INTO `especialidades` VALUES (1, 'Estomatología', 1);
INSERT INTO `especialidades` VALUES (2, 'Medicina general', 1);

-- ----------------------------
-- Table structure for extensiones
-- ----------------------------
DROP TABLE IF EXISTS `extensiones`;
CREATE TABLE `extensiones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NULL DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ext_usuario`(`usuario`) USING BTREE,
  CONSTRAINT `ext_usuario` FOREIGN KEY (`usuario`) REFERENCES `empleados` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of extensiones
-- ----------------------------
INSERT INTO `extensiones` VALUES (1, 500, 2, '2018-11-25');
INSERT INTO `extensiones` VALUES (2, 500, 2, '2018-11-26');

-- ----------------------------
-- Table structure for horario_medicos
-- ----------------------------
DROP TABLE IF EXISTS `horario_medicos`;
CREATE TABLE `horario_medicos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medico` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `inicio` time(0) NOT NULL,
  `fin` time(0) NOT NULL,
  `inicio_break` time(0) NULL DEFAULT NULL,
  `fin_break` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_hor_medico`(`medico`) USING BTREE,
  CONSTRAINT `fk_hor_medico` FOREIGN KEY (`medico`) REFERENCES `medicos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for medicos
-- ----------------------------
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_1` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_2` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido_paterno` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido_materno` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_doc` tinyint(4) NOT NULL,
  `num_doc` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ubicacion` tinyint(4) NOT NULL,
  `foto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ubicacion_medico`(`ubicacion`) USING BTREE,
  INDEX `fk_tdoc_medico`(`tipo_doc`) USING BTREE,
  CONSTRAINT `fk_tdoc_medico` FOREIGN KEY (`tipo_doc`) REFERENCES `tipo_documento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ubicacion_medico` FOREIGN KEY (`ubicacion`) REFERENCES `pivot_sede_especialidad` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` char(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `base` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `mes` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `orden` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `filtro` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `tclientes` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `tgestiones` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `tventas` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `tacciones` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `path` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `prefijo` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES (19, 'SAP', NULL, NULL, NULL, NULL, 1, 'sap_clientes', 'sap_gestiones', 'sap_ventas', NULL, NULL, '0');
INSERT INTO `modulos` VALUES (20, 'CVV', NULL, NULL, NULL, NULL, 1, 'cvv_clientes', 'cvv_gestiones', 'cvv_ventas', NULL, NULL, '0');
INSERT INTO `modulos` VALUES (21, 'ASS', NULL, NULL, NULL, NULL, 0, '', '', '', NULL, NULL, '0');
INSERT INTO `modulos` VALUES (22, 'MED', NULL, NULL, NULL, NULL, 1, 'med_clientes', '', '', NULL, NULL, '0');

-- ----------------------------
-- Table structure for pacientes
-- ----------------------------
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes`  (
  `id` int(11) NOT NULL,
  `tipo_doc` tinyint(1) NOT NULL,
  `num_doc` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre_1` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre_2` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido_paterno` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido_materno` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `sexo` enum('F','M') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` int(11) NULL DEFAULT NULL,
  `celular` int(11) NULL DEFAULT NULL,
  `correo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distrito` int(11) NULL DEFAULT NULL,
  `fecha_ingreso` datetime(0) NULL DEFAULT NULL,
  `sede` tinyint(4) NULL DEFAULT NULL,
  `estado` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_paciente_sede`(`sede`) USING BTREE,
  INDEX `fk_paciente_tdoc`(`tipo_doc`) USING BTREE,
  CONSTRAINT `fk_paciente_sede` FOREIGN KEY (`sede`) REFERENCES `sedes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_paciente_tdoc` FOREIGN KEY (`tipo_doc`) REFERENCES `tipo_documento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perfiles
-- ----------------------------
DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE `perfiles`  (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of perfiles
-- ----------------------------
INSERT INTO `perfiles` VALUES (1, 0, 'Administrador del sistema');
INSERT INTO `perfiles` VALUES (21, 1, 'Agente');
INSERT INTO `perfiles` VALUES (22, 1, 'Supervisor');

-- ----------------------------
-- Table structure for pivot_sede_especialidad
-- ----------------------------
DROP TABLE IF EXISTS `pivot_sede_especialidad`;
CREATE TABLE `pivot_sede_especialidad`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `sede` tinyint(4) NOT NULL,
  `especialidad` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fkp_sede`(`sede`) USING BTREE,
  INDEX `fkp_especialidad`(`especialidad`) USING BTREE,
  CONSTRAINT `fkp_especialidad` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fkp_sede` FOREIGN KEY (`sede`) REFERENCES `sedes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for registro_visitas
-- ----------------------------
DROP TABLE IF EXISTS `registro_visitas`;
CREATE TABLE `registro_visitas`  (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_ruta` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `v_usuario` int(11) NOT NULL,
  `v_fecha` date NULL DEFAULT NULL,
  `v_hora` datetime(0) NULL DEFAULT NULL,
  `v_sede` tinyint(4) NULL DEFAULT NULL,
  `v_ip` int(15) UNSIGNED NULL DEFAULT NULL,
  `v_browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `v_version` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `v_sistema` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `v_agente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`v_id`) USING BTREE,
  INDEX `v_usuario`(`v_usuario`) USING BTREE,
  INDEX `v_fecha`(`v_fecha`) USING BTREE,
  CONSTRAINT `visita_usuario` FOREIGN KEY (`v_usuario`) REFERENCES `empleados` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 446 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of registro_visitas
-- ----------------------------
INSERT INTO `registro_visitas` VALUES (1, '/sicmol/index.php', 2, '2018-11-25', '2018-11-25 21:49:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/index.php');
INSERT INTO `registro_visitas` VALUES (2, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 21:50:23', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/');
INSERT INTO `registro_visitas` VALUES (3, '/sicmol/acceso_denegado.php', 2, '2018-11-25', '2018-11-25 21:50:23', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/acceso_denegado.php?path=/sicmol/modulos/usuarios/index.php?&auth=ASS');
INSERT INTO `registro_visitas` VALUES (4, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 21:50:54', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php?');
INSERT INTO `registro_visitas` VALUES (5, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 21:51:37', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php?');
INSERT INTO `registro_visitas` VALUES (6, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:07:15', 1, 3232267777, 'Google Chrome', '70.0.3538.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (7, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:08:54', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/');
INSERT INTO `registro_visitas` VALUES (8, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:09:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/');
INSERT INTO `registro_visitas` VALUES (9, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:09:59', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/');
INSERT INTO `registro_visitas` VALUES (10, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:15:19', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php?');
INSERT INTO `registro_visitas` VALUES (11, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:15:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (12, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:16:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (13, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:17:49', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (14, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:17:49', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (15, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:18:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (16, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-25', '2018-11-25 22:18:21', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (17, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:18:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (18, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:18:23', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (19, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:18:23', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (20, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:18:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (21, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:23:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php');
INSERT INTO `registro_visitas` VALUES (22, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-25', '2018-11-25 22:23:43', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (23, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:23:44', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (24, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:23:46', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (25, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:23:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (26, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:23:49', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (27, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:23:53', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?id=2');
INSERT INTO `registro_visitas` VALUES (28, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:23:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (29, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:26:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (30, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:27:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (31, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:27:34', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?id=2');
INSERT INTO `registro_visitas` VALUES (32, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:28:23', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?id=2');
INSERT INTO `registro_visitas` VALUES (33, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:28:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (34, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:32:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (35, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:32:44', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (36, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:34:27', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?id=2');
INSERT INTO `registro_visitas` VALUES (37, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:39:40', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (38, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:40:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (39, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:40:41', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (40, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:43:53', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (41, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:44:06', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (42, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:46:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (43, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:46:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (44, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:46:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (45, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:46:59', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (46, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:47:53', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (47, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:49:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (48, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:50:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (49, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:50:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (50, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:52:06', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?id=2');
INSERT INTO `registro_visitas` VALUES (51, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 22:54:52', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?id=2');
INSERT INTO `registro_visitas` VALUES (52, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:57:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (53, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:57:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (54, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 22:59:07', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (55, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 22:59:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (56, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 22:59:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (57, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:00:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (58, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:00:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (59, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:02:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (60, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:02:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (61, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:02:07', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (62, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:03:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (63, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:03:12', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (64, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 23:03:19', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php?view&id=2');
INSERT INTO `registro_visitas` VALUES (65, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:03:29', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (66, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:03:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (67, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:03:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (68, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:03:40', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (69, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:06:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (70, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:06:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (71, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:06:56', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (72, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:06:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (73, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 23:08:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php');
INSERT INTO `registro_visitas` VALUES (74, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:08:43', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (75, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:10:13', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (76, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:10:14', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (77, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-25', '2018-11-25 23:10:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (78, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:10:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (79, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:10:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (80, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:10:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (81, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:10:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (82, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:17:30', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (83, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:17:42', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (84, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:17:44', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (85, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:17:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (86, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:17:49', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (87, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:18:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (88, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:19:00', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (89, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:19:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (90, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:19:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (91, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:20:43', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (92, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:20:44', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (93, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:22:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (94, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:22:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (95, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:22:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (96, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:22:06', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (97, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:22:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (98, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:22:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (99, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:22:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (100, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:22:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (101, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:22:32', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (102, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:23:29', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (103, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:23:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (104, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:23:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (105, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 23:23:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php');
INSERT INTO `registro_visitas` VALUES (106, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:23:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (107, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:23:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (108, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:23:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (109, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:26:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (110, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:27:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (111, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:27:41', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (112, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:27:42', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (113, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:27:51', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (114, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:27:56', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (115, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:28:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (116, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:28:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (117, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:28:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (118, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:29:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (119, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:29:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (120, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:29:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (121, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:29:37', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (122, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:29:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (123, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:31:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (124, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:31:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (125, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:31:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (126, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:31:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (127, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:31:40', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (128, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:35:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (129, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:35:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (130, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:35:52', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (131, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:35:52', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (132, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-25', '2018-11-25 23:35:54', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php');
INSERT INTO `registro_visitas` VALUES (133, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:35:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (134, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:36:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (135, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:36:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (136, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:36:14', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (137, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-25', '2018-11-25 23:37:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (138, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-25', '2018-11-25 23:37:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (139, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:37:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (140, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:37:50', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (141, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:37:50', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (142, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:37:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (143, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:38:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (144, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:38:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (145, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:38:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (146, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:38:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (147, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:38:12', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (148, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:38:12', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (149, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:38:15', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (150, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:39:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (151, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:39:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (152, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:39:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (153, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:39:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (154, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:39:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (155, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:41:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (156, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:41:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (157, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:41:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (158, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:41:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (159, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:41:50', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (160, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:41:51', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (161, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:41:54', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (162, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:41:59', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (163, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:42:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (164, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:43:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (165, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:43:28', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (166, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:43:32', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (167, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:43:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (168, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:44:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (169, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:48:27', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (170, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:48:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (171, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:49:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (172, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:49:54', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (173, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:49:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (174, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:49:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (175, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:50:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (176, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:50:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (177, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:50:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (178, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:50:56', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (179, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:50:59', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (180, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:51:00', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (181, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:52:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (182, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:52:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (183, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:58:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (184, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:58:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (185, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:58:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (186, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:58:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (187, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:59:34', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (188, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:59:37', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (189, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-25', '2018-11-25 23:59:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (190, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-25', '2018-11-25 23:59:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (191, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:03:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (192, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:03:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (193, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:03:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (194, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:04:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (195, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:04:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (196, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (197, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:15', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (198, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:04:21', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (199, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:04:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (200, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (201, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:50', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (202, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:51', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (203, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:52', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (204, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:04:55', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (205, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:04:55', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (206, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:04:56', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (207, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:05:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (208, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:05:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (209, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:05:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (210, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:05:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (211, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:05:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (212, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:05:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (213, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:05:28', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (214, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:05:28', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (215, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:05:30', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (216, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:05:30', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (217, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:05:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (218, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:05:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (219, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:05:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (220, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:06:53', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (221, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:06:59', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (222, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:07:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (223, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:07:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (224, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:09:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (225, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:09:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (226, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:09:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (227, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:09:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (228, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:09:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (229, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:10:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (230, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:10:30', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (231, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:10:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (232, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:10:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (233, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:11:15', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (234, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:11:47', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documentos');
INSERT INTO `registro_visitas` VALUES (235, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:12:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (236, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:12:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (237, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:12:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (238, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:12:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (239, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:12:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (240, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:12:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (241, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:12:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (242, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:12:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (243, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:12:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (244, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:14:19', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (245, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:14:19', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (246, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:14:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (247, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:14:21', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (248, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:15:55', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (249, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:15:55', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (250, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:15:56', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (251, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:18:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (252, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:18:12', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (253, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:18:13', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (254, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-26', '2018-11-26 00:18:14', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (255, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:18:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (256, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:18:23', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (257, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:18:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (258, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:18:32', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (259, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:18:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (260, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:18:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (261, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 00:20:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (262, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 00:20:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (263, '/sicmol/modulos/usuarios/nuevoUsuario.php', 2, '2018-11-26', '2018-11-26 00:20:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/nuevoUsuario.php');
INSERT INTO `registro_visitas` VALUES (264, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:21:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (265, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:06', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (266, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:13', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (267, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:15', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (268, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:21:15', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (269, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (270, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (271, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:21:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (272, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:21:27', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (273, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (274, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 00:21:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (275, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 00:21:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (276, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:19:51', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (277, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:19:53', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (278, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:22:24', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (279, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:22:25', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (280, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:22:36', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (281, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:22:52', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (282, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:23:26', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (283, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:23:26', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (284, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:23:31', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (285, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:23:35', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (286, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:23:39', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (287, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:24:08', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (288, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:24:09', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (289, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:24:11', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (290, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:24:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (291, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:24:21', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (292, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:24:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (293, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:25:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (294, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:25:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (295, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:25:13', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (296, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:25:13', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (297, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:25:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (298, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:25:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (299, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:28:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (300, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:28:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (301, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:28:19', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (302, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:28:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (303, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:28:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (304, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:28:29', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (305, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:28:29', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (306, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:28:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (307, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:28:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (308, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:28:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (309, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:28:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (310, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:28:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (311, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:28:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (312, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:29:29', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (313, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:29:30', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (314, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:29:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (315, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:29:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (316, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:29:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (317, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:31:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (318, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:31:17', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (319, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:31:20', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (320, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:31:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (321, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:31:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (322, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:31:32', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (323, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:31:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (324, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:38:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (325, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:38:06', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (326, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:38:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (327, '/sicmol/modulos/usuarios/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:38:14', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (328, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:38:14', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (329, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:42:43', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (330, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:42:45', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (331, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:42:47', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (332, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-26', '2018-11-26 04:42:48', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (333, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:42:50', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (334, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-26', '2018-11-26 04:42:51', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (335, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:42:54', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (336, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:42:59', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (337, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:43:00', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (338, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:43:00', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (339, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 04:44:20', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/index.php');
INSERT INTO `registro_visitas` VALUES (340, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:44:20', 1, 3232267777, 'Google Chrome', '69.0.3497.10', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.104', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (341, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:45:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (342, '/sicmol/modulos/usuarios/modulosAjax.php', 2, '2018-11-26', '2018-11-26 04:46:00', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (343, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:46:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (344, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:46:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (345, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:46:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (346, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:46:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (347, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:46:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (348, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:46:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (349, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 04:50:30', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (350, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:50:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (351, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:50:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (352, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:50:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (353, '/sicmol/modulos/medicos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:50:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (354, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:50:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (355, '/sicmol/modulos/medicos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:50:43', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (356, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:50:43', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (357, '/sicmol/modulos/medicos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:50:46', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (358, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:50:46', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (359, '/sicmol/modulos/medicos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 04:50:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (360, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:50:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (361, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 04:54:18', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (362, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:54:19', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (363, '/sicmol/modulos/medicos/modulosAjax.php', 2, '2018-11-26', '2018-11-26 04:54:54', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (364, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:54:55', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (365, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:54:57', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (366, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:54:58', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (367, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:54:59', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Documento');
INSERT INTO `registro_visitas` VALUES (368, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:55:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (369, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:55:03', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (370, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:55:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (371, '/sicmol/modulos/medicos/modulosAjax.php', 2, '2018-11-26', '2018-11-26 04:55:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (372, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:55:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (373, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:55:12', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (374, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 04:58:04', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (375, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:58:05', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (376, '/sicmol/modulos/medicos/modulosAjax.php', 2, '2018-11-26', '2018-11-26 04:58:08', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/modulosAjax.php');
INSERT INTO `registro_visitas` VALUES (377, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:58:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (378, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:58:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (379, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 04:58:37', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (380, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 04:58:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (381, '/sicmol/modulos/medicos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 04:58:40', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (382, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:01:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (383, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:01:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (384, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:01:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (385, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:01:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (386, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:01:55', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (387, '/sicmol/modulos/medicos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:02:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (388, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:02:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (389, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:02:45', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (390, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:02:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (391, '/sicmol/modulos/medicos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:02:50', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (392, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:02:50', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (393, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:03:28', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (394, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:04:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (395, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:05:00', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (396, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:05:01', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (397, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:05:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (398, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:05:22', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (399, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:05:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (400, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:05:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (401, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:05:25', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (402, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:05:37', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (403, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:05:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (404, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:05:42', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (405, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:05:46', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (406, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:05:47', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (407, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:05:48', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (408, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:06:34', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (409, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:06:34', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (410, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:06:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (411, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:12:00', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (412, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:12:00', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (413, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:12:02', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (414, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:14:53', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (415, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:16:10', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (416, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:16:11', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (417, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:16:16', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (418, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:16:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (419, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:16:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (420, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:16:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (421, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:16:34', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (422, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:16:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (423, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:16:36', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (424, '/sicmol/modulos/usuarios/index.php', 2, '2018-11-26', '2018-11-26 05:16:39', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/');
INSERT INTO `registro_visitas` VALUES (425, '/sicmol/modulos/usuarios/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:16:40', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (426, '/sicmol/modulos/usuarios/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:16:41', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/usuarios/SAP-Ajax.php?op=%C3%81rea');
INSERT INTO `registro_visitas` VALUES (427, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:19:32', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (428, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:19:33', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (429, '/sicmol/modulos/medicos/index.php', 2, '2018-11-26', '2018-11-26 05:19:34', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/');
INSERT INTO `registro_visitas` VALUES (430, '/sicmol/modulos/medicos/usuariosAjax.php', 2, '2018-11-26', '2018-11-26 05:19:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/medicos/usuariosAjax.php');
INSERT INTO `registro_visitas` VALUES (431, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:19:38', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (432, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:19:47', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (433, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:19:47', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (434, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:19:47', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (435, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:20:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (436, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:20:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (437, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:09', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (438, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:24', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Perfil');
INSERT INTO `registro_visitas` VALUES (439, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:26', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (440, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:27', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Sede');
INSERT INTO `registro_visitas` VALUES (441, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:28', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (442, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:20:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (443, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:31', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');
INSERT INTO `registro_visitas` VALUES (444, '/sicmol/modulos/newSedeAreaPerfil.php', 2, '2018-11-26', '2018-11-26 05:20:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/newSedeAreaPerfil.php');
INSERT INTO `registro_visitas` VALUES (445, '/sicmol/modulos/SAP-Ajax.php', 2, '2018-11-26', '2018-11-26 05:20:35', 1, 3232267777, 'Firefox', '64.0', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', '/sicmol/modulos/SAP-Ajax.php?op=Especialidad');

-- ----------------------------
-- Table structure for sedes
-- ----------------------------
DROP TABLE IF EXISTS `sedes`;
CREATE TABLE `sedes`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` tinyint(3) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sedes
-- ----------------------------
INSERT INTO `sedes` VALUES (1, 'Central', 0);
INSERT INTO `sedes` VALUES (5, 'Bucaramanga', 0);
INSERT INTO `sedes` VALUES (6, 'Bogotá', 0);

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` tinyint(3) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES (1, 'DNI', 1);
INSERT INTO `tipo_documento` VALUES (2, 'CE', 1);
INSERT INTO `tipo_documento` VALUES (29, 'FFF', 1);

SET FOREIGN_KEY_CHECKS = 1;
