-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para asobeecol
CREATE DATABASE IF NOT EXISTS `asobeecol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `asobeecol`;

-- Volcando estructura para tabla asobeecol.brigadista
CREATE TABLE IF NOT EXISTS `brigadista` (
  `idBrigadista` int(10) NOT NULL,
  `nombreBrigadista` varchar(50) NOT NULL,
  `profesion` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `rol` int(1) NOT NULL,
  `empresa` int(2) NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `rh` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cambioContrasenia` text DEFAULT NULL,
  `nuevaPassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idBrigadista`) USING BTREE,
  KEY `roll` (`rol`) USING BTREE,
  KEY `sede` (`empresa`) USING BTREE,
  CONSTRAINT `FK_brigadista_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`idEmpresa`),
  CONSTRAINT `FK_brigadista_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.brigadista: ~3 rows (aproximadamente)
REPLACE INTO `brigadista` (`idBrigadista`, `nombreBrigadista`, `profesion`, `email`, `password`, `fechaInicio`, `rol`, `empresa`, `pais`, `departamento`, `ciudad`, `direccion`, `rh`, `celular`, `estado`, `cambioContrasenia`, `nuevaPassword`) VALUES
	(123, 'GG', 'Ingeniero', 'ggg@gmail.com', 'HolaMundo', '2023-04-20', 1, 1, 'Colombia', 'Nariño', 'Ospina', 'Carrera 42a 1542', 'B+', '3221456', 'Activo', 'NO', ''),
	(1089848254, 'Juan Maya', 'Ingeniero de sistemas', 'juanmaya9902@gmail.com', '1089848254', '2011-04-19', 3, 1, 'Colombia', 'Nariño', 'Pasto', 'Crra 42a 15-42', 'B+', '3114211545', 'Activo', 'SI', NULL),
	(2147483647, 'Andres Salazar', 'Médico', 'andrees@gmail.com', '99021900202', '2023-02-19', 3, 1, 'Colombia', 'Nariño', 'Ospina', 'Crra 5 10-05', 'A+', '3234465896', 'Inactivo', 'NO', NULL);

