# Optimización de la Aprobación de Créditos — Banco Comercial Nacional

Proyecto integrador final de la asignatura **IND-101 — Introducción a la Ciencia de Datos** en la **Universidad del Caribe (UNICARIBE)**, Escuela de Informática, cuatrimestre agosto 2026.

El caso: un banco comercial dominicano cuyo proceso de aprobación de créditos presenta criterios no uniformes entre analistas y tiempos de decisión desacoplados de la complejidad de los expedientes. Analizamos **60 solicitudes** por un total de **RD$93.5 millones** entre enero y agosto de 2026, con el objetivo de identificar oportunidades de optimización sin requerir inversión tecnológica adicional.

> La lección más importante del proyecto es que el valor no reside en la herramienta sino en la interpretación.

---

## Stack

- **MySQL 8.0** — base de datos relacional: 5 entidades (Cliente, Solicitud, Historial, Evaluación, Decisión), 290 registros, PK/FK y restricciones.
- **Power BI Desktop** — dashboard con 5 KPIs, segmentadores por producto, canal y analista.
- **Python 3.11+** — `pandas`, `numpy`, `matplotlib`. EDA, visualización y análisis descriptivo (curva de Lorenz, Gini, correlaciones, tabla de contingencia).
- **Metodología CRISP-DM** (comprensión del negocio → datos → preparación → análisis → evaluación).
- **IA de apoyo:** Gemini para generación de código base; el equipo verificó salidas y conservó el criterio analítico.

---

## Estructura del repositorio

```
.
├── sql/           01-03 scripts de creación, carga y validación + backup
├── python/        EDA, visualización y análisis descriptivo (notebooks + .py)
├── data/          banco_comercial_solicitudes.csv (60 filas, 15 columnas)
├── docs/          Informe Ejecutivo, Libreto, Presentación y propuesta inicial
└── evidencias/    Capturas por etapa (DER, MySQL, Power BI, Python, gráficos)
```

---

## Cómo reproducirlo

### 1. Base de datos

```powershell
mysql -u root -p < sql\01_creacion_estructura.sql
mysql -u root -p < sql\02_carga_datos.sql
mysql -u root -p < sql\03_consultas_validacion.sql
```

El script `01` elimina la base `Banco_Comercial` si existe y la vuelve a crear — no lo ejecutes dos veces sin hacer backup. Como alternativa rápida, `sql/Banco_Comercial_backup.sql` contiene un volcado completo de la base poblada.

### 2. Entorno Python

```powershell
pip install -r requirements.txt
```

### 3. Análisis EDA (Unidad 4 — Actividad 1)

```powershell
python python\eda\eda_banco_comercial.py
```

o bien abrí `python/eda/EDA_Banco_Comercial_Grupo5.ipynb` en Jupyter / Colab (subí el CSV de `data/`).

### 4. Visualización (Unidad 4 — Actividad 2)

```powershell
python python\visualizacion\visualizacion_banco_comercial.py
```

### 5. Análisis descriptivo final (Unidad 5)

```powershell
python python\analisis-descriptivo\analisis_descriptivo.py
python python\analisis-descriptivo\graficos_analisis.py
```

### 6. Dashboard en Power BI

El `.pbix` no se versiona en este repo. Las 8 capturas del dashboard final están en [`evidencias/powerbi/`](evidencias/powerbi/). Para reconstruirlo, conectar Power BI Desktop a la base MySQL `Banco_Comercial` con el conector MySQL Connector/NET (requisito previo).

---

## Hallazgos principales

El informe completo está en [`docs/Informe Ejecutivo Final - Grupo 5.docx`](docs/Informe%20Ejecutivo%20Final%20-%20Grupo%205.docx). Resumen de los seis hallazgos:

| # | Hallazgo | Métrica clave |
|---|----------|---------------|
| 1 | Concentración del riesgo en un solo producto | Préstamo hipotecario = 75.69% del monto · **Gini 0.6280** |
| 2 | Inconsistencia entre analistas | 23.81 pp de diferencia en tasa de aprobación con carteras de riesgo equivalente |
| 3 | Tiempo de decisión desacoplado de la complejidad | 6.73 días promedio · correlación con monto 0.049 · con riesgo -0.010 |
| 4 | El canal más moderno es el más lento | App móvil 8.11 días vs. banca en línea 5.62 |
| 5 | Decisión automática por debajo de su capacidad | Solo 20% automatizado · riesgo promedio 0.11 vs. 0.26–0.35 humano |
| 6 | El modelo de riesgo funciona | 100% riesgo bajo aprobado · 100% riesgo muy alto rechazado |

---

## Validación cruzada SQL / DAX / Python

Los cinco indicadores clave fueron calculados **de forma independiente** en las tres herramientas y los tres caminos arrojaron valores idénticos. Esa triangulación es lo que le da confianza al informe.

| Indicador | SQL (MySQL) | DAX (Power BI) | Pandas (Python) |
|-----------|-------------|----------------|-----------------|
| Monto total solicitado | RD$93,553,324.86 | RD$93,553,324.86 | RD$93,553,324.86 |
| Tasa de aprobación | 65.00% | 65.00% | 65.00% |
| Riesgo promedio | 0.30 | 0.31 (redondeo) | 0.30 |
| Score de buró promedio | 578.63 | 578.63 | 578.63 |
| Total de solicitudes | 60 | 60 | 60 |

---

## Recomendaciones a la alta dirección

1. **Tarjeta de puntuación formal** — traducir el score de riesgo en una recomendación de decisión reglada + sesiones de calibración entre analistas.
2. **Tramos de aprobación por monto** — concentrar el escrutinio en los expedientes de mayor exposición (8 solicitudes concentran 48.1% del capital).
3. **Rediseño del flujo digital posterior a la captura** — intervenir la app móvil (hasta 2.65 días de oportunidad).
4. **Ampliar la decisión automática** — subir gradualmente el umbral con monitoreo.
5. **Revisar política del préstamo hipotecario** — mayor exposición, mayor riesgo, menor tasa de aprobación, todos los atípicos.
6. **Dashboard mensual** — adoptar el tablero como sistema de alerta temprana.

Plan de acción completo (corto / mediano / largo plazo) en el informe ejecutivo.

---

## Evidencias

| Carpeta | Qué contiene |
|---------|--------------|
| [`evidencias/der/`](evidencias/der/) | DER generado en drawDB y captura de la herramienta |
| [`evidencias/mysql/`](evidencias/mysql/) | 21 capturas: instalación de MySQL Workbench, conexión, estructura, carga, consultas, backup |
| [`evidencias/powerbi/`](evidencias/powerbi/) | 8 capturas del dashboard: KPIs, gráficos, matriz de analistas, segmentadores |
| [`evidencias/python-eda/`](evidencias/python-eda/) | Carga del CSV y salidas del análisis exploratorio en Colab |
| [`evidencias/python-visualizacion/`](evidencias/python-visualizacion/) | Capturas del notebook de visualización |
| [`evidencias/graficos-finales/`](evidencias/graficos-finales/) | 9 gráficos del informe ejecutivo (Lorenz, concentración, dashboard, DER, Colab) |

---

## Equipo

- **Angie Massiel González Rivera** · A00xxxxx
- **Bryan Misael Helena** · A00xxxxx
- **Jhonniel García Samboy** · A00182637

**Facilitador:** Manuel Arturo Naut Fernández.

**Grupo 5 · Agosto 2026**

---

## Licencia

[MIT](LICENSE). El informe ejecutivo y la presentación en `docs/` son el entregable académico original del Grupo 5 — mantenga la atribución al reutilizar.
