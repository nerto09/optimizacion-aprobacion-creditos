# -*- coding: utf-8 -*-
# ============================================================
# UNICARIBE - IND-101 - Unidad 4, Actividad 2
# Visualizacion de Datos con Python y Matplotlib - Grupo 5
# Optimizacion de la Aprobacion de Creditos - Banco Comercial Nacional
# Codigo generado con IA (Gemini) y validado por el equipo
# ============================================================
import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

CSV = r"C:\Users\Jhonniel\Downloads\banco_comercial_solicitudes.csv"
OUT = (r"G:\My Drive\Vault Jhonniel\01 - Universidad\03 - Periodos\2026"
       r"\2026-08 - IND-101 - Ciencia de los Datos - Jueves Nocturno\04 - Tareas"
       r"\Unidad 4 - Herramientas Libres para Análisis de Datos"
       r"\Actividad 2 - Visualizacion\Graficos")

NAVY = "#1B3A6B"
BLUES = ["#1B3A6B", "#2E5A94", "#4E7FBF", "#7FA8D9", "#B8CDE8"]
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 11,
                     "axes.titlesize": 14, "axes.titleweight": "bold",
                     "figure.dpi": 130})

df = pd.read_csv(CSV)

# ---------- 1. BARRAS: solicitudes por tipo de producto ----------
fig, ax = plt.subplots(figsize=(8, 5))
vc = df["Tipo_Producto"].value_counts()
bars = ax.bar(vc.index, vc.values, color=NAVY)
ax.set_title("Solicitudes de crédito por tipo de producto")
ax.set_xlabel("Tipo de producto")
ax.set_ylabel("Número de solicitudes")
ax.bar_label(bars, padding=3)
plt.xticks(rotation=20, ha="right")
ax.spines[["top", "right"]].set_visible(False)
plt.tight_layout()
plt.savefig(OUT + r"\01-barras-productos.png"); plt.close()

# ---------- 2. LINEAS: solicitudes por mes ----------
df["Fecha_Solicitud"] = pd.to_datetime(df["Fecha_Solicitud"])
serie = df.set_index("Fecha_Solicitud").resample("MS").size()
meses = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
fig, ax = plt.subplots(figsize=(8, 5))
ax.plot(range(len(serie)), serie.values, marker="o", color=NAVY, linewidth=2)
ax.set_title("Evolución mensual de las solicitudes (2026)")
ax.set_xlabel("Mes")
ax.set_ylabel("Número de solicitudes")
ax.set_xticks(range(len(serie)))
ax.set_xticklabels([meses[d.month - 1] for d in serie.index])
for x, y in zip(range(len(serie)), serie.values):
    ax.annotate(str(y), (x, y), textcoords="offset points", xytext=(0, 8), ha="center")
ax.grid(axis="y", linestyle=":", alpha=0.5)
ax.spines[["top", "right"]].set_visible(False)
plt.tight_layout()
plt.savefig(OUT + r"\02-lineas-meses.png"); plt.close()

# ---------- 3. HISTOGRAMA: distribucion del monto solicitado ----------
fig, ax = plt.subplots(figsize=(8, 5))
montos_millones = df["Monto_Solicitado"] / 1_000_000
ax.hist(montos_millones, bins=12, color="#2E5A94", edgecolor="white")
ax.set_title("Distribución del monto solicitado")
ax.set_xlabel("Monto solicitado (millones de RD$)")
ax.set_ylabel("Número de solicitudes")
ax.axvline(montos_millones.mean(), color="#C0392B", linestyle="--", linewidth=2,
           label="Media: RD$%.2f M" % montos_millones.mean())
ax.axvline(montos_millones.median(), color="#27AE60", linestyle="--", linewidth=2,
           label="Mediana: RD$%.2f M" % montos_millones.median())
ax.legend()
ax.spines[["top", "right"]].set_visible(False)
plt.tight_layout()
plt.savefig(OUT + r"\03-histograma-montos.png"); plt.close()

# ---------- 4. DONA: distribucion del resultado de la decision ----------
fig, ax = plt.subplots(figsize=(7, 6))
rc = df["Resultado_Decision"].value_counts()
mapa_dec = {"Aprobado": "#1B3A6B", "Aprobado parcial": "#4E7FBF", "Rechazado": "#C0392B"}
colors = [mapa_dec.get(k, "#7FA8D9") for k in rc.index]
wedges, texts, autotexts = ax.pie(
    rc.values, labels=rc.index, autopct=lambda p: "%d\n(%.0f%%)" % (round(p * len(df) / 100), p),
    startangle=90, colors=colors, wedgeprops=dict(width=0.42, edgecolor="white"),
    pctdistance=0.78)
for t in autotexts:
    t.set_color("white"); t.set_fontweight("bold"); t.set_fontsize(10)
ax.set_title("Distribución de los resultados de la decisión")
plt.tight_layout()
plt.savefig(OUT + r"\04-dona-decision.png"); plt.close()

# ---------- 5. DISPERSION: riesgo vs monto, por resultado ----------
fig, ax = plt.subplots(figsize=(8.5, 5.5))
mapa = {"Aprobado": "#1B3A6B", "Aprobado parcial": "#4E7FBF", "Rechazado": "#C0392B"}
for res, col in mapa.items():
    sub = df[df["Resultado_Decision"] == res]
    ax.scatter(sub["Score_Interno"], sub["Monto_Solicitado"] / 1_000_000,
               c=col, label=res, s=70, alpha=0.8, edgecolors="white")
ax.set_title("Relación entre riesgo interno y monto solicitado")
ax.set_xlabel("Score de riesgo interno (0 = bajo, 1 = alto)")
ax.set_ylabel("Monto solicitado (millones de RD$)")
ax.legend(title="Resultado")
ax.grid(linestyle=":", alpha=0.4)
ax.spines[["top", "right"]].set_visible(False)
plt.tight_layout()
plt.savefig(OUT + r"\05-dispersion-riesgo-monto.png"); plt.close()

print("Graficos generados en:", OUT)
import os
for f in sorted(os.listdir(OUT)):
    print("  ", f)
# datos de apoyo para interpretacion
print("\n-- datos de apoyo --")
print("Productos:", dict(df["Tipo_Producto"].value_counts()))
print("Decision:", dict(df["Resultado_Decision"].value_counts()))
print("Monto media/mediana:", round(df.Monto_Solicitado.mean()), round(df.Monto_Solicitado.median()))
print("Solicitudes por mes:", dict(zip([d.strftime('%b') for d in serie.index], serie.values)))