-- Volcando estructura para tabla asobeecol.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `brigadista` int(11) NOT NULL,
  `nombreCurso` varchar(50) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `intensidadHoraria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCurso`),
  KEY `FK__brigadista` (`brigadista`),
  CONSTRAINT `FK__brigadista` FOREIGN KEY (`brigadista`) REFERENCES `brigadista` (`idBrigadista`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.cursos: ~1 rows (aproximadamente)
REPLACE INTO `cursos` (`idCurso`, `brigadista`, `nombreCurso`, `fechaInicio`, `fechaFin`, `lugar`, `intensidadHoraria`) VALUES
	(11, 123, 'gg', '2023-05-19', '2023-05-20', 'Udenar', 8);

-- Volcando estructura para tabla asobeecol.donacion
CREATE TABLE IF NOT EXISTS `donacion` (
  `idDonacion` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `edad` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `prioridad` varchar(50) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  `brigadista` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `donado` varchar(50) DEFAULT NULL,
  `almacen` varchar(50) DEFAULT NULL,
  `tipoDonante` varchar(50) DEFAULT NULL,
  `nombreDonante` varchar(50) DEFAULT NULL,
  `documentoDonante` int(11) DEFAULT NULL,
  `celularDonante` int(11) DEFAULT NULL,
  `paisDonante` varchar(50) DEFAULT NULL,
  `departamentoDonante` varchar(50) DEFAULT NULL,
  `ciudadDonante` varchar(50) DEFAULT NULL,
  `direccionDonante` varchar(50) DEFAULT NULL,
  `comprobanteDinero` blob DEFAULT NULL,
  PRIMARY KEY (`idDonacion`),
  KEY `FK_donacion_brigadista` (`brigadista`),
  CONSTRAINT `FK_donacion_brigadista` FOREIGN KEY (`brigadista`) REFERENCES `brigadista` (`idBrigadista`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.donacion: ~4 rows (aproximadamente)
REPLACE INTO `donacion` (`idDonacion`, `tipo`, `genero`, `edad`, `cantidad`, `prioridad`, `fechaEntrega`, `descripcion`, `observaciones`, `brigadista`, `estado`, `fechaSalida`, `donado`, `almacen`, `tipoDonante`, `nombreDonante`, `documentoDonante`, `celularDonante`, `paisDonante`, `departamentoDonante`, `ciudadDonante`, `direccionDonante`, `comprobanteDinero`) VALUES
	(21, 'Alimentos', 'Masculino', '11-20 años', 12, 'Alta', '2023-05-02', 'Sardinas', 'latas', 1089848254, 'Recibida', NULL, NULL, NULL, 'Empresa', 'Unimar', 1, 748895632, 'Colombia', 'Nariño', 'Pasto', 'Centro', NULL),
	(22, 'Prendas', 'Masculino', '11-20 años', 2, 'Media', '2023-05-02', 'Sudaderas', 'Sudaderas', 1089848254, 'Recibida', NULL, NULL, NULL, 'Empresa', 'Alkosto', 3, 12354856, 'Colombia', 'Nariño', 'Ipiales', 'Crra 15 20-45', NULL),
	(23, 'Equipos', 'undefined', 'undefined', 2, 'Media', '2023-05-02', 'Radio Comunicación', 'Perfecto estado', 1089848254, 'Recibida', NULL, NULL, NULL, 'Particular', 'Fernando Maya', 2147483647, 311454872, 'Colombia', 'Nariño', 'Ospina', 'Crra 2 15-10', NULL),
	(24, 'Dinero', 'undefined', 'undefined', 50000, 'Media', '2023-05-02', 'undefined', '50.000 mil pesos', 1089848254, 'Recibida', NULL, NULL, NULL, 'Empresa', 'Unimar', 1, 748895632, 'Colombia', 'Nariño', 'Pasto', 'Centro', NULL);

-- Volcando estructura para tabla asobeecol.dotacion
CREATE TABLE IF NOT EXISTS `dotacion` (
  `idDotacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDotacion` varchar(50) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDotacion`),
  KEY `FK_dotacion_empresa` (`empresa`),
  CONSTRAINT `FK_dotacion_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.dotacion: ~3 rows (aproximadamente)
REPLACE INTO `dotacion` (`idDotacion`, `nombreDotacion`, `empresa`, `tipo`, `estado`, `observacion`) VALUES
	(1, 'Camillas', 1, 'Camilla', 'Disponible', 'En perfecto estado'),
	(2, 'Martillo', 1, 'Martillo', 'Disponible', 'Nais');

-- Volcando estructura para tabla asobeecol.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.empresa: ~8 rows (aproximadamente)
REPLACE INTO `empresa` (`idEmpresa`, `nombreEmpresa`, `tipo`, `celular`, `pais`, `departamento`, `ciudad`, `direccion`) VALUES
	(1, 'Unimar', 'Privada', 748895632, 'Colombia', 'Nariño', 'Pasto', 'Centro'),
	(2, 'Ceviche', 'Privada', 57432156, 'Colombia', 'Nariño', 'Tumaco', 'Crra 42 52-15'),
	(3, 'Alkosto', 'Privada', 12354856, 'Colombia', 'Nariño', 'Ipiales', 'Crra 15 20-45'),
	(4, 'Bancolombia', 'Privada', 54123, 'Colombia', 'Nariño', 'La Unión', 'Crra 2 10-5'),
	(5, 'Banco Agrario', 'Privada', 55359421, 'Colombia', 'Nariño', 'San Pablo', 'Crra 3 20-10'),
	(6, 'Bigo', 'Privada', 7433247, 'Colombia', 'Nariño', 'La Cruz', 'Crra 15 30-05'),
	(7, 'Lacteos BellaVista', 'Privada', 54321, 'Colombia', 'Nariño', 'Pasto', 'Carrera 10 15-05'),
	(6969, 'GGGG', 'Publica', 12345, 'Ecuador', 'Carchi', 'Tulcan', 'Carrera 12 12-45');

-- Volcando estructura para tabla asobeecol.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEvento` varchar(50) DEFAULT NULL,
  `detalleEvento` varchar(300) DEFAULT NULL,
  `lugarEvento` varchar(50) DEFAULT NULL,
  `horarioEvento` time DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.eventos: ~1 rows (aproximadamente)
REPLACE INTO `eventos` (`idEvento`, `nombreEvento`, `detalleEvento`, `lugarEvento`, `horarioEvento`, `fechaInicio`, `fechaFin`) VALUES
	(1, 'Primeros Auxilios', 'son aquellas medidas inmediatas que se toman en una persona lesionada, inconsciente o súbitamente enferma', 'Universidad Mariana', '15:30:00', '2023-06-10', '2023-06-17');

-- Volcando estructura para tabla asobeecol.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int(10) NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idRol`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla asobeecol.rol: ~3 rows (aproximadamente)
REPLACE INTO `rol` (`idRol`, `nombreRol`) VALUES
	(1, 'Usuario'),
	(2, 'Coordinador'),
	(3, 'Administrador');

-- Volcando estructura para vista asobeecol.vbrigadista
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vbrigadista` (
	`idBrigadista` INT(10) NOT NULL,
	`nombreBrigadista` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`password` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nuevaPassword` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`fechaInicio` DATE NOT NULL,
	`idRol` INT(10) NOT NULL,
	`profesion` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nombreRol` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`idEmpresa` INT(11) NOT NULL,
	`nombreEmpresa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`pais` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`departamento` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`ciudad` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`direccion` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`rh` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`celular` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`cambioContrasenia` TEXT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista asobeecol.vcursos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vcursos` (
	`idCurso` INT(11) NOT NULL,
	`brigadista` INT(11) NOT NULL,
	`nombreCurso` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`fechaInicio` DATE NULL,
	`fechaFin` DATE NULL,
	`lugar` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`intensidadHoraria` INT(11) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista asobeecol.vdonacion
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vdonacion` (
	`idDonacion` INT(11) NOT NULL,
	`fechaEntrega` DATE NULL,
	`tipo` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`genero` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`edad` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`prioridad` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`cantidad` INT(11) NULL,
	`descripcion` VARCHAR(300) NULL COLLATE 'utf8mb4_general_ci',
	`observaciones` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`idBrigadista` INT(10) NOT NULL,
	`almacen` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nombreBrigadista` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`fechaSalida` DATE NULL,
	`donado` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`tipoDonante` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nombreDonante` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`documentoDonante` INT(11) NULL,
	`celularDonante` INT(11) NULL,
	`paisDonante` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`departamentoDonante` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`ciudadDonante` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`direccionDonante` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista asobeecol.vdotacion
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vdotacion` (
	`idDotacion` INT(11) NOT NULL,
	`nombreDotacion` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`idEmpresa` INT(11) NOT NULL,
	`nombreEmpresa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`tipo` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`observacion` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista asobeecol.veventos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `veventos` (
	`idEvento` INT(11) NOT NULL,
	`nombreEvento` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`detalleEvento` VARCHAR(300) NULL COLLATE 'utf8mb4_general_ci',
	`lugarEvento` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`horarioEvento` TIME NULL,
	`fechaInicio` DATE NULL,
	`fechaFin` DATE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista asobeecol.vbrigadista
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vbrigadista`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vbrigadista` AS SELECT b.idBrigadista, b.nombreBrigadista,b.email, b.`password`,b.nuevaPassword,b.estado, b.fechaInicio,r.idRol,b.profesion, r.nombreRol,e.idEmpresa, e.nombreEmpresa, b.pais,b.departamento, b.ciudad, b.direccion, b.rh, b.celular , b.cambioContrasenia
FROM brigadista b, rol r, empresa e WHERE b.rol = r.idRol AND  b.empresa = e.idEmpresa ;

-- Volcando estructura para vista asobeecol.vcursos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vcursos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vcursos` AS SELECT  c.idCurso, c.brigadista, c.nombreCurso,c.fechaInicio,c.fechaFin, c.lugar,c.intensidadHoraria FROM brigadista b, cursos c WHERE c.brigadista = b.idBrigadista ;

-- Volcando estructura para vista asobeecol.vdonacion
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vdonacion`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vdonacion` AS SELECT d.idDonacion, d.fechaEntrega , d.tipo,d.genero, d.edad, d.prioridad,d.cantidad,d.descripcion,d.observaciones, b.idBrigadista,d.almacen, b.nombreBrigadista,b.email, d.fechaSalida,d.donado,d.estado, d.tipoDonante, d.nombreDonante, d.documentoDonante, d.celularDonante, d.paisDonante, d.departamentoDonante,d.ciudadDonante, d.direccionDonante FROM brigadista b, donacion d WHERE b.idBrigadista=d.brigadista ;

-- Volcando estructura para vista asobeecol.vdotacion
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vdotacion`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vdotacion` AS SELECT d.idDotacion,d.nombreDotacion,e.idEmpresa, e.nombreEmpresa,d.tipo, d.estado, d.observacion FROM dotacion d, empresa e WHERE d.empresa = e.idEmpresa ;

-- Volcando estructura para vista asobeecol.veventos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `veventos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `veventos` AS SELECT * FROM eventos ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
