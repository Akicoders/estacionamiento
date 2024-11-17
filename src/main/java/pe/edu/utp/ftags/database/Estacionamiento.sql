-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.16-MariaDB - FreeBSD Ports
-- Server OS:                    FreeBSD13.2
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for Estacionamiento
CREATE DATABASE IF NOT EXISTS `Estacionamiento` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `Estacionamiento`;

-- Dumping structure for table Estacionamiento.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del administador',
  `nombre` varchar(50) NOT NULL DEFAULT 'Ingresar Nombre',
  `fechaContrato` datetime NOT NULL,
  `dni` varchar(8) NOT NULL,
  `idEstacionamiento` int(11) NOT NULL DEFAULT 0,
  `clave` varchar(150) NOT NULL DEFAULT '',
  `cuenta` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_administrador_estacionamiento` (`idEstacionamiento`),
  CONSTRAINT `FK_administrador_estacionamiento` FOREIGN KEY (`idEstacionamiento`) REFERENCES `estacionamiento` (`idEstacionamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla de administrador donde estaran repartidos por cada Estacionamiento :D';

-- Dumping data for table Estacionamiento.administrador: ~10 rows (approximately)
INSERT INTO `administrador` (`id`, `nombre`, `fechaContrato`, `dni`, `idEstacionamiento`, `clave`, `cuenta`) VALUES
	(1, 'Paul Campos Terrones', '2024-11-17 03:49:52', '76898989', 1, '65de984edd4d4c2c1854df6baf257fa1', 'paulcito'),
	(5, 'Juanpi Sanandres Vela', '2024-11-17 03:54:49', '98786753', 2, '11d90554f73e5aac222e6b6eb99654e3', 'juanpidev'),
	(6, 'Fernando Diaz', '2024-11-17 03:56:12', '98767856', 3, '7925c72fe467f421fdb0f1fd84331fcf', 'fidiaz'),
	(7, 'Akihito Hiraga', '2024-11-17 03:57:17', '98765645', 4, '9be6c372798a10d20f92afabdb244b76', 'akidev'),
	(8, 'Victor Cabanillas', '2024-11-17 03:57:56', '89786756', 5, '17a821dfa961c93a6c586ca257750fb2', 'victor'),
	(9, ' Nrober Backend', '2024-11-17 03:58:59', '98767854', 6, 'd1221ad5363ba79b1cd4a8b2d21ea1c0', 'nrober'),
	(11, 'Richarlisson Pisfil', '2024-11-17 03:59:31', '45637821', 7, 'f2a46c2e2f0b81c20b9ed0a7643d179f', 'ricardo'),
	(12, 'Abraham Cooper', '2024-11-17 04:01:47', '46768721', 8, '233d2b72e50ae8f5929f202e64255c4e', 'cooper'),
	(13, 'AkiCoder', '2024-11-17 04:02:17', '45678743', 9, '1268975a6d34acd5b92840654528d66f', 'akicoder'),
	(14, 'Gustavo Abad', '2024-11-17 04:03:54', '67876523', 10, '3dcaf41f68e54c7d0228154105558f61', 'quispe');

