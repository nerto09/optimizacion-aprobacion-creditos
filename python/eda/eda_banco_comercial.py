# -*- coding: utf-8 -*-
# =====================================================================
# UNICARIBE - IND-101 - Unidad 4, Actividad 1
# Analisis Exploratorio de Datos (EDA) - Proyecto Grupo 5
# Optimizacion de la Aprobacion de Creditos - Banco Comercial Nacional
# Codigo generado con asistencia de IA (Gemini) y validado por el equipo
# =====================================================================
import pandas as pd

CSV = r"C:\Users\Jhonniel\Downloads\banco_comercial_solicitudes.csv"

def sep(t):
    print("\n" + "=" * 70)
    print(t)
    print("=" * 70)

# --- BLOQUE 1: Cargar el archivo CSV ---
sep("BLOQUE 1. Carga del archivo CSV")
df = pd.read_csv(CSV)
print("Archivo cargado correctamente:", CSV.split('\\')[-1])

# --- BLOQUE 2: Primeras cinco filas ---
sep("BLOQUE 2. Primeras 5 filas del conjunto de datos")
print(df.head().to_string())

# --- BLOQUE 3: Cantidad de filas y columnas ---
sep("BLOQUE 3. Dimensiones del conjunto de datos")
print("Filas:", df.shape[0])
print("Columnas:", df.shape[1])

# --- BLOQUE 4: Nombres de las columnas ---
sep("BLOQUE 4. Nombres de las columnas")
for i, c in enumerate(df.columns, 1):
    print("  %2d. %s" % (i, c))

# --- BLOQUE 5: Estructura y tipos de datos ---
sep("BLOQUE 5. Estructura y tipos de datos (info)")
df.info()

# --- BLOQUE 6: Estadisticas descriptivas (numericas) ---
sep("BLOQUE 6. Estadisticas descriptivas de columnas numericas")
print(df.describe().round(2).to_string())

# --- BLOQUE 7: Valores nulos por columna ---
sep("BLOQUE 7. Valores nulos por columna")
nulos = df.isnull().sum()
print(nulos[nulos >= 0].to_string())
print("\nTotal de valores nulos en el dataset:", int(df.isnull().sum().sum()))

# --- BLOQUE 8: Registros duplicados ---
sep("BLOQUE 8. Registros duplicados")
print("Filas duplicadas:", int(df.duplicated().sum()))

# --- BLOQUE 9: Conteo por categoria relevante ---
sep("BLOQUE 9. Conteo de registros por categoria relevante")
print(">> Solicitudes por Tipo_Producto:")
print(df["Tipo_Producto"].value_counts().to_string())
print("\n>> Resultado de la decision (aprobacion):")
print(df["Resultado_Decision"].value_counts().to_string())
print("\n>> Solicitudes por Categoria_Riesgo:")
print(df["Categoria_Riesgo"].value_counts().to_string())
print("\n>> Solicitudes por Canal_Solicitud:")
print(df["Canal_Solicitud"].value_counts().to_string())

# --- BLOQUE 10: Suma, promedio, minimo y maximo de variable numerica ---
sep("BLOQUE 10. Metricas de Monto_Solicitado (variable clave)")
m = df["Monto_Solicitado"]
print("Suma total solicitada : {:,.2f}".format(m.sum()))
print("Promedio solicitado   : {:,.2f}".format(m.mean()))
print("Monto minimo          : {:,.2f}".format(m.min()))
print("Monto maximo          : {:,.2f}".format(m.max()))

# --- BLOQUE 11: Resumen de hallazgos ---
sep("BLOQUE 11. Resumen de los principales resultados")
tasa_aprob = (df["Resultado_Decision"] != "Rechazado").mean() * 100
print("- Total de solicitudes analizadas : {:d}".format(len(df)))
print("- Monto total solicitado          : RD$ {:,.2f}".format(m.sum()))
print("- Tasa de aprobacion              : {:.2f} %".format(tasa_aprob))
print("- Riesgo interno promedio (0-1)   : {:.2f}".format(df["Score_Interno"].mean()))
print("- Producto mas solicitado         : {} ({:d})".format(
    df["Tipo_Producto"].value_counts().index[0],
    int(df["Tipo_Producto"].value_counts().iloc[0])))
print("- Ingreso mensual promedio        : RD$ {:,.2f}".format(df["Ingreso_Mensual"].mean()))
print("- Score de buro promedio          : {:.0f}".format(df["Score_Buro"].mean()))
