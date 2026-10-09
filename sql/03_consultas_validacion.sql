-- =====================================================================
-- Universidad del Caribe (UNICARIBE) - Escuela de Informatica
-- IND-101: Introduccion a la Ciencia de Datos
-- Unidad 2 - Actividad 2: Implementacion de la Base de Datos
-- Proyecto: Optimizacion de la Aprobacion de Creditos
-- Grupo 5: Angie Massiel Gonzalez Rivera, Bryan Misael Helena,
--          Jhonniel Garcia Samboy
-- Motor: MySQL 8.0
-- ARCHIVO 3 de 3: consultas de validacion y resumen
-- Cubre las Partes 5 y 6 de la actividad.
-- Requisito previo: haber ejecutado 01 y 02.
-- =====================================================================

USE Banco_Comercial;

-- =====================================================================
-- PARTE 5. VALIDACION MEDIANTE CONSULTAS SQL
-- =====================================================================

-- ---------------------------------------------------------------------
-- CONSULTA 1  ::  SELECT simple
-- Pregunta de negocio: que solicitudes se han registrado y con que
-- caracteristicas basicas?
-- Aporte al proyecto: ofrece la vista general de la cartera de
-- solicitudes, punto de partida de cualquier analisis del proceso.
-- ---------------------------------------------------------------------
SELECT ID_Solicitud, ID_Cliente, Fecha_Solicitud, Tipo_Producto,
       Monto_Solicitado, Plazo_Solicitado_Meses, Canal_Solicitud
FROM Solicitud_Credito;

-- ---------------------------------------------------------------------
-- CONSULTA 2  ::  WHERE
-- Pregunta de negocio: cuales clientes presentan creditos en mora o
-- atrasos historicos superiores a 30 dias?
-- Aporte al proyecto: identifica el segmento de mayor riesgo, sobre el
-- cual deben endurecerse los criterios de aprobacion.
-- ---------------------------------------------------------------------
SELECT ID_Cliente, Score_Buro, Creditos_Activos, Creditos_En_Mora,
       Dias_Max_Atraso_Historico, Deuda_Total_Actual
FROM Historial_Crediticio
WHERE Creditos_En_Mora > 0
   OR Dias_Max_Atraso_Historico > 30;

-- ---------------------------------------------------------------------
-- CONSULTA 3  ::  ORDER BY
-- Pregunta de negocio: cuales son las solicitudes de mayor monto?
-- Aporte al proyecto: las solicitudes de mayor cuantia concentran la
-- mayor exposicion economica del banco y ameritan revision prioritaria.
-- ---------------------------------------------------------------------
SELECT ID_Solicitud, Tipo_Producto, Monto_Solicitado, Canal_Solicitud,
       Fecha_Solicitud
FROM Solicitud_Credito
ORDER BY Monto_Solicitado DESC
LIMIT 15;

-- ---------------------------------------------------------------------
-- CONSULTA 4  ::  Funciones de agregacion (COUNT, SUM, AVG)
-- Pregunta de negocio: como se comporta la aprobacion segun el tipo de
-- producto solicitado?
-- Aporte al proyecto: revela en que productos se concentra el rechazo,
-- insumo directo para optimizar el proceso de aprobacion.
-- ---------------------------------------------------------------------
SELECT s.Tipo_Producto,
       COUNT(*)                                  AS Total_Solicitudes,
       SUM(CASE WHEN d.Resultado_Decision = 'Rechazado' THEN 1 ELSE 0 END) AS Rechazadas,
       ROUND(AVG(s.Monto_Solicitado), 2)         AS Monto_Promedio_Solicitado,
       ROUND(AVG(d.Tasa_Interes_Asignada), 2)    AS Tasa_Promedio
FROM Solicitud_Credito s
JOIN Decision_Credito d ON d.ID_Solicitud = s.ID_Solicitud
GROUP BY s.Tipo_Producto
ORDER BY Total_Solicitudes DESC;

