-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.16-MariaDB - FreeBSD Ports
-- SO del servidor:              FreeBSD13.2
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para alquiler
CREATE DATABASE IF NOT EXISTS `alquiler` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `alquiler`;

-- Volcando estructura para tabla alquiler.administrador
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

-- Volcando datos para la tabla alquiler.administrador: ~10 rows (aproximadamente)
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

-- Volcando estructura para tabla alquiler.conductor
CREATE TABLE IF NOT EXISTS `conductor` (
  `idConductor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del conductor',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del conductor, entre 2 y 20 caracteres',
  `dni` char(8) NOT NULL COMMENT 'Documento Nacional de Identidad del conductor, 8 dígitos',
  PRIMARY KEY (`idConductor`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los datos de los conductores';

-- Volcando datos para la tabla alquiler.conductor: ~18 rows (aproximadamente)
INSERT INTO `conductor` (`idConductor`, `nombre`, `dni`) VALUES
	(4, 'Ana Torres', '45678901'),
	(7, 'Laura Gomez', '78901234'),
	(10, 'Miguel Diaz', '01234567'),
	(18, 'Juanpi', '89453624'),
	(21, 'Ayrton', '30561233'),
	(22, 'Cristian', '98098076'),
	(24, 'Luis', '98794645'),
	(25, 'Rosa', '78563411'),
	(26, 'Sebastian', '89567734'),
	(27, 'Marco', '78904566'),
	(28, 'Derick', '97823067'),
	(29, 'Manuel', '90578284'),
	(31, 'Enrique', '70645287'),
	(32, 'Juanpi', '76896543'),
	(33, 'Juanpi Sanandres', '98457362'),
	(34, 'Paul chevo', '90747387'),
	(35, 'Paul Campos', '74873883'),
	(36, 'Detonamo Angie', '78463782');

-- Volcando estructura para tabla alquiler.estacionamiento
CREATE TABLE IF NOT EXISTS `estacionamiento` (
  `idEstacionamiento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del estacionamiento',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del estacionamiento',
  `idAdministrador` int(11) NOT NULL COMMENT 'Identificador único del administrador asignado',
  PRIMARY KEY (`idEstacionamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los estacionamientos disponibles';

-- Volcando datos para la tabla alquiler.estacionamiento: ~10 rows (aproximadamente)
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

-- Volcando estructura para procedimiento alquiler.mostrar_suscripciones
DELIMITER //
CREATE PROCEDURE `mostrar_suscripciones`()
BEGIN
    SELECT dni, placa, plan, codigo_sorteo
    FROM suscripciones;
END//
DELIMITER ;

-- Volcando estructura para procedimiento alquiler.pr_AgregarAdministrador
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

-- Volcando estructura para procedimiento alquiler.pr_EditarClaveAdministrador
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

-- Volcando estructura para procedimiento alquiler.pr_MostrarConductorporId
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

-- Volcando estructura para procedimiento alquiler.pr_MostrarRegistrosEntrada
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

-- Volcando estructura para procedimiento alquiler.pr_MostrarRegistrosSalida
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

-- Volcando estructura para procedimiento alquiler.pr_RegistrarEntrada
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

-- Volcando estructura para procedimiento alquiler.pr_RegistrarSalida
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

-- Volcando estructura para procedimiento alquiler.pr_RegistroSalidaApi
DELIMITER //
CREATE PROCEDURE `pr_RegistroSalidaApi`(
	IN `p_idRegistroEntrada` INT,
	IN `p_fechaHoraSalida` DATETIME,
	IN `p_total` DOUBLE(11,2)
)
    COMMENT 'Registra la salida del conductor ingresando su id'
BEGIN

	 DECLARE v_idConductor INT;
    DECLARE v_idVehiculo INT;
    DECLARE v_nombreConductor VARCHAR(255);
    DECLARE v_placaVehiculo VARCHAR(20);
    DECLARE v_tipoVehiculo VARCHAR(50);
    DECLARE v_fechaHoraEntrada DATETIME;
    DECLARE v_lavadoSolicitado BOOLEAN;
	
	 IF EXISTS (SELECT 1 FROM registroentrada WHERE idRegistroEntrada = p_idRegistroEntrada) THEN
		
		SELECT idvehiculo, idconductor, fechahoraentrada, lavadosolicitado INTO v_idVehiculo, v_idConductor, v_fechaHoraEntrada, v_lavadoSolicitado FROM registroentrada WHERE idregistroentrada = p_idRegistroEntrada;
		SELECT nombre INTO v_nombreConductor FROM conductor WHERE idconductor = v_idConductor;
		SELECT placa, tipo INTO v_placaVehiculo, v_tipoVehiculo FROM vehiculo WHERE idvehiculo = v_idVehiculo;
		
		
	    DELETE FROM registroentrada WHERE idRegistroEntrada = p_idRegistroEntrada;
	    DELETE FROM conductor WHERE idConductor = v_idConductor;
	    DELETE FROM vehiculo WHERE idVehiculo = v_idVehiculo;
	    INSERT INTO registrosalida (idEstacionamiento, nombre, tipo, placa, lavadoSolicitado, fechaHoraEntrada, fechaHoraSalida, total)
	        VALUES (1, v_nombreConductor, v_tipoVehiculo, v_placaVehiculo, v_lavadoSolicitado, v_fechaHoraEntrada, p_fechaHoraSalida, p_total);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registro de entrada no existe';
    END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento alquiler.pr_VerificarCredencialesAdministrador
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

-- Volcando estructura para procedimiento alquiler.registrar_suscripcion
DELIMITER //
CREATE PROCEDURE `registrar_suscripcion`(
    IN p_dni INT(8),
    IN p_placa VARCHAR(6),
    IN p_tarjeta VARCHAR(50),
    IN p_plan VARCHAR(20)
)
BEGIN
    DECLARE p_codigo_sorteo CHAR(9);
    DECLARE codigo_existe INT DEFAULT 1;
    DECLARE intento INT DEFAULT 0;
    DECLARE max_intentos INT DEFAULT 10;

    -- Loop hasta encontrar un código único o alcanzar el máximo de intentos
    WHILE codigo_existe > 0 AND intento < max_intentos DO
        -- Generar código aleatorio de 9 dígitos
        SET p_codigo_sorteo = LPAD(FLOOR(RAND() * 1000000000), 9, '0');
        
        -- Verificar si el código ya existe en la tabla
        SELECT COUNT(*) INTO codigo_existe
        FROM suscripciones
        WHERE codigo_sorteo = p_codigo_sorteo;

        -- Incrementar el contador de intentos
        SET intento = intento + 1;
    END WHILE;

    -- Si alcanzamos el límite de intentos, lanzamos un error
    IF intento = max_intentos THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pudo generar un código de sorteo único.';
    END IF;

    -- Insertar la suscripción con el código único
    INSERT INTO suscripciones (dni, placa, tarjeta, plan, codigo_sorteo)
    VALUES (p_dni, p_placa, p_tarjeta, p_plan, p_codigo_sorteo);
END//
DELIMITER ;

-- Volcando estructura para tabla alquiler.registroentrada
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los registros de entrada de vehículos';

-- Volcando datos para la tabla alquiler.registroentrada: ~16 rows (aproximadamente)
INSERT INTO `registroentrada` (`idRegistroEntrada`, `idEstacionamiento`, `idConductor`, `idVehiculo`, `fechaHoraEntrada`, `lavadoSolicitado`) VALUES
	(4, 4, 4, 4, '2024-10-02 11:00:00', 0),
	(19, 1, 18, 19, '2024-12-07 01:24:00', 0),
	(23, 1, 21, 22, '2024-12-07 02:27:00', 1),
	(24, 1, 22, 23, '2024-12-07 02:09:00', 0),
	(26, 1, 24, 25, '2024-12-07 04:20:00', 1),
	(27, 1, 25, 26, '2024-12-07 02:20:00', 1),
	(28, 1, 26, 27, '2024-12-07 02:32:00', 1),
	(29, 1, 27, 28, '2024-12-07 02:36:00', 0),
	(30, 1, 28, 29, '2024-12-08 12:42:00', 1),
	(31, 1, 29, 30, '2024-12-08 12:44:00', 1),
	(33, 1, 31, 32, '2024-12-09 12:48:00', 1),
	(34, 1, 32, 33, '2024-12-10 00:11:00', 0),
	(35, 1, 33, 34, '2024-12-09 00:31:00', 0),
	(36, 1, 34, 35, '2024-12-09 00:34:00', 1),
	(37, 1, 35, 36, '2024-12-09 00:57:00', 1),
	(38, 1, 36, 37, '2024-12-09 02:20:00', 1);

-- Volcando estructura para tabla alquiler.registrosalida
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los registros de salida de vehículos y el fin de la reserva';

-- Volcando datos para la tabla alquiler.registrosalida: ~13 rows (aproximadamente)
INSERT INTO `registrosalida` (`idRegistroSalida`, `idEstacionamiento`, `nombre`, `tipo`, `placa`, `lavadoSolicitado`, `fechaHoraEntrada`, `fechaHoraSalida`, `total`) VALUES
	(20, 1, 'Jose', 'AUTO', 'I8O00P', 0, '2024-10-14 14:31:00', '2024-10-17 02:10:40', 295.00),
	(21, 1, 'Pablito', 'BUS', 'U4G657', 0, '2024-10-14 13:28:00', '2024-10-17 02:33:10', 305.00),
	(22, 1, 'Sofia Jimenez', 'AUTO', 'YZA567', 0, '2024-10-03 16:00:00', '2024-10-17 23:56:01', 1715.00),
	(23, 1, 'María Lopez', 'MOTO', 'DEF456', 0, '2024-10-01 09:00:00', '2024-12-06 23:29:53', 7990.00),
	(24, 1, 'Juan Garcia', 'CAMIONETA', 'GHI789', 0, '2024-10-01 10:00:00', '2024-12-06 23:30:07', 7985.00),
	(25, 1, 'Piero', 'BUS', 'K9I00O', 0, '2024-12-07 01:24:00', '2024-12-07 01:25:48', 0.00),
	(26, 1, 'Pablo', 'MOTO', 'HU7OI0', 0, '2024-12-07 02:13:00', '2024-12-07 02:37:20', 0.00),
	(27, 1, 'Renzo', 'CUATRIMOTO', 'KL90PÑ', 0, '2024-12-07 01:41:00', '2024-12-07 02:37:36', 0.00),
	(28, 1, 'Jorge Ruiz', 'SUV', 'VWX234', 0, '2024-10-03 15:00:00', '2024-12-07 02:37:40', 7735.00),
	(29, 1, 'Angelo', 'CAMIONETA', 'FG7TY1', 0, '2024-12-09 12:46:00', '2024-12-07 12:49:29', 0.00),
	(30, 1, 'Pedro Sanchez', 'Moto', 'PQR678', 0, '2024-10-02 13:00:00', '2024-12-09 03:05:00', 1.00),
	(31, 1, 'Renzo Rojas', 'AUTO', 'JU9LS2', 1, '2024-12-09 02:22:00', '2024-12-09 03:05:00', 1.00),
	(32, 1, 'Fernando', 'MOTO', 'OP5LO4', 1, '2024-12-07 01:46:00', '2024-12-09 04:03:55', 250.00);

-- Volcando estructura para tabla alquiler.suscripciones
CREATE TABLE IF NOT EXISTS `suscripciones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL DEFAULT '' COMMENT 'DNI del suscriptor',
  `placa` varchar(6) NOT NULL COMMENT 'Placa del suscriptor',
  `tarjeta` varchar(50) NOT NULL DEFAULT '' COMMENT 'Tarjeta encriptada',
  `plan` varchar(20) NOT NULL COMMENT 'Plan de suscripcion',
  `codigo_sorteo` char(9) NOT NULL COMMENT 'Código de sorteo de 9 dígitos',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo_sorteo` (`codigo_sorteo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla diseñada para guardar todas las suscripciones que se hagan.';

-- Volcando datos para la tabla alquiler.suscripciones: ~28 rows (aproximadamente)
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
	(12, '71843535', 'SLEEPT', 'b54df42eb648390b34dbc81a89fd987c', 'radio', '129856951'),
	(13, '76496734', 'JI0JP3', '3ea51532da25ce98ca394a6629637d22', 'diamond', '667576043'),
	(14, '76496737', 'JI0HJ9', '3ea51532da25ce98ca394a6629637d22', 'radio', '356810547'),
	(15, '89740582', 'K3OH25', '5910f4ea0062a0e29afd3dccc741e3ce', 'gold', '781324638'),
	(16, '96074822', 'NV8KI9', 'bbdc31fa1d1692a29f55b6cdf7a4cdbb', 'radio', '836191581'),
	(17, '67398023', 'HG7YT8', '9b8a421bff5f30d20f118185eb6e4523', 'diamond', '836984021'),
	(18, '56483422', 'DSJ87L', 'bbc0ba70efd34473f1519050b3c0cab5', 'radio', '676345393'),
	(19, '76598023', 'FT6KO1', '528cbb4b4516adaf12d61b0439a0390a', 'diamond', '870774934'),
	(20, '78645632', 'JK7GY5', 'a2fd21061454b478daa8594e079ff2d5', 'gold', '324838524'),
	(21, '88447457', 'JI9OL2', '716f9480fc58d032f7c4431f3f25cc33', 'diamond', '737130925'),
	(22, '12333', 'HU2', '99d6416213596471b4d81a824f0215e2', 'gold', '743413094'),
	(23, '4562', 'KI9', '1f63b55cff126f38187188cdacb51f6f', 'radio', '505672724'),
	(24, '4562', 'KI9', '1f63b55cff126f38187188cdacb51f6f', 'radio', '298124370'),
	(25, '7823', 'JI9S', '996bb073fa1c3f18ee148988e208809c', 'gold', '973603709'),
	(26, '23457272', 'JU8IKI', 'cf2099d3eaa453ba49e8d1e9f243e793', 'diamond', '973645467'),
	(27, '71878524', 'XXXHTL', '9b8a421bff5f30d20f118185eb6e4523', 'null', '151557508'),
	(28, '89453726', 'MKLR23', 'c83b0d1db408e9ad8faacdc0bb71afb7', 'gold', '305303803');

-- Volcando estructura para tabla alquiler.vehiculo
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del vehículo',
  `placa` varchar(6) NOT NULL COMMENT 'Placa del vehículo (6 caracteres alfanuméricos)',
  `tipo` varchar(50) NOT NULL COMMENT 'Tipo de vehículo (Auto, Moto, etc.)',
  PRIMARY KEY (`idVehiculo`),
  UNIQUE KEY `placa` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que almacena los vehículos';

-- Volcando datos para la tabla alquiler.vehiculo: ~19 rows (aproximadamente)
INSERT INTO `vehiculo` (`idVehiculo`, `placa`, `tipo`) VALUES
	(4, 'JKL012', 'SUV'),
	(7, 'STU901', 'Camioneta'),
	(10, 'BCD890', 'Camion'),
	(15, 'J7N34E', 'CAMIONETA'),
	(19, 'K9I08P', 'BUS'),
	(22, 'JUY78E', 'MOTO'),
	(23, 'JM8NN6', 'AUTO'),
	(25, 'JH0TY6', 'MOTO'),
	(26, 'MN0JP2', 'BUS'),
	(27, 'JK9JP0', 'MOTO'),
	(28, 'IO0PU8', 'COMBI'),
	(29, 'GH7TY3', 'MOTO'),
	(30, 'IO9LK2', 'SUV'),
	(32, 'JUI8TY', 'SUV'),
	(33, 'JIU29O', 'MOTO'),
	(34, 'JH8UY2', 'SUV'),
	(35, 'JI9HY2', 'CUATRIMOTO'),
	(36, 'JIU3KO', 'SUV'),
	(37, 'GT7LO2', 'COMBI');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