-- Dumping structure for table Estacionamiento.conductor
CREATE TABLE IF NOT EXISTS `conductor` (
  `idConductor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del conductor',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del conductor, entre 2 y 20 caracteres',
  `dni` char(8) NOT NULL COMMENT 'Documento Nacional de Identidad del conductor, 8 dígitos',
  PRIMARY KEY (`idConductor`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los datos de los conductores';

-- Dumping data for table Estacionamiento.conductor: ~8 rows (approximately)
INSERT INTO `conductor` (`idConductor`, `nombre`, `dni`) VALUES
	(2, 'María Lopez', '23456789'),
	(3, 'Juan Garcia', '34567890'),
	(4, 'Ana Torres', '45678901'),
	(6, 'Pedro Sanchez', '67890123'),
	(7, 'Laura Gomez', '78901234'),
	(8, 'Jorge Ruiz', '89012345'),
	(10, 'Miguel Diaz', '01234567');

-- Dumping structure for table Estacionamiento.estacionamiento
CREATE TABLE IF NOT EXISTS `estacionamiento` (
  `idEstacionamiento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del estacionamiento',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del estacionamiento',
  `idAdministrador` int(11) NOT NULL COMMENT 'Identificador único del administrador asignado',
  PRIMARY KEY (`idEstacionamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los estacionamientos disponibles';

-- Dumping data for table Estacionamiento.estacionamiento: ~10 rows (approximately)
INSERT INTO `estacionamiento` (`idEstacionamiento`, `nombre`, `idAdministrador`) VALUES
	(1, 'Estacionamiento Cyberpunk Central', 1),
	(2, 'Estacionamiento Cyberpunk  Norte', 2),
	(3, 'Estacionamiento Cyberpunk  Sur', 3),
	(4, 'Estacionamiento Cyberpunk  Este', 4),
	(5, 'Estacionamiento Cyberpunk  Oeste', 5),
	(6, 'Estacionamiento Cyberpunk  Plaza', 6),
	(7, 'Estacionamiento Cyberpunk  Aeropuerto', 7),
	(8, 'Estacionamiento Cyberpunk  Mall', 8),
	(9, 'Estacionamiento Cyberpunk  Parque', 9),
	(10, 'Estacionamiento Cyberpunk  Estadio', 10);

-- Dumping structure for procedure Estacionamiento.mostrar_suscripciones
DELIMITER //
//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_AgregarAdministrador
DELIMITER //
CREATE PROCEDURE `pr_AgregarAdministrador`(
	IN `p_nombre` VARCHAR(50),
	IN `p_fechaContrato` DATETIME,
	IN `p_dni` VARCHAR(8),
	IN `p_idEstacionamiento` INT,
	IN `p_clave` VARCHAR(150),
	IN `p_cuenta` VARCHAR(50)
)
BEGIN
    INSERT INTO administrador (nombre, fechaContrato, dni, idEstacionamiento, clave, cuenta)
    VALUES (p_nombre, p_fechaContrato, p_dni, p_idEstacionamiento, p_clave, p_cuenta);
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_EditarClaveAdministrador
DELIMITER //
CREATE PROCEDURE `pr_EditarClaveAdministrador`(
	IN `p_cuenta` VARCHAR(50),
	IN `p_nuevaClave` VARCHAR(150),
	OUT `p_informacion` JSON
)
BEGIN
    -- Declarar variables locales para almacenar la información del administrador
    DECLARE v_nombre VARCHAR(50);
    DECLARE v_fechaContrato DATETIME;
    DECLARE v_dni VARCHAR(8);
    DECLARE cuenta_existe BOOLEAN;

    -- Verificar si la cuenta existe
    SELECT COUNT(*) > 0
    INTO cuenta_existe
    FROM administrador
    WHERE cuenta = p_cuenta;

    IF cuenta_existe THEN
        -- Actualizar la clave
        UPDATE administrador
        SET clave = p_nuevaClave
        WHERE cuenta = p_cuenta;
        
        -- Obtener la información
        SELECT nombre, fechaContrato, dni, cuenta
        INTO v_nombre, v_fechaContrato, v_dni, p_cuenta
        FROM administrador
        WHERE cuenta = p_cuenta;
        
        -- Formatear la información como JSON
        SET p_informacion = JSON_OBJECT(
            'nombre', v_nombre,
            'fechaContrato', v_fechaContrato,
            'dni', v_dni,
            'cuenta', p_cuenta
        );
    ELSE
        -- Si la cuenta no existe, devolver un mensaje de error
        SET p_informacion = JSON_OBJECT('error', 'La cuenta no existe');
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_MostrarConductorporId
DELIMITER //
CREATE PROCEDURE `pr_MostrarConductorporId`(
	IN `p_IdEntrada` INT
)
BEGIN
	 SELECT 
        re.idRegistroEntrada AS ID_RegistroEntrada,
        re.idConductor AS ID_Conductor,
        re.idVehiculo AS ID_Vehiculo,
        e.nombre AS NombreEstacionamiento,
        c.nombre AS NombreConductor,
        c.dni AS DniConductor,
        v.placa AS PlacaVehiculo,
        v.tipo AS TipoVehiculo,
        IF(re.lavadoSolicitado, 'Sí', 'No') AS LavadoSolicitado,
        re.fechaHoraEntrada AS FechaHoraEntrada
    FROM registroentrada re
    JOIN estacionamiento e ON re.idEstacionamiento = e.idEstacionamiento
    JOIN conductor c ON re.idConductor = c.idConductor
    JOIN vehiculo v ON re.idVehiculo = v.idVehiculo
    WHERE re.idRegistroEntrada = p_IdEntrada;
    
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_MostrarRegistrosEntrada
DELIMITER //
CREATE PROCEDURE `pr_MostrarRegistrosEntrada`()
BEGIN
    SELECT 
        re.idRegistroEntrada AS ID_RegistroEntrada,
        re.idConductor AS ID_Conductor,
        re.idVehiculo AS ID_Vehiculo,
        e.nombre AS NombreEstacionamiento,
        c.nombre AS NombreConductor,
        c.dni AS DniConductor,
        v.placa AS PlacaVehiculo,
        v.tipo AS TipoVehiculo,
        IF(re.lavadoSolicitado, 'Sí', 'No') AS LavadoSolicitado,
        re.fechaHoraEntrada AS FechaHoraEntrada
    FROM registroentrada re
    JOIN estacionamiento e ON re.idEstacionamiento = e.idEstacionamiento
    JOIN conductor c ON re.idConductor = c.idConductor
    JOIN vehiculo v ON re.idVehiculo = v.idVehiculo
    ORDER BY re.fechaHoraEntrada DESC;
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_MostrarRegistrosSalida
DELIMITER //
CREATE PROCEDURE `pr_MostrarRegistrosSalida`()
BEGIN
    SELECT 
        rs.idRegistroSalida AS ID_RegistroSalida,
        e.nombre AS NombreEstacionamiento,
        rs.nombre AS NombreConductor,
        rs.placa AS PlacaVehiculo,
        rs.tipo AS TipoVehiculo,
        IF(rs.lavadoSolicitado, 'Sí', 'No') AS LavadoSolicitado,
        rs.fechaHoraEntrada AS FechaHoraEntrada,
        rs.fechaHoraSalida AS FechaHoraSalida,
        rs.total AS Total
    FROM registrosalida rs INNER
    JOIN estacionamiento e ON rs.idEstacionamiento = e.idEstacionamiento
    ORDER BY rs.fechaHoraSalida DESC;	
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_RegistrarEntrada
DELIMITER //
CREATE PROCEDURE `pr_RegistrarEntrada`(
	IN `p_nombreConductor` VARCHAR(50),
	IN `p_dniConductor` VARCHAR(8),
	IN `p_tipoVehiculo` VARCHAR(50),
	IN `p_placaVehiculo` VARCHAR(6),
	IN `p_fechaHoraEntrada` DATETIME,
	IN `p_lavadoSolicitado` BOOLEAN
)
BEGIN
    DECLARE v_idConductor INT;
    DECLARE v_idVehiculo INT;

    
    SELECT idConductor INTO v_idConductor
    FROM conductor
    WHERE dni = p_dniConductor;

    
    IF v_idConductor IS NULL THEN
        INSERT INTO conductor (nombre, dni)
        VALUES (p_nombreConductor, p_dniConductor);
        SET v_idConductor = LAST_INSERT_ID();
    END IF;

    
    SELECT idVehiculo INTO v_idVehiculo
    FROM vehiculo
    WHERE placa = p_placaVehiculo;

    
    IF v_idVehiculo IS NULL THEN
        INSERT INTO vehiculo (placa, tipo)
        VALUES (p_placaVehiculo, p_tipoVehiculo);
        SET v_idVehiculo = LAST_INSERT_ID();
    END IF;

    
    INSERT INTO registroentrada (idEstacionamiento, idConductor, idVehiculo, fechaHoraEntrada, lavadoSolicitado)
    VALUES (1, v_idConductor, v_idVehiculo, p_fechaHoraEntrada, p_lavadoSolicitado);

END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_RegistrarSalida
DELIMITER //
CREATE PROCEDURE `pr_RegistrarSalida`(
	IN `p_idRegistroEntrada` INT,
	IN `p_nombreConductor` VARCHAR(50),
	IN `p_tipoVehiculo` VARCHAR(50),
	IN `p_placaVehiculo` VARCHAR(6),
	IN `p_lavado` TINYINT,
	IN `p_fechaHoraEntrada` DATETIME,
	IN `p_fechaHoraSalida` DATETIME,
	IN `p_total` DOUBLE(11,2),
	IN `p_idConductor` INT,
	IN `p_idVehiculo` INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM registroentrada WHERE idRegistroEntrada = p_idRegistroEntrada) THEN
	    DELETE FROM registroentrada WHERE idRegistroEntrada = p_idRegistroEntrada;
	    DELETE FROM conductor WHERE idConductor = p_idConductor;
	    DELETE FROM vehiculo WHERE idVehiculo = p_idVehiculo;
	    INSERT INTO registrosalida (idEstacionamiento, nombre, tipo, placa, lavadoSolicitado, fechaHoraEntrada, fechaHoraSalida, total)
	        VALUES (1, p_nombreConductor, p_tipoVehiculo, p_placaVehiculo, p_lavado, p_fechaHoraEntrada, p_fechaHoraSalida, p_total);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registro de entrada no existe';
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.pr_VerificarCredencialesAdministrador
DELIMITER //
CREATE PROCEDURE `pr_VerificarCredencialesAdministrador`(
	IN `p_cuenta` VARCHAR(50),
	IN `p_clave` VARCHAR(150),
	OUT `p_valido` BOOLEAN
)
BEGIN
    DECLARE cuenta_existe BOOLEAN;
    DECLARE clave_correcta BOOLEAN;
    
    -- Verificar si la cuenta existe
    SELECT COUNT(*) > 0
    INTO cuenta_existe
    FROM administrador
    WHERE cuenta = p_cuenta;
    
    -- Verificar si la clave es correcta
    SELECT COUNT(*) > 0
    INTO clave_correcta
    FROM administrador
    WHERE cuenta = p_cuenta AND clave = p_clave;
    
    -- Confirmar si ambas son válidas
    SET p_valido = cuenta_existe AND clave_correcta;
END//
DELIMITER ;

-- Dumping structure for procedure Estacionamiento.registrar_suscripcion
DELIMITER //
//
DELIMITER ;

-- Dumping structure for table Estacionamiento.registroentrada
CREATE TABLE IF NOT EXISTS `registroentrada` (
  `idRegistroEntrada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del registro de entrada',
  `idEstacionamiento` int(11) NOT NULL COMMENT 'Llave foránea del estacionamiento',
  `idConductor` int(11) NOT NULL COMMENT 'Llave foránea del conductor',
  `idVehiculo` int(11) NOT NULL COMMENT 'Llave foránea del vehículo',
  `fechaHoraEntrada` datetime NOT NULL COMMENT 'Fecha y hora de la entrada',
  `lavadoSolicitado` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Indica si se solicitó el servicio de lavado (TRUE o FALSE)',
  PRIMARY KEY (`idRegistroEntrada`),
  KEY `idEstacionamiento` (`idEstacionamiento`),
  KEY `idConductor` (`idConductor`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `RegistroEntrada_ibfk_1` FOREIGN KEY (`idEstacionamiento`) REFERENCES `estacionamiento` (`idEstacionamiento`),
  CONSTRAINT `RegistroEntrada_ibfk_2` FOREIGN KEY (`idConductor`) REFERENCES `conductor` (`idConductor`),
  CONSTRAINT `RegistroEntrada_ibfk_3` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los registros de entrada de vehículos';

-- Dumping data for table Estacionamiento.registroentrada: ~7 rows (approximately)
INSERT INTO `registroentrada` (`idRegistroEntrada`, `idEstacionamiento`, `idConductor`, `idVehiculo`, `fechaHoraEntrada`, `lavadoSolicitado`) VALUES
	(2, 2, 2, 2, '2024-10-01 09:00:00', 0),
	(3, 3, 3, 3, '2024-10-01 10:00:00', 1),
	(4, 4, 4, 4, '2024-10-02 11:00:00', 0),
	(6, 6, 6, 6, '2024-10-02 13:00:00', 0),
	(7, 7, 7, 7, '2024-10-03 14:00:00', 1),
	(8, 8, 8, 8, '2024-10-03 15:00:00', 0);

-- Dumping structure for table Estacionamiento.registrosalida
CREATE TABLE IF NOT EXISTS `registrosalida` (
  `idRegistroSalida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del registro de salida',
  `idEstacionamiento` int(11) NOT NULL COMMENT 'Llave foránea del estacionamiento',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del conductor, entre 2 y 20 caracteres',
  `tipo` varchar(50) NOT NULL COMMENT 'Tipo de vehículo (Auto, Moto, etc.)',
  `placa` varchar(6) NOT NULL COMMENT 'Placa del vehículo (6 caracteres alfanuméricos)',
  `lavadoSolicitado` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Indica si se solicitó el servicio de lavado (TRUE o FALSE)',
  `fechaHoraEntrada` datetime NOT NULL COMMENT 'Fecha y hora de la entrada',
  `fechaHoraSalida` datetime NOT NULL COMMENT 'Fecha y hora de la salida o culminación',
  `total` double(11,2) unsigned NOT NULL COMMENT 'El costo total de la reserva',
  PRIMARY KEY (`idRegistroSalida`),
  KEY `idEstacionamiento` (`idEstacionamiento`),
  CONSTRAINT `RegistroSalida_ibfk_1` FOREIGN KEY (`idEstacionamiento`) REFERENCES `estacionamiento` (`idEstacionamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los registros de salida de vehículos y el fin de la reserva';

-- Dumping data for table Estacionamiento.registrosalida: ~2 rows (approximately)
INSERT INTO `registrosalida` (`idRegistroSalida`, `idEstacionamiento`, `nombre`, `tipo`, `placa`, `lavadoSolicitado`, `fechaHoraEntrada`, `fechaHoraSalida`, `total`) VALUES
	(20, 1, 'Jose', 'AUTO', 'I8O00P', 0, '2024-10-14 14:31:00', '2024-10-17 02:10:40', 295.00),
	(21, 1, 'Pablito', 'BUS', 'U4G657', 0, '2024-10-14 13:28:00', '2024-10-17 02:33:10', 305.00),
	(22, 1, 'Sofia Jimenez', 'AUTO', 'YZA567', 0, '2024-10-03 16:00:00', '2024-10-17 23:56:01', 1715.00);

-- Dumping structure for table Estacionamiento.suscripciones
CREATE TABLE IF NOT EXISTS `suscripciones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL DEFAULT '' COMMENT 'DNI del suscriptor',
  `placa` varchar(6) NOT NULL COMMENT 'Placa del suscriptor',
  `tarjeta` varchar(50) NOT NULL DEFAULT '' COMMENT 'Tarjeta encriptada',
  `plan` varchar(20) NOT NULL COMMENT 'Plan de suscripcion',
  `codigo_sorteo` char(9) NOT NULL COMMENT 'Código de sorteo de 9 dígitos',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo_sorteo` (`codigo_sorteo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla diseñada para guardar todas las suscripciones que se hagan.';

-- Dumping data for table Estacionamiento.suscripciones: ~11 rows (approximately)
INSERT INTO `suscripciones` (`id`, `dni`, `placa`, `tarjeta`, `plan`, `codigo_sorteo`) VALUES
	(1, '12345678', 'ABC123', '4111111111111111', 'gold', '423233878'),
	(2, '87654321', 'XYZ987', '4222222222222222', 'diamond', '242856275'),
	(3, '23456789', 'LMN456', '4333333333333333', 'radio', '944579773'),
	(4, '34567890', 'JKL789', '4444444444444444', 'gold', '994330071'),
	(5, '45678901', 'DEF321', '4555555555555555', 'radio', '137911069'),
	(6, '56789012', 'GHI654', '4666666666666666', 'diamond', '706565161'),
	(7, '76894512', 'AYK298', 'abeac07d3c28c1bef9e730002c753ed4', 'diamond', '855179671'),
	(8, '76723213', 'sad123', 'b03fba73fdb1bedc3031c190c00ca9da', 'gold', '628378933'),
	(9, '76723213', 'sad123', 'b03fba73fdb1bedc3031c190c00ca9da', 'gold', '576355686'),
	(10, '76723213', 'sad123', 'b03fba73fdb1bedc3031c190c00ca9da', 'gold', '996641663'),
	(11, '76723213', 'sad123', 'b03fba73fdb1bedc3031c190c00ca9da', 'gold', '254141289'),
	(12, '71843535', 'SLEEPT', 'b54df42eb648390b34dbc81a89fd987c', 'radio', '129856951');

-- Dumping structure for table Estacionamiento.vehiculo
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del vehículo',
  `placa` varchar(6) NOT NULL COMMENT 'Placa del vehículo (6 caracteres alfanuméricos)',
  `tipo` varchar(50) NOT NULL COMMENT 'Tipo de vehículo (Auto, Moto, etc.)',
  PRIMARY KEY (`idVehiculo`),
  UNIQUE KEY `placa` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los vehículos';

-- Dumping data for table Estacionamiento.vehiculo: ~9 rows (approximately)
INSERT INTO `vehiculo` (`idVehiculo`, `placa`, `tipo`) VALUES
	(2, 'DEF456', 'Moto'),
	(3, 'GHI789', 'Camioneta'),
	(4, 'JKL012', 'SUV'),
	(6, 'PQR678', 'Moto'),
	(7, 'STU901', 'Camioneta'),
	(8, 'VWX234', 'SUV'),
	(10, 'BCD890', 'Camion'),
	(15, 'J7N34E', 'CAMIONETA');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