-- ---------------------------------------------------------------------
-- CONSULTA 5  ::  JOIN de multiples tablas
-- Pregunta de negocio: coincide la categoria de riesgo estimada por el
-- modelo con la decision que finalmente se tomo?
-- Aporte al proyecto: es la consulta central del proyecto. Permite medir
-- la capacidad discriminante del modelo y detectar inconsistencias entre
-- lo que el modelo predijo y lo que el analista decidio.
-- ---------------------------------------------------------------------
SELECT c.Nombre_Completo,
       s.Tipo_Producto,
       s.Monto_Solicitado,
       e.Score_Interno,
       e.Categoria_Riesgo,
       d.Resultado_Decision,
       d.Monto_Aprobado,
       d.Analista_Responsable
FROM Cliente c
JOIN Solicitud_Credito s ON s.ID_Cliente   = c.ID_Cliente
JOIN Evaluacion_Riesgo  e ON e.ID_Solicitud = s.ID_Solicitud
JOIN Decision_Credito   d ON d.ID_Solicitud = s.ID_Solicitud
ORDER BY e.Score_Interno DESC
LIMIT 20;

-- ---------------------------------------------------------------------
-- CONSULTA 6  ::  JOIN + agregacion (tiempo de aprobacion por canal)
-- Pregunta de negocio: cuanto tarda en promedio una solicitud en ser
-- decidida, segun el canal por el que ingreso?
-- Aporte al proyecto: el tiempo promedio de aprobacion es uno de los
-- indicadores clave definidos para el proyecto; esta consulta identifica
-- cual canal genera los cuellos de botella.
-- ---------------------------------------------------------------------
SELECT s.Canal_Solicitud,
       COUNT(*) AS Solicitudes,
       ROUND(AVG(DATEDIFF(d.Fecha_Decision, s.Fecha_Solicitud)), 1) AS Dias_Promedio,
       MAX(DATEDIFF(d.Fecha_Decision, s.Fecha_Solicitud))           AS Dias_Maximo
FROM Solicitud_Credito s
JOIN Decision_Credito d ON d.ID_Solicitud = s.ID_Solicitud
GROUP BY s.Canal_Solicitud
ORDER BY Dias_Promedio DESC;

-- ---------------------------------------------------------------------
-- CONSULTA 7  ::  Consistencia entre analistas
-- Pregunta de negocio: aprueban todos los analistas con el mismo
-- criterio, o hay diferencias entre ellos?
-- Aporte al proyecto: mide directamente la consistencia entre analistas,
-- que es el problema central que el proyecto busca resolver.
-- ---------------------------------------------------------------------
SELECT COALESCE(d.Analista_Responsable, 'Decision automatica') AS Analista,
       COUNT(*) AS Casos_Evaluados,
       SUM(CASE WHEN d.Resultado_Decision LIKE 'Aprobado%' THEN 1 ELSE 0 END) AS Aprobados,
       ROUND(100.0 * SUM(CASE WHEN d.Resultado_Decision LIKE 'Aprobado%' THEN 1 ELSE 0 END)
             / COUNT(*), 1) AS Tasa_Aprobacion_Pct,
       ROUND(AVG(e.Score_Interno), 3) AS Riesgo_Promedio_Atendido
FROM Decision_Credito d
JOIN Evaluacion_Riesgo e ON e.ID_Solicitud = d.ID_Solicitud
GROUP BY d.Analista_Responsable
ORDER BY Tasa_Aprobacion_Pct DESC;

-- =====================================================================
-- PARTE 6. RESUMEN DE LA BASE DE DATOS
-- =====================================================================
SELECT 'Cliente' AS Tabla, COUNT(*) AS Registros FROM Cliente
UNION ALL SELECT 'Solicitud_Credito',    COUNT(*) FROM Solicitud_Credito
UNION ALL SELECT 'Historial_Crediticio', COUNT(*) FROM Historial_Crediticio
UNION ALL SELECT 'Evaluacion_Riesgo',    COUNT(*) FROM Evaluacion_Riesgo
UNION ALL SELECT 'Decision_Credito',     COUNT(*) FROM Decision_Credito
UNION ALL SELECT 'TOTAL', (SELECT COUNT(*) FROM Cliente)
                        + (SELECT COUNT(*) FROM Solicitud_Credito)
                        + (SELECT COUNT(*) FROM Historial_Crediticio)
                        + (SELECT COUNT(*) FROM Evaluacion_Riesgo)
                        + (SELECT COUNT(*) FROM Decision_Credito);
