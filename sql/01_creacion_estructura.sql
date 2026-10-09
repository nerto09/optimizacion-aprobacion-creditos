-- =====================================================================
-- Universidad del Caribe (UNICARIBE) - Escuela de Informatica
-- IND-101: Introduccion a la Ciencia de Datos
-- Unidad 2 - Actividad 2: Implementacion de la Base de Datos
-- Proyecto: Optimizacion de la Aprobacion de Creditos
-- Grupo 5: Angie Massiel Gonzalez Rivera, Bryan Misael Helena,
--          Jhonniel Garcia Samboy
-- Motor: MySQL 8.0
-- ARCHIVO 1 de 3: creacion de la base de datos y las tablas
-- Cubre las Partes 2 y 3 de la actividad.
-- =====================================================================

-- ---------------------------------------------------------------------
-- PARTE 2. CREACION DE LA BASE DE DATOS
-- ---------------------------------------------------------------------
-- #####################################################################
-- #  ADVERTENCIA: la sentencia siguiente ELIMINA la base de datos     #
-- #  completa, con todos sus datos. Solo debe ejecutarse UNA VEZ, al  #
-- #  construir la base de datos desde cero.                           #
-- #                                                                   #
-- #  Si la base de datos YA EXISTE con los 290 registros cargados,    #
-- #  NO ejecute este archivo: volver a correrlo obliga a recargar     #
-- #  los datos con 02_carga_datos.sql.                                #
-- #####################################################################
DROP DATABASE IF EXISTS Banco_Comercial;
CREATE DATABASE Banco_Comercial
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE Banco_Comercial;

-- ---------------------------------------------------------------------
-- PARTE 3. IMPLEMENTACION DEL MODELO
-- ---------------------------------------------------------------------

CREATE TABLE Cliente (
    ID_Cliente               INT AUTO_INCREMENT PRIMARY KEY,
    Cedula_RNC               VARCHAR(20)   NOT NULL UNIQUE,
    Nombre_Completo          VARCHAR(150)  NOT NULL,
    Fecha_Nacimiento         DATE          NOT NULL,
    Genero                   VARCHAR(20),
    Estado_Civil             VARCHAR(20),
    Nivel_Educativo          VARCHAR(50),
    Ingreso_Mensual          DECIMAL(12,2) CHECK (Ingreso_Mensual >= 0),
    Tipo_Empleo              VARCHAR(50),
    Antiguedad_Laboral_Meses INT           CHECK (Antiguedad_Laboral_Meses >= 0),
    Telefono                 VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE Solicitud_Credito (
    ID_Solicitud           INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente             INT           NOT NULL,
    Fecha_Solicitud        DATE          NOT NULL,
    Tipo_Producto          VARCHAR(50)   NOT NULL,
    Monto_Solicitado       DECIMAL(12,2) NOT NULL CHECK (Monto_Solicitado > 0),
    Plazo_Solicitado_Meses INT           NOT NULL CHECK (Plazo_Solicitado_Meses > 0),
    Canal_Solicitud        VARCHAR(30),
    Estado_Solicitud       VARCHAR(30)   NOT NULL DEFAULT 'Recibida',
    CONSTRAINT fk_solicitud_cliente FOREIGN KEY (ID_Cliente)
        REFERENCES Cliente(ID_Cliente) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Historial_Crediticio (
    ID_Historial              INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente                INT  NOT NULL,
    Score_Buro                INT           CHECK (Score_Buro BETWEEN 300 AND 850),
    Creditos_Activos          INT           DEFAULT 0 CHECK (Creditos_Activos >= 0),
    Creditos_En_Mora          INT           DEFAULT 0 CHECK (Creditos_En_Mora >= 0),
    Dias_Max_Atraso_Historico INT           DEFAULT 0 CHECK (Dias_Max_Atraso_Historico >= 0),
    Deuda_Total_Actual        DECIMAL(12,2) DEFAULT 0 CHECK (Deuda_Total_Actual >= 0),
    Fecha_Consulta            DATE NOT NULL,
    CONSTRAINT fk_historial_cliente FOREIGN KEY (ID_Cliente)
        REFERENCES Cliente(ID_Cliente) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Evaluacion_Riesgo (
    ID_Evaluacion    INT AUTO_INCREMENT PRIMARY KEY,
    ID_Solicitud     INT           NOT NULL,
    Score_Interno    DECIMAL(4,2)  NOT NULL CHECK (Score_Interno BETWEEN 0 AND 1),
    Categoria_Riesgo VARCHAR(20)   NOT NULL,
    Fecha_Evaluacion DATE          NOT NULL,
    Version_Modelo   VARCHAR(10),
    CONSTRAINT fk_evaluacion_solicitud FOREIGN KEY (ID_Solicitud)
        REFERENCES Solicitud_Credito(ID_Solicitud) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Decision_Credito (
    ID_Decision           INT AUTO_INCREMENT PRIMARY KEY,
    ID_Solicitud          INT           NOT NULL,
    Resultado_Decision    VARCHAR(20)   NOT NULL,
    Monto_Aprobado        DECIMAL(12,2) CHECK (Monto_Aprobado >= 0),
    Tasa_Interes_Asignada DECIMAL(5,2)  CHECK (Tasa_Interes_Asignada >= 0),
    Analista_Responsable  VARCHAR(100),
    Fecha_Decision        DATE          NOT NULL,
    Motivo_Rechazo        VARCHAR(200),
    CONSTRAINT fk_decision_solicitud FOREIGN KEY (ID_Solicitud)
        REFERENCES Solicitud_Credito(ID_Solicitud) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Indices sobre las llaves foraneas para acelerar los JOIN
CREATE INDEX idx_solicitud_cliente    ON Solicitud_Credito(ID_Cliente);
CREATE INDEX idx_historial_cliente    ON Historial_Crediticio(ID_Cliente);
CREATE INDEX idx_evaluacion_solicitud ON Evaluacion_Riesgo(ID_Solicitud);
CREATE INDEX idx_decision_solicitud   ON Decision_Credito(ID_Solicitud);

-- ---------------------------------------------------------------------
-- VERIFICACION DE LA ESTRUCTURA (evidencia de la Parte 3)
-- ---------------------------------------------------------------------
SHOW TABLES;

-- Detalle de columnas, llaves y restricciones de cada tabla:
DESCRIBE Cliente;
DESCRIBE Solicitud_Credito;
DESCRIBE Historial_Crediticio;
DESCRIBE Evaluacion_Riesgo;
DESCRIBE Decision_Credito;

-- Listado de las llaves foraneas creadas:
SELECT TABLE_NAME        AS Tabla,
       COLUMN_NAME       AS Columna,
       CONSTRAINT_NAME   AS Restriccion,
       REFERENCED_TABLE_NAME  AS Tabla_Referenciada,
       REFERENCED_COLUMN_NAME AS Columna_Referenciada
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'Banco_Comercial'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;
